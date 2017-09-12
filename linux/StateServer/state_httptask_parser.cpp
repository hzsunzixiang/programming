#include "Cmd/utils.h"
#include "Cmd/cmd.pb.h"
#include "Cmd/cmdid.pb.h"
#include "Cmd/rediskey.pb.h"
#include "Cmd/server.pb.h"

#include "Framework/z_encoder.h"

#include "External/hiredis/myredis.h"

#include "state_httptask.h"
#include "state_httptask_parser.h"

static bool processShared(ZTask* task, const void* msg, const uint16 msglen) {
	BPTInternalHeader *h = (BPTInternalHeader*)msg;
	ZDEBUG("onRead %llu,%u,%u,%u,%llu,%u", task->id(), h->cmdtype, h->maincmd, h->subcmd, h->linkid, h->datalen);
	return StateHttpTaskParser::getInstance().dispatch(h->maincmd, h->subcmd, task, h->data, h->dataSize());
}

static bool parseSharedRegisterServer(ZTask* task, const void* msg, const uint16 msglen) {
	ZDEBUG("PHP测试消息:%llu", task->id());
	return true;
}

bool StateHttpTaskParser::init() {
	registry(network::inter::ServerCmdType_Shared, 0, processShared);
	registry(network::inter::ServerMainCmdID_Shared, network::inter::SharedSubCmdID_RegisterServer, parseSharedRegisterServer);
	return true;
}
