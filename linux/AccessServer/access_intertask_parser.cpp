#include "Cmd/utils.h"
#include "Cmd/cmdid.pb.h"
#include "Cmd/cmd.pb.h"
#include "Cmd/server.pb.h"

#include "Framework/z_encoder.h"
#include "Framework/z_decoder.h"
#include "Framework/z_time.h"
#include "Framework/z_string_tool.h"

#include "access_intertask.h"
#include "access_intertask_parser.h"
#include "access_intertask_manager.h"
#include "access_task.h"
#include "access_task_manager.h"
#include "access_config_manager.h"
#include "GameLib/monitor-cli/monitor_report_cli.h"
#include "GameLib/icpack/TexasPacket.h"
#include "GameLib/icpack/TexasPacketHandle.h"
#include "Framework/z_string_tool.h"

static bool parseSharedRegisterServer(ZTask* task, const void* msg, const uint16 msglen) {
	if (!task)
	{
		ZERROR("task is NULL, %p", task);
		return false;
	}
	AccessInterTask *ait = (AccessInterTask*)task;
	network::inter::SharedRegisterServer rev;
	rev.ParsePartialFromArray(msg, msglen);
	ait->setId(rev.sid());
	ait->setVersion(rev.version());
	if(!AccessInterTaskManager::getInstance().addTask(ait)) {
		ZERROR("add to TaskManager fail:%p %llx,%u,%u", ait, ait->id(), rev.type(), rev.sid());
		ZDEL(ait);
		return false;
	}

	const uint16 shadow_srvid = AccessTask::getShadowSrvId(rev.sid() & 0xFFFF);
	const uint32 srv_shadow_sid = (rev.sid() & 0xFFFF0000) | shadow_srvid;
	AccessInterTask* ss = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskById(srv_shadow_sid);
	if(ss && ait->getVersion().compare(ss->getVersion()) > 0) {
		ait->setLatestVersion(ss->getVersion());
		network::inter::SharedNotifyUpgradeService send;
		ss->sendEncodedPbCmd(network::inter::ServerMainCmdID_Shared, network::inter::SharedSubCmdID_NotifyUpgradeService, send);
	}

	ZTRACE("registry server success: %p %llu,%u,%u,%s,%u", ait, ait->id(), rev.type(), rev.sid(), rev.version().c_str(), srv_shadow_sid);
	rev.set_type(network::cmd::PBMainCmdID_Access);
	rev.set_sid(AccessConfigManager::getInstance().getServerId());
	ait->sendEncodedPbCmd(network::inter::ServerMainCmdID_Shared, network::inter::SharedSubCmdID_RegisterServer, rev);

	//motorcli::MotorReport::getInstance().AddLink(ait->id(), ZStringTool::format("%s:%u", ait->peerIp(), ait->peerPort()));
	return true;
}

