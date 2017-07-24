#include "Cmd/cmd.pb.h"
#include "Cmd/cmdid.pb.h"
#include "Cmd/server.pb.h"
#include "Cmd/texas.pb.h"
#include "Cmd/utils.h"
#include "Cmd/state.pb.h"

#include "Framework/z_encoder.h"
#include "Framework/z_decoder.h"
#include "Framework/z_time.h"
#include "Framework/z_string_tool.h"

#include "GameLib/icpack/TexasPacket.h"
#include "GameLib/icpack/TexasPacketHandle.h"

#include "access_task.h"
#include "access_task_manager.h"
#include "access_task_parser.h"
#include "access_httpclient.h"
#include "access_intertask.h"
#include "access_intertask_manager.h"
#include "access_config_manager.h"

static bool processNullHeartBeat(ZTask* task, const void* msg, const uint16 msglen) {
	AccessTask *at = (AccessTask*)task;
	network::cmd::PBNullHeartBeat rev;
	rev.set_timestamp(ZTime::getCurrentTimeSec());
	return at->sendEncodedPbCmdToMe(network::cmd::PBMainCmdID_Null, network::cmd::PBSubCmdID_NullHeartBeat, rev);
}

static bool processNullHeartBeatServerToClient(ZTask* task, const void* msg, const uint16 msglen) {
	AccessTask *at = (AccessTask*)task;
	network::cmd::PBNullHeartBeatServerToClient rev;
	rev.ParsePartialFromArray(msg, msglen);
	//ZDEBUG("client network delay:%p,%llu,%llu(ms)", task, task->id(), ZTime::getCurrentTime()-rev.timestamp());
	at->onPong();
	return true;
}

static bool processNullLogout(ZTask* task, const void* msg, const uint16 msglen) {
	AccessTask *at = (AccessTask*)task;
	network::cmd::PBNullLogout rev;
	rev.ParsePartialFromArray(msg, msglen);

	ZDEBUG("logout:%lu,%llu", rev.uid(),task->id());
	if(at->id() == (uint64)rev.uid()) {
		AccessTaskManager::getInstance().removeTask(at);
		at->onLogout();
		at->setBindUid(false);
		at->setId(at->loginid());
		rev.set_success(1);
		ZDEBUG("logout access:%lu,%u,%llu", rev.uid(),rev.success(),at->loginid());
	}
	at->sendEncodedPbCmdToMe(network::cmd::PBMainCmdID_Null, network::cmd::PBSubCmdID_NullLogout, rev);

	return true;
}

static bool processdLoginServer(ZTask* task, const void* msg, const uint16 msglen) {
	AccessTask* at = (AccessTask*)task;
	return AccessHttpClient::req(AccessConfigManager::getInstance().getWebAddr(), at, msg, msglen);
}

