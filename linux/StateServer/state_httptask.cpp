#include "Framework/z_event.h"
#include "Framework/z_tcpserver.h"
#include "Framework/z_decoder.h"
#include "Framework/z_encoder.h"

#include "Cmd/utils.h"
#include "Cmd/server.pb.h"

#include "state_httptask.h"
#include "state_server.h"
#include "state_httptask_parser.h"

StateHttpTask::StateHttpTask(const int32 nfd) : ZTCPTask(&StateHttpTaskParser::getInstance()) {
	m_fd = nfd;
	ZDEBUG("创建StateHttpTask成功:[%d]", handle());
}

StateHttpTask::~StateHttpTask() {
	ZDEBUG("删除StateHttpTask成功:[%d]", handle());
}

bool StateHttpTask::init() {
	return ZTCPTask::init(m_main_event);
}
