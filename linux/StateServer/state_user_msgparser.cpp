#include "Cmd/utils.h"
#include "Cmd/cmdid.pb.h"
#include "Cmd/cmd.pb.h"
#include "Cmd/server.pb.h"
#include "Cmd/rediskey.pb.h"
#include "Cmd/state.pb.h"

#include "Framework/z_myredis.h"
#include "Framework/z_string_tool.h"

#include "GameLib/utils/u_hashing.h"
#include "GameLib/access-cli/cli.h"
#include "GameLib/icpack/TexasPacket.h"
#include "GameLib/icpack/TexasPacketHandle.h"

#include "state_user_msgparser.h"
#include "state_config_manager.h"

static bool processClientLoginState(const uint64 uid, ZTask* task, const void* msg, const uint16 msglen) {
	return true;
	/*ZDEBUG("processClientLoginState,uid:%llu", uid);
	accli::UClientTask* ait = (accli::UClientTask*)task;
	network::cmd::PBLoginState rev;
	rev.ParsePartialFromArray(msg, msglen);

	network::inter::SS2ASSubCmdIDLoginState send;
	send.set_srvid(ait->id());
	send.set_uid(rev.uid());
	send.set_loginid(uid);
	send.set_success(1);

	network::cmd::PBLoginStateRet data;
	if(rev.has_context())
		data.mutable_context()->CopyFrom(rev.context());
	data.set_uid(rev.uid());

	//< verify login token.
	std::string v;
	const char* tokenk = utility::getTokenRedisKey(rev.uid());
	if(!myRedis().get(tokenk, v)) {
		send.set_success(0);
		ZERROR("processClientLoginState not exist:%llu,%lu,%s,%s",uid, rev.uid(),rev.token().c_str(),v.c_str());
	}
	else if(0 != v.compare(rev.token())) {
		send.set_success(0);
		ZERROR("processClientLoginState not match:%llu,%lu,%s,%s",uid, rev.uid(),rev.token().c_str(),v.c_str());
	} else {
		//< verify successfully.
		//< fill in multiple tables infos.
		std::list<std::string> rs;
		const char* mutiltk = utility::getMultiTableRedisKey(rev.uid());
		if(myMultiTableRedis().lrange(mutiltk, 0, -1, rs)) {
			for(std::list<std::string>::iterator it(rs.begin()),end(rs.end()); it!=end; ++it) {
				std::vector<std::string> vec;
				::network::cmd::PBTableIndex* idx = data.add_idx();
				ZStringTool::split(*it, '|', vec);
				if(4 != vec.size()) continue;
				idx->set_flag(ZStringTool::integer(vec[0]));
				idx->set_mid(ZStringTool::integer(vec[1]));
				idx->set_tid(ZStringTool::integer(vec[2]));
				idx->set_time(ZStringTool::integer(vec[3]));
				ZDEBUG("%lu, idx %s", rev.uid(), (*it).c_str());
			}
		}
		//增加上线状态到redis
		// add by JohnnyHuang 20160801
		ZDEBUG("processClientLoginState, key:%s, uid:%s", network::cmd::RedisKey_Name(network::cmd::ONLINE).c_str(), ZStringTool::format("%lu",rev.uid()).c_str());
		if (!myRedis().sadd(network::cmd::RedisKey_Name(network::cmd::ONLINE).c_str(), ZStringTool::format("%lu",rev.uid())))
		{
			ZERROR("processClientLoginState, uid:%lu",rev.uid());
		}
	}

	v.clear();
	const char* tokengi = utility::getGIRedisKey(rev.uid());
	if(!myRedis().get(tokengi, v)) {
		ZERROR("processClientLoginState:%llu,%lu,%lu,%s,%s,%s",uid, send.loginid(),rev.uid(),rev.token().c_str(),v.c_str(),tokengi);
	}
	ZDEBUG("processClientLoginState:%llu,%lu,%lu,%s,%s,%s",uid, send.loginid(),rev.uid(),rev.token().c_str(),v.c_str(),tokengi);
	send.set_maincmd(network::cmd::PBMainCmdID_State);
	send.set_subcmd(network::cmd::PBStateSubCmdID_LoginStateRet);
	data.set_ret(send.success());
	SerializeMsgMacro(data);
	send.set_data(data__, data_size__);
	return accli::UClientTaskManager::getInstance().broadcastToServer(network::inter::ServerMainCmdID_SS2AS,
																	  network::inter::SS2ASSubCmdID_LoginState,
																	  send);
	//return ait->sendEncodedPbCmd(network::inter::ServerMainCmdID_SS2AS, network::inter::SS2ASSubCmdID_LoginState, send);
	*/
}

