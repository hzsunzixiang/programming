#include "Cmd/utils.h"
#include "Cmd/cmdid.pb.h"
#include "Cmd/cmd.pb.h"
#include "Cmd/server.pb.h"

#include "GameLib/access-cli/cli.h"
#include "GameLib/icpack/TexasPacket.h"
#include "GameLib/icpack/TexasPacketHandle.h"

#include "state_forward_msgparser.h"
#include "state_config_manager.h"

#pragma pack(1)
struct CMSICInterHeader {
	uint64 context;
	ALL_SIZE_FUNC(dlen, data);
	DATA_SIZE_FUNC(dlen, data);
	uint16 dlen;
	char data[0];
};
#pragma pack()
enum StateCMD
{
	ADMIN_SERVER_RESET = 0x3401,
	ADMIN_SERVER_RESET_RESPONSE = 0x3411,
	ADMIN_SERVER_INFO = 0x3402,
	ADMIN_SERVER_INFO_RESPONSE = 0x3412,
};

static void onSend(NETOutputPacket *sendPacket, const uint64 linkid, const uint64 contextId){
	EncryptBuffer(sendPacket);
	char buf[64 * 1024] = { 0 };
	CMSICInterHeader* cmsh = (CMSICInterHeader*)buf;
	cmsh->context = contextId;
	cmsh->dlen = sendPacket->packet_size();
	memcpy(cmsh->data, sendPacket->packet_buf(), sendPacket->packet_size());
	accli::UClientTaskManager::getInstance().forwardToServer(ZConfig::myArgs.sid, GetSourceServerId(linkid),
		network::cmd::PBMainCmdID_OldTexas, 0,
		cmsh,
		cmsh->allSize());
}

//ÖØÖÃServer-ÅäÖÃ
static void onReset(const uint64 linkid,const uint64 contextId){
	NETOutputPacket sendPacket;
	sendPacket.Begin(ADMIN_SERVER_RESET_RESPONSE);
	sendPacket.WriteInt(ZConfig::myArgs.sid);
	if (StateConfigManager::getInstance().init()){
		accli::UClientTaskManager::getInstance().init(&StateConfigManager::getInstance(),
			NULL,
			NULL,
			NULL,
			NULL);
		sendPacket.WriteByte(1);		
	}else{
		sendPacket.WriteByte(0);
	}
	sendPacket.End();
	onSend(&sendPacket,linkid,contextId);
}

static void onInfo(const uint64 linkid, const uint64 contextId){
	NETOutputPacket sendPacket;
	sendPacket.Begin(ADMIN_SERVER_INFO_RESPONSE);
	sendPacket.WriteInt(ZConfig::myArgs.sid);
	sendPacket.WriteString(ZConfig::myArgs.version);
	sendPacket.WriteString(__TIME__);
	sendPacket.WriteString(__DATE__);
	sendPacket.End();
	onSend(&sendPacket, linkid, contextId);
}

static bool parseCMSMsg(const uint64 linkid, ZTask* task, const void* msg, const uint16 msglen) {

	const CMSICInterHeader* h = (const CMSICInterHeader*)msg;
	const ICExternalHeader* ich = (const ICExternalHeader*)h->data;
	NETInputPacket packet;
	packet.Copy(ich, h->dlen);
	int ret = CrevasseBuffer(&packet);
	if (ret <= 0) return false;
	short pk_cmdType = packet.GetCmdType();
	switch (pk_cmdType){
		case ADMIN_SERVER_RESET:
			onReset(linkid, h->context);
			break;
		case ADMIN_SERVER_INFO:
			onInfo(linkid, h->context);
			break;
	}
	return true;
}

bool StateForwardMsgParser::init() {
	CheckCondition(!getSize(), true);
	registry(network::cmd::PBMainCmdID_OldTexas, 0, parseCMSMsg);
	return true;
}