static bool processServerCmd(ZTask* task, const void* msg, const uint16 msglen) {
	BPTExternalHeader h;
	memcpy(&h, msg, sizeof(h));
	ZDecoder<BPTExternalHeader> dec((char*)&h, sizeof(h));
	CheckCondition(dec.decode(h), false);

	AccessTask* at = (AccessTask*)task;
	network::cmd::PBNotifyServiceUnavailable send;
	send.set_type(h.maincmd);
	//ZDEBUG("processServerCmd:%u,%u,%llu,%u,%u,%u",h.maincmd,h.subcmd,task->id(),h.bodylen,h.dataSize(),h.headlen);
	///<只允许登陆相关消息
	if(network::cmd::PBMainCmdID_Login == h.maincmd) {
		ZDEBUG("LoginCmd:%p,%u,%u,%llu,%u,%u,%u",at,h.maincmd,h.subcmd,at->id(),h.bodylen,h.dataSize(),h.headlen);
		return processdLoginServer(task, msg, msglen);
	} else if(network::cmd::PBMainCmdID_State == h.maincmd) {
		ZDEBUG("StateCmd:%p,%u,%u,%llu,%u,%u,%u",at,h.maincmd,h.subcmd,at->id(),h.bodylen,h.dataSize(),h.headlen);
		AccessInterTask * ait = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskByType(h.maincmd);
		if(ait) {
			//network::cmd::PBLoginState rev;
			//rev.ParsePartialFromArray(((char*)msg)+h.headlen, h.dataSize());
			return ait->sendEncodedCmd(network::inter::ServerCmdType_Client, 0, 0, task->id(), msg, msglen);
		} else {
			network::cmd::PBLoginState rev;
			rev.ParsePartialFromArray(((char*)msg)+h.headlen, h.dataSize());
			network::cmd::PBLoginStateRet ret;
			if(rev.has_context()) {
				ret.set_allocated_context(rev.mutable_context());
			}
			ret.set_uid(rev.uid());
			ret.set_ret(false);
			at->sendEncodedPbCmdToMe(network::cmd::PBMainCmdID_State, network::cmd::PBStateSubCmdID_LoginStateRet, ret);
			if(rev.has_context()) {
				ret.release_context();
			}
		}
	}
	///<没认证过的连接直接丢弃操作
	LogCheckCondition(at->isBindUid(), false, "user(%llu)no auth", task->id());

	///<合法连接请求包处理
	if(AccessConfigManager::getInstance().isPHPMsg(h.maincmd)) {
		return processdLoginServer(task, msg, msglen);
	} else if(h.maincmd == network::cmd::PBMainCmdID_TList && h.subcmd == network::cmd::PBTListSubCmdID_SearchTableReq) {
		network::cmd::PBReqSearchTable rev;
		rev.ParsePartialFromArray(((char*)msg)+h.headlen, h.dataSize());
		LogCheckCondition(8 == rev.txt().size() && ZStringTool::is_numeric(rev.txt()), false, "search invalid id:%s", rev.txt().c_str());
		uint32 flag = (ZStringTool::integer(rev.txt().substr(0, 2)) << 16) | ZStringTool::integer(rev.txt().substr(2, 2));
		AccessInterTask * ait = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskById(flag);
		if(ait) {
			return ait->sendEncodedCmd(network::inter::ServerCmdType_Client, 0, 0, task->id(), msg, msglen);
		} else {
			ZDEBUG("service unavaiable:%u", flag);
			send.set_flag(flag);
			at->sendEncodedPbCmdToMe(network::cmd::PBMainCmdID_Null, network::cmd::PBNullSubCmdID_NotifyServiceUnavailable, send);
		}
	} else if(h.maincmd == network::cmd::PBMainCmdID_Texas) {
		network::cmd::PBTableCmd rev;
		rev.ParsePartialFromArray(((char*)msg)+h.headlen, h.dataSize());
		AccessInterTask * ait = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskById(rev.idx().flag());
		//ZDEBUG("桌子信息:stype %lu,sid %lu flag %lu point %p", (rev.idx().flag() >> 16) & 0xffff, rev.idx().flag() & 0xffff, rev.idx().flag(), ait);
		if(ait) {
			return ait->sendEncodedCmd(network::inter::ServerCmdType_Client, 0, 0, task->id(), msg, msglen);
		} else {
			ZDEBUG("service unavaiable:%lu", rev.idx().flag());
			send.set_flag(rev.idx().flag());
			at->sendEncodedPbCmdToMe(network::cmd::PBMainCmdID_Null, network::cmd::PBNullSubCmdID_NotifyServiceUnavailable, send);
		}
	} else if (network::cmd::PBMainCmdID_Link == h.maincmd) {
		at->sendToLinkFromClient(msg, msglen);//特殊处理多个linkserver的亲缘性，保证包时序
	} else if (network::cmd::PBMainCmdID_Chat == h.maincmd) {
		at->sendToChatFromClient(msg, msglen);//特殊处理多个chatserver的亲缘性，保证包时序
	} else {
		AccessInterTask * ait = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskByType(h.maincmd);
		if(ait) {
			return ait->sendEncodedCmd(network::inter::ServerCmdType_Client, 0, 0, task->id(), msg, msglen);
		} else {
			at->sendEncodedPbCmdToMe(network::cmd::PBMainCmdID_Null, network::cmd::PBNullSubCmdID_NotifyServiceUnavailable, send);
		}
	}
	return false;
}

static bool sendToOldTexasClient(ZTask* task, int cmd){
	NETOutputPacket sendPacket;
	sendPacket.Begin(cmd);
	sendPacket.End();
	EncryptBuffer(&sendPacket);
	return task->sendCmd(sendPacket.packet_buf(), sendPacket.packet_size());
}

