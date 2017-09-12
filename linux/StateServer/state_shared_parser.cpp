
#include "Cmd/utils.h"
#include "Cmd/cmdid.pb.h"
#include "Cmd/cmd.pb.h"
#include "Cmd/server.pb.h"
#include "Cmd/rediskey.pb.h"
#include "Cmd/notify.pb.h"

#include "Framework/z_decoder.h"
#include "Framework/z_stl.h"
//#include "GameLib/utils/z_util.h"
#include "Framework/z_myredis.h"

#include "GameLib/access-cli/cli.h"
#include "GameLib/notify-cli/notifycli.h"
#include "External/hiredis/myredis.h"

#include "state_shared_parser.h"
#include "state_server.h"

#include "state_config_manager.h"
#include "GameLib/icpack/TexasPacket.h"
#include "GameLib/icpack/TexasPacketHandle.h"

enum ICCmdID {
	ICCmdID_0x3301 = 0x3301,//通知用户登出
};
enum LogoutEnumMod {
	LOGOUT_MOD_NORMAL = 0,
	LOGOUT_MOD_RELOGIN = 1,
};
static bool uGetString(const string& dest, const string& key, string& val)
{
	//empty
	if (dest.empty())
	{
		return false;
	}
	string::size_type p=0, e=0;
	string::size_type len = dest.length();
	string::size_type kl = key.length();

	for (size_t i=0; i<len; ++i)
	{
		p = dest.find(key,i);
		if ( p == string::npos )
		{//not found
			return false;
		}
		if ( p!=0 && dest[p-1]!=',' )
		{//not found,continue;
			i=p;
			continue;
		}
		if ( dest[p+kl]!=':')
		{//not found,continue;
			i=p;
			continue;
		}
		//found
		e = dest.find(",",p);
		if ( e == string::npos )
			e = len;

		val = dest.substr(p+kl+1, e-p-kl-1);

		return true;
	}
	//此代码只有代码有错才会跑到这里
	ZERROR("uGetString dest==%s, key==%s", dest.c_str(), key.c_str());
	return false;
}
static bool parseSharedRegisterServer(ZTask* zt,const void* msg,const uint16 msglen) {
	accli::UClientTask *tct = (accli::UClientTask*)zt;
	network::inter::SharedRegisterServer rev;
	rev.ParsePartialFromArray(msg, msglen);
	tct->setId(rev.sid());
	if(!accli::UClientTaskManager::getInstance().addTask(tct)) {
		ZERROR("add to TaskManager fail:%llu,%u,%u", tct->id(), rev.type(), rev.sid());
		ZDEL(tct);
		return false;
	}
	ZTRACE("registry server success:%llu,%u,%u", tct->id(), rev.type(), rev.sid());
	return true;
}

static bool processLoginState(ZTask* task, const void* msg, const uint16 msglen) {
	network::inter::SharedPlayerLogin rev;
	rev.ParsePartialFromArray(msg, msglen);
	ZTRACE("login success:%llu,%lu", task->id(), rev.uid());
	//network::cmd::NotifyMoneyToUserOnLoginState send;
	//send.set_uid(rev.uid());
	//send.set_linkid(task->id());
	// 先查询memcache 如果用户在房间内
	// 转发消息给 GameServer
	//return notifycli::UClientTaskManager::getInstance().request(network::cmd::PBMainCmdID_Notify,
	//															network::cmd::PBNotifySubCmdID_NotifyMoneyToUserOnLogin,
	//															send);
	return true;
}

