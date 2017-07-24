#include "Framework/z_event.h"
#include "Framework/z_tcpserver.h"
#include "Framework/z_encoder.h"
#include "Framework/z_decoder.h"
#include "Framework/z_time.h"

#include "Cmd/utils.h"
#include "Cmd/server.pb.h"

#include "access_intertask.h"
#include "access_intertask_manager.h"
#include "access_server.h"
#include "access_intertask_parser.h"
//#include "GameLib/monitor-cli/monitor_report_cli.h"

AccessInterTask::AccessInterTask(const int32 nfd) : ZTCPTask(&AccessInterTaskParser::getInstance()) {
	m_fd = nfd;
	ZTRACE("create AccessInterTask success:[%p,%llu,%d]", this,this->id(),handle());
}

AccessInterTask::~AccessInterTask() {
	AccessInterTaskManager::getInstance().removeTask(this);
	ZTRACE("delete AccessInterTask success:[%p,%llu,%d]", this,this->id(),handle());

	//motorcli::MotorReport::getInstance().RmLink(this->id(), ZStringTool::format("%s:%u", this->peerIp(), this->peerPort()));
}

bool AccessInterTask::init(ZEvent &e) {
	return ZTCPTask::init(e);
}