static bool parseSharedLoginState(ZTask* task, const void* msg, const uint16 msglen) {
	if (!task)
	{
		ZERROR("task is NULL, %p", task);
		return false;
	}
	network::inter::SS2ASSubCmdIDLoginState rev;
	rev.ParsePartialFromArray(msg, msglen);
	AccessTask *oldtask = (AccessTask*)AccessTaskManager::getInstance().getTaskById(rev.uid());
	AccessTask *newtask = AccessTaskVerifyManager::getInstance().getTaskById(rev.loginid());
	LogCheckCondition(newtask, false, "cannot find link:%lu,%lu,%p,%p", rev.loginid(), rev.uid(), oldtask, newtask);
	if (rev.success() != 1){
		ZERROR("login server fail:%p, %lu,%lu,%u", newtask, rev.loginid(), rev.uid(), rev.success());
		ZDEL(newtask);
		return false;
	}

	//LoginEnumMod mod = LOGIN_MOD_NORMAL;
	
		//代理模式下不需要做踢出处理
		LogCheckCondition(newtask != oldtask, false, "同一账号发送多次相同登陆消息:%lu,%lu,%p,%p", rev.loginid(), rev.uid(), oldtask, newtask);

		if (oldtask && oldtask->id() == static_cast<uint64>(rev.loginid())) {
			ZERROR("同一连接发送相同登陆包:%lu,%lu,%p,%p", rev.loginid(), rev.uid(), oldtask, newtask);
			//oldtask->sendEncodedCmdToMe(rev.maincmd(), rev.subcmd(), rev.data().data(), rev.data().length());
			return true;
		}
		if (oldtask && oldtask->getBev()) {
			oldtask->setMod(LOGIN_MOD_RELOGIN);
			if (!AccessConfigManager::getInstance().isProxyModel()){				
				NETOutputPacket sendPacket;
				sendPacket.Begin(0x0612);
				sendPacket.WriteByte(newtask->getClientType());
				sendPacket.End();
				EncryptBuffer(&sendPacket);
				oldtask->sendCmd(sendPacket.packet_buf(), sendPacket.packet_size());
				//todo:存在问题
				ZTRACE("duplicate login server, kick:%p,%llu,%ld,%u", oldtask, oldtask->id(), rev.uid(), newtask->getClientType());				
				ZDEL(oldtask);
			}else{
				NETOutputPacket sendPacket;
				sendPacket.Begin(0x4018);
				sendPacket.End();
				EncryptBuffer(&sendPacket);
				oldtask->sendCmd(sendPacket.packet_buf(), sendPacket.packet_size());
				//ZDEL(oldtask);
				ZTRACE("duplicate login server, kick:%p,%llu,%ld,%u not proxymod", oldtask, oldtask->id(), rev.uid(), newtask->getClientType());				
				oldtask->destroy();
			}
		}
		else
		{
			ZERROR("error oldtask:%p", oldtask);
		}
	/*
	LogCheckCondition(newtask, false, "找不到链接:%lu,%lu,%p,%p", rev.loginid(), rev.uid(), oldtask, newtask);
	CheckCondition(rev.srvid() == AccessConfigManager::getInstance().getServerId(), false);

	ZDEBUG("登陆服务器:%lu,%lu,%u,%p,%p", rev.loginid(), rev.uid(),rev.success(),newtask,oldtask);
	newtask->sendEncodedCmdToMe(rev.maincmd(), rev.subcmd(), rev.data().data(), rev.data().length());

	//notify state success
	network::inter::SharedPlayerLogin send;
	send.set_uid(rev.uid());
	send.set_mod((int32)mod);
	task->sendEncodedPbCmd(network::inter::ServerMainCmdID_Shared, network::inter::SharedSubCmdID_PlayerLogin, send);
	*/
	ZTRACE("login success:%lu,%lu,%u", rev.loginid(), rev.uid(), rev.success());
	newtask->setId(rev.uid());
	newtask->setBindUid();
	newtask->onLogin();
	bool ret = AccessTaskManager::getInstance().addTask(newtask);
	if (ret && AccessConfigManager::getInstance().isProxyModel()){
		newtask->setICSrvId(AccessConfigManager::getInstance().getProxySvid());
		//发向server
		AccessInterTask* ait = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskById(newtask->getICSrvId());
		if (ait) {
			ZTRACE("send login packet,icsvid=%u", newtask->getICSrvId());
			ZEncoder<BPTExternalHeader> enc;
			enc.encode(network::cmd::PBMainCmdID_OldTexas, 0, newtask->getProxyLoginStr().c_str(), newtask->getProxyLoginStr().length());
			return ait->sendEncodedCmd(network::inter::ServerCmdType_Client, 0, 0, newtask->id(), enc.data(), enc.length());

		}
		else {
			ZERROR("notify client no available service");
			return false;
		}
	}
	return ret;
}

static bool processShared(ZTask* task, const void* msg, const uint16 msglen) {
	if (!task)
	{
		ZERROR("task is NULL, %p", task);
		return false;
	}
	BPTInternalHeader *h = (BPTInternalHeader*)msg;
	return AccessInterTaskParser::getInstance().dispatch(h->maincmd, h->subcmd, task, h->data, h->dataSize());
}