static bool forwardLogOutToGameServer(uint64 uid) 
{
	std::string strval;
	char struid[64] = { 0 };
	sprintf(struid, "%llu", uid);
	myGiMemcache.GetRecord(struid, strval);

	string strSvid;
	string strTid;
	if (!strval.empty())
	{
		if(!uGetString(strval, "svid", strSvid))
		{
			ZERROR("cant get svid");
			strSvid.clear();
			return false;
		}
		if(!uGetString(strval, "tid", strTid))
		{
			ZERROR("cant get svid");
			strTid.clear();
			return false;
		}
	}
	uint32 svid = atoi(strSvid.c_str());
	uint32 tid = atoi(strTid.c_str());
	uint32 dstid = svid + (network::cmd::PBMainCmdID_OldTexas << 16);
	uint32 dstid2 = svid + (network::cmd::PBMainCmdID_OldTexas << 16)+ (1<<15);
	ZTRACE("forward to gameserver uid:%llu, svid:%u tid:%u sid:%u, dstid:%u, dstid2:%u", uid, svid, tid, ZConfig::myArgs.sid, dstid, dstid2);
	if (svid == 0 || tid == 0)
	{
		ZTRACE("return uid:%llu, svid:%u tid:%u ZConfig::myArgs.sid:%u, dstid:%u", uid, svid, tid, ZConfig::myArgs.sid, dstid);
		return false;
	}
	// ICpacket
	NETOutputPacket sendPacket;
	sendPacket.Begin(ICCmdID_0x3301);
	sendPacket.WriteInt((uint32)uid);
	sendPacket.WriteInt(svid);
	sendPacket.WriteInt(tid);
	sendPacket.End();
	EncryptBuffer(&sendPacket);
	accli::UClientTaskManager::getInstance().forwardToServer(ZConfig::myArgs.sid, dstid,
															 network::cmd::PBMainCmdID_OldTexas,
															 network::inter::SS2ASSubCmdID_LogOutState,
															 sendPacket.packet_buf(),
															 sendPacket.packet_size());
	accli::UClientTaskManager::getInstance().forwardToServer(ZConfig::myArgs.sid, dstid2,
															 network::cmd::PBMainCmdID_OldTexas,
															 network::inter::SS2ASSubCmdID_LogOutState,
															 sendPacket.packet_buf(),
															 sendPacket.packet_size());
	//ZDEBUG("forwardto %s,%u over", __FUNCTION__, dstid);
	return true;
}

static bool processLogoutState(ZTask* task, const void* msg, const uint16 msglen)
{
    ZDEBUG("processLogoutState");
	network::inter::SharedPlayerLogin rev;
	rev.ParsePartialFromArray(msg, msglen);
	if (rev.mod() != LOGOUT_MOD_RELOGIN){
		ZTRACE("logout success:%llu,%lu", task->id(), rev.uid());
		forwardLogOutToGameServer(rev.uid());
	}

    /*network::inter::SharedPlayerLogout rev;
    rev.ParsePartialFromArray(msg, msglen);
    ZDEBUG("processLogoutState,%lu", rev.uid());
	if(!rev.has_uid())
	{
		ZWARN("processLogoutState, no uid!!!");
		return true;
	}

	//增加离线状态到redis
	if (!myRedis().srem(network::cmd::RedisKey_Name(network::cmd::ONLINE).c_str(), ZStringTool::format("%lu",rev.uid())))
	{
		ZERROR("processClientLoginState, uid:%lu",rev.uid());
	}
	ZDEBUG("processClientLogoutState, key:%s, uid:%s", network::cmd::RedisKey_Name(network::cmd::OFFLINE).c_str(), ZStringTool::format("%lu",rev.uid()).c_str());
	if (!myRedis().sadd(network::cmd::RedisKey_Name(network::cmd::OFFLINE).c_str(), ZStringTool::format("%lu",rev.uid())))
	{
		ZERROR("processClientLoginState, uid:%lu",rev.uid());
	}*/
	return true;
}



bool StateSharedParser::init() {
	CheckCondition(!getSize(), true);
	registry(network::inter::ServerMainCmdID_Shared, network::inter::SharedSubCmdID_RegisterServer, parseSharedRegisterServer);
	registry(network::inter::ServerMainCmdID_Shared, network::inter::SharedSubCmdID_PlayerLogin, processLoginState);
	registry(network::inter::ServerMainCmdID_Shared, network::inter::SharedSubCmdID_PlayerLogout, processLogoutState);
	return true;
}