static bool processOldTexasProxyCmd(ZTask* task, const void* msg, const uint16 msglen){
	enum ICCmdID {
		CLIENT_COMMAND_LOGIN = 0x1001,      //玩家登陆
		CLIENT_COMMAND_LOGIN_NEW = 0x1021, //新版玩家登陆
		ICCmdID_0x0501 = 0x0503,//server模拟认证
		SERVER_COMMAND_LOGIN_ERR = 0x4002,
		REPORT_CLIENT_ADDRESS = 0x0903 //ccgate第一次连接游戏场时会用到上报真实ip
	};
	AccessTask* at = (AccessTask*)task;
	if (!at || !(at->getBev()))
	{
		ZERROR("error at:%p", at);
		return false;
	}
	ICExternalHeader h;
	memcpy(&h, msg, sizeof(h));
	at->setClientType(3);
	if (h.cmd == REPORT_CLIENT_ADDRESS){
		return true;
	}
	if (h.cmd == CLIENT_COMMAND_LOGIN || h.cmd == CLIENT_COMMAND_LOGIN_NEW){
		//模拟认证登录
		AccessInterTask * state_ait = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskByType(network::cmd::PBMainCmdID_State);
		if (state_ait){
			NETInputPacket pPacket;
			pPacket.Copy(msg, msglen);
			if (!CrevasseBuffer(&pPacket)){
				return false;
			}
			at->setProxyLoginStr(msg, msglen);
			int tid = pPacket.ReadInt(); //TableID
			(void)tid;
			int mid = pPacket.ReadInt(); //mid
			std::string mtkey = pPacket.ReadString();//验证key
			ZEncoder<BPTExternalHeader> enc;
			NETOutputPacket sendPacket_auth;
			sendPacket_auth.Begin(0x0503);
			sendPacket_auth.WriteInt(mid);
			sendPacket_auth.WriteString(mtkey.c_str());
			sendPacket_auth.WriteInt(0);
			sendPacket_auth.WriteByte(3);
			sendPacket_auth.End();
			EncryptBuffer(&sendPacket_auth);
			enc.encode(network::cmd::PBMainCmdID_State, network::cmd::PBStateSubCmdID_LoginOldTexasState, sendPacket_auth.packet_buf(), sendPacket_auth.packet_size());
			return state_ait->sendEncodedCmd(network::inter::ServerCmdType_Client, 0, 0, task->id(), enc.data(), enc.length());
		}else{
			//认证失败
			NETOutputPacket response;
			response.Begin(SERVER_COMMAND_LOGIN_ERR);
			response.WriteInt(1);
			response.WriteInt64(0); // 和mtt字段保持一致,该字段表示开赛时间戳,这里直接写个0
			response.End();
			EncryptBuffer(&response);
			return task->sendCmd(response.packet_buf(), response.packet_size());
		}
	}else{
		//<没认证过的连接直接丢弃操作，并且断开连接
		if (!at->isBindUid()){
			ZTRACE("user(%llu)no auth at:%p", task->id(), at);
			ZDEL(at);
			return false;
		}
		AccessInterTask* ait = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskById(at->getICSrvId());
		if (ait) {
			ZDEBUG("forward to gameserver:%u,%x", at->getICSrvId(), h.cmd);
			ZEncoder<BPTExternalHeader> enc;
			enc.encode(network::cmd::PBMainCmdID_OldTexas, 0, msg, msglen);
			return ait->sendEncodedCmd(network::inter::ServerCmdType_Client, 0, 0, task->id(), enc.data(), enc.length());
		}
		else {
			ZERROR("notify client no available service");
			//TODO:notify client no available service
		}
	}
	return false;

}
static bool processOldTexasCmd(ZTask* task, const void* msg, const uint16 msglen) {
	enum ICCmdID {
		ICCmdID_0x0501	= 0x0501,//认证
		ICCmdID_0x0514 = 0x0514,//连接认证服异常
		ICCmdID_0x2001 = 0x2001,//通知ccgate连接游戏场	游戏服务svid[4字节整型]
		ICCmdID_0x2002 = 0x2002,//连接游戏场成功
		ICCmdID_0x2008 = 0x2008,//找不到此游戏场
		ICCmdID_0x7002 = 0x7002,//连接游戏场后心跳包
		ICCmdID_0x7003 = 0x7003,//ccgate回心跳包
		ICCmdID_0x7004 = 0x7004,//客户端大厅心跳包
		CLIENT2WEB_PHP_REQ=0x0100,//PHP请求[--经过验证才允许转发]
		CLIENT2WEB_PHP_Login=0x0101,///移动PHP登录请求[--未经过验证也允许转发，只允许指定的接口]
		WEB2CLIENT_PHP_RESP = 0x0200,//回复客户端php请求
	};

	AccessTask* at = (AccessTask*)task;

	ICExternalHeader h;
	memcpy(&h, msg, sizeof(h));
	//ZDecoder<ICExternalHeader> dec((char*)&h, sizeof(h));
	//CheckCondition(dec.decode(h), false);
	ZDEBUG("%s,%u,%d,%d,%u,%d,%u", h.magic, h.cmd, h.ver, h.subver, h.bodylen, h.checksum, h.sequence);
	//<没认证过的连接直接丢弃操作(非移动登录包和认证包)，并且断开连接
	if (h.cmd != ICCmdID_0x0501 && h.cmd != CLIENT2WEB_PHP_Login){
		if (!at->isBindUid()){
			ZDEBUG("user(%llu)no auth", task->id());
			return false;
		}
	}
	if (h.cmd == ICCmdID_0x7004){
		return sendToOldTexasClient(task, ICCmdID_0x7003);
	}else if(h.cmd == ICCmdID_0x0501) {
		AccessInterTask * ait = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskByType(network::cmd::PBMainCmdID_State);
		NETInputPacket inputPacket_auth;
		inputPacket_auth.Copy(msg, msglen);
		CrevasseBuffer(&inputPacket_auth);
		uint32 mid = inputPacket_auth.ReadInt();
		std::string mtkey = inputPacket_auth.ReadString();
		uint32 sessionid = inputPacket_auth.ReadInt();
		uint8 clientType = inputPacket_auth.ReadByte();
		ZDEBUG("Auth:%u,%s,%u,%u",mid,mtkey.c_str(),sessionid,clientType);
		at->setClientType(clientType);
		if(ait) {
			ZEncoder<BPTExternalHeader> enc;
			enc.encode(network::cmd::PBMainCmdID_State, network::cmd::PBStateSubCmdID_LoginOldTexasState, msg, msglen);
			return ait->sendEncodedCmd(network::inter::ServerCmdType_Client, 0, 0, task->id(), enc.data(), enc.length());
		} else {
			ZDEBUG("notify client no available service");
			return sendToOldTexasClient(task, ICCmdID_0x0514);
		}
	} else if (h.cmd == ICCmdID_0x2001) {
		NETInputPacket inputPacket;
		inputPacket.Copy(msg, msglen);
		int ret =  CrevasseBuffer(&inputPacket);
		uint32 srvid = inputPacket.ReadInt();

		at->setICSrvId(srvid);
		ZDEBUG("serverid:%u,%d", at->getICSrvId(),ret);
		if (AccessInterTaskManager::getInstance().getTaskById(at->getICSrvId())){
			return sendToOldTexasClient(task, ICCmdID_0x2002);
		}else{
			return sendToOldTexasClient(task, ICCmdID_0x2008);
		}
	}else if (h.cmd == CLIENT2WEB_PHP_REQ || h.cmd == CLIENT2WEB_PHP_Login){
		NETInputPacket inputPacket;
		inputPacket.Copy(msg, msglen);
		int ret =  CrevasseBuffer(&inputPacket);
		(void)ret;
		uint8 clitype = inputPacket.ReadByte();
		uint32 seq = inputPacket.ReadInt();
		std::string head = inputPacket.ReadString();
		std::string content = inputPacket.ReadString();
		//ZDEBUG("POST:%u,%u,%s,%s,%d,0x%x",clitype, seq, head.c_str(),content.c_str(),ret,h.cmd);
		return AccessHttpClient::reqOldTexas(h.cmd == CLIENT2WEB_PHP_Login, clitype, seq, at, head, content);
	}else{
		//转发给TexasServer  0x1000~0x10FF 区间的命令字为发送至server的包
		if (h.cmd == ICCmdID_0x7002 || (h.cmd >> 8) == 0x10){
			AccessInterTask* ait = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskById(at->getICSrvId());
			if (ait) {
				ZDEBUG("forward to gameserver:%u,%x", at->getICSrvId(), h.cmd);
				ZEncoder<BPTExternalHeader> enc;
				enc.encode(network::cmd::PBMainCmdID_OldTexas, 0, msg, msglen);
				return ait->sendEncodedCmd(network::inter::ServerCmdType_Client, 0, 0, task->id(), enc.data(), enc.length());
			}else {
				ZDEBUG("notify client no available service");
				//TODO:notify client no available service
			}
		}
	}
	return false;
}

bool AccessTaskParser::init() {
	registry(network::cmd::PBMainCmdID_Null, network::cmd::PBSubCmdID_NullHeartBeat, processNullHeartBeat);
	registry(network::cmd::PBMainCmdID_Null, network::cmd::PBSubCmdID_NullHeartBeatServerToClient, processNullHeartBeatServerToClient);
	registry(network::cmd::PBMainCmdID_Null, network::cmd::PBSubCmdID_NullLogout, processNullLogout);
	registry(network::cmd::PBMainCmdID_Reserse, 0, processServerCmd);
	if (AccessConfigManager::getInstance().isProxyModel()){
		registry(network::cmd::PBMainCmdID_OldTexas, 0, processOldTexasProxyCmd);
	}else{
		registry(network::cmd::PBMainCmdID_OldTexas, 0, processOldTexasCmd);
	}
	return true;
}
