#include "Cmd/cmdid.pb.h"
#include "Cmd/cmd.pb.h"
#include "Cmd/utils.h"

#include "Framework/z_encoder.h"

#include "access_task.h"
#include "access_httpclient_parser.h"
#include "access_httpclient.h"

//<deplicated
static bool PBLogin(ZTask* task, const void* msg, const uint16 msglen) {
	AccessHttpClient *at = (AccessHttpClient*)task;
	return at->task() ? at->task()->sendCmd(msg, msglen) : false;
}

bool AccessHttpClientParser::init() {
	registry(network::cmd::PBMainCmdID_Login, 0, PBLogin);
	registry(network::cmd::PBMainCmdID_PokerFeed, 0, PBLogin);
	registry(network::cmd::PBMainCmdID_UserInfo, 0, PBLogin);
	registry(network::cmd::PBMainCmdID_Rank, 0, PBLogin);
	return true;
}