static bool processClientCmd(ZTask* task, const void* msg, const uint16 msglen) {
	if (!task)
	{
		ZERROR("task is NULL, %p", task);
		return false;
	}
	BPTInternalHeader *h = (BPTInternalHeader*)msg;
	BPTExternalHeader *exh = (BPTExternalHeader*)h->data;
	if((h->linkid >> 32) & 0xFFFFFFFF) {
		ZDEBUG("processClientCmd,1,%u,%llu", msglen, h->linkid);
		AccessTask *t = (AccessTask*)AccessTaskVerifyManager::getInstance().getTaskById(h->linkid);
		CheckCondition(t, false);
		//ZDEBUG("%s,%u,%u", exh->magic,exh->bodylen,exh->maincmd);
		if(network::cmd::PBMainCmdID_OldTexas == ntohs(exh->maincmd)) {
			//ZDEBUG("1,%x,%x",ntohs(exh->maincmd),ntohs(exh->subcmd));
			t->sendCmd(exh->data, ntohs(exh->dataSize()));
		} else {
			//ZDEBUG("2,%x,%x",ntohs(exh->maincmd),ntohs(exh->subcmd));
			t->sendCmd(h->data, h->dataSize());
		}
	}else {
		ZDEBUG("processClientCmd,2,%u,%llu", msglen, h->linkid);
		AccessTask *t = (AccessTask*)AccessTaskManager::getInstance().getTaskById(h->linkid);
		CheckCondition(t, false);
		ICExternalHeader ich;
		memcpy(&ich, exh->data, sizeof(ich));

		ZDEBUG("return to client cmd:%x", ich.cmd);
		if(network::cmd::PBMainCmdID_OldTexas == ntohs(exh->maincmd)) {
			//ZDEBUG("3,%x,%x",ntohs(exh->maincmd),ntohs(exh->subcmd));
			t->sendCmd(exh->data, ntohs(exh->dataSize()));
		} else {
			//ZDEBUG("4,%x,%x",ntohs(exh->maincmd),ntohs(exh->subcmd));
			t->sendCmd(h->data, h->dataSize());
		}
	}
	//ZDEBUG("processClientCmd:%u,%u,%u,%llu", h->cmdtype, h->maincmd, h->subcmd, h->linkid);
	return true;
}

static bool processBroadcastCmd(ZTask* task, const void* msg, const uint16 msglen) {
	if (!task)
	{
		ZERROR("task is NULL, %p", task);
		return false;
	}
	BPTInternalHeader *h = (BPTInternalHeader*)msg;
	if(h->varhrlen) {
		LogCheckCondition(h->datalen >= h->varhrlen, false, "数据异常");
        //如果是广播消息，变长数据的第一个字节表示广播的类型
        uint8 broadcastType = *((uint8*)h->data);
        if(broadcastType == network::inter::BroadcastType_ExceptUsers)
        {
            AccessTaskManager::getInstance().broadcastCmdExceptUsers(h->data+h->varhrlen,
                    h->datalen-h->varhrlen, (const uint64*)(h->data + 1), (h->varhrlen - 1)/sizeof(uint64));
        }
        else if(broadcastType == network::inter::BroadcastType_SpecifiedUsers)
        {
            AccessTaskManager::getInstance().broadcastToSpecifiedUsers(h->data+h->varhrlen,
                    h->datalen-h->varhrlen, (const uint64*)(h->data + 1), (h->varhrlen - 1)/sizeof(uint64));
        }

		ZDEBUG("multi:%llu, broadcastType:%d",*(const uint64*)h->data, broadcastType);
	} else {
		AccessTaskManager::getInstance().broadcastCmd(h->data, h->dataSize());
	}
	ZDEBUG("processBroadcastCmd:%u,%u,%u,%llu,%u", h->cmdtype, h->maincmd, h->subcmd, h->linkid, h->varhrlen);
	return true;
}

static bool processFarwardCmd(ZTask* task, const void* msg, const uint16 msglen) {
	if (!task)
	{
		ZERROR("task is NULL, %p", task);
		return false;
	}
	BPTInternalHeader *h = (BPTInternalHeader*)msg;
	AccessInterTask *t = NULL;
	AccessTask *ait = (AccessTask*)task;
	if(h->linkid) {
		TLinkID linkid = h->linkid;
		if(linkid.p_dsid != 0){
			uint32 srvid = h->linkid;
			//用于判断是否为GameServer,
			if (srvid<32768){
				t = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskById(ait->parserICSrvId(srvid));
			}else{
				t = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskById(h->linkid & BPT_INTERNALPACKET_MASK);
			}
		}else{
			t = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskByType((h->linkid & BPT_INTERNALPACKET_MASK) >> 16);
		}
		if(t) t->sendCmd(msg, msglen);
	}
	ZTRACE("processFarwardCmd:%u,%u,%u,%u,%p,svid:%d", h->cmdtype, h->maincmd, h->subcmd, (uint32)h->linkid, t, (int32)(h->linkid&0xFFFF));
	return true;
}



bool AccessInterTaskParser::init() {
	registry(network::inter::ServerCmdType_Shared, 0, processShared);
	registry(network::inter::ServerCmdType_Broadcast, 0, processBroadcastCmd);
	registry(network::inter::ServerCmdType_Forward, 0, processFarwardCmd);
	registry(network::inter::ServerCmdType_Client, 0, processClientCmd);
	registry(network::inter::ServerMainCmdID_Shared, network::inter::SharedSubCmdID_RegisterServer, parseSharedRegisterServer);
	registry(network::inter::ServerMainCmdID_SS2AS, network::inter::SS2ASSubCmdID_LoginState, parseSharedLoginState);
	return true;
}