static bool processClientLoginOldTexasState(const uint64 uid, ZTask* task, const void* msg, const uint16 msglen) {
	ZDEBUG("processClientLoginOldTexasState,uid:%llu", uid);

	network::inter::SS2ASSubCmdIDLoginState send;
	send.set_srvid(task->id());
	send.set_loginid(uid);
	send.set_success(1);

	NETInputPacket inputPacket;
	inputPacket.Copy(msg, msglen);
	int ret = CrevasseBuffer(&inputPacket);
	if(ret <= 0) return false;

	short pk_cmdType = inputPacket.GetCmdType();
	uint32 myuid = inputPacket.ReadInt();
	std::string mtkey = inputPacket.ReadString();
	uint32 sessionid = inputPacket.ReadInt();
	int8 type = inputPacket.ReadByte();
	ZDEBUG("ICPacket_0x0501:%d,%s,%d,%d", myuid, mtkey.c_str(), sessionid, type);
	ZTRACE("processClientLoginOldTexasState,uid:%u", myuid);


	bool auth_success = false;
	if (myuid>0 && !mtkey.empty()){
		send.set_uid(myuid);
		std::string strval;
		char struid[64] = { 0 };
		sprintf(struid, "%u", myuid);
		myGiMemcache.GetRecord(struid, strval);
		if (!strval.empty()){
			char strtmp[64] = { 0 };
			sprintf(strtmp, "mtkey:%s,", mtkey.c_str());
			if (strval.find(strtmp, 0) != std::string::npos){
				if (pk_cmdType != 0x0503){//针对server推过来的认证，不做sessionid判断
					sprintf(strtmp, "ss:%u", sessionid);
					if (sessionid>0 && strval.find(strtmp, 0) != std::string::npos){
						auth_success = true;
					}
				}else{
					auth_success = true;
				}
			}
		}
		if (!auth_success){
			ZERROR("processClientLoginOldTexasState1 uid:%u,mtkey:%s,sessionid:%u,type:%u,Can't get [mtkey] from [%s]", myuid, mtkey.c_str(), sessionid, type, strval.c_str());
		}
	}else{
		ZTRACE("processClientLoginOldTexasState2 uid:%u,mtkey:%s,sessionid:%u,type:%u,", myuid, mtkey.c_str(), sessionid, type);
	}
	short cmdtype = 0;
	if (auth_success){
		ZTRACE("auth_success, uid:%u", myuid);
		send.set_success(1);
		cmdtype = 0x0512;
	}else{
		send.set_success(0);
		cmdtype = 0x0513;//认证失败
		ZERROR("processClientLoginOldTexasState compare from uid:%u,mtkey:%s,sessionid:%u", myuid, mtkey.c_str(), sessionid);
	}
	if (pk_cmdType != 0x0503){
		NETOutputPacket sendPacket;
		sendPacket.Begin(cmdtype);//认证成功
		sendPacket.End();
		EncryptBuffer(&sendPacket);
		ZDEBUG("sendPacket:%u", sendPacket.packet_size());
		task->sendCmdToMe(uid, 0x40, 0, sendPacket.packet_buf(), sendPacket.packet_size());
	}
	//return accli::UClientTaskManager::getInstance().broadcastToServer(network::inter::ServerMainCmdID_SS2AS,
	//																  network::inter::SS2ASSubCmdID_LoginState,
	accli::UClientTask* ait = (accli::UClientTask*)task;
	return ait->sendEncodedPbCmd(network::inter::ServerMainCmdID_SS2AS, network::inter::SS2ASSubCmdID_LoginState, send);
}

bool StateUserMsgParser::init() {
	CheckCondition(!getSize(), true);
	registry(network::cmd::PBMainCmdID_State, network::cmd::PBStateSubCmdID_LoginOldTexasState, processClientLoginOldTexasState);
	return true;
}
