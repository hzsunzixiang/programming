#include "Framework/z_type.h"
#include "Framework/z_argument.h"
#include "Framework/z_string_tool.h"

#include "access_task.h"
#include "access_task_manager.h"
#include "access_intertask.h"
#include "access_task_parser.h"
#include "access_server.h"
#include "access_httpserver.h"
#include "access_httpclient.h"
#include "access_intertask_parser.h"
#include "access_config_manager.h"

//#include "GameLib/monitor-cli/monitor_report_cli.h"

static char ServiceDoc[] = "\nAccessServer(接入服务器)\n";

#define PACKAGE_VERSION_SERVER "1.0.2.2"

static struct argp_option ServiceOptions[] = {
	{"version",         'v',    "version",		    0,  "Service version",													0},
	{"logdir",          'f',    "logdir",			0,  "Log file directory",												0},
	{"loglv",           'l',    "loglv",			0,  "Log level(1 debug, 2 trace, 3 notice,4 warning, 5 error)",         0},
	{"cnfdir",			'c',    "cnfdir",			0,  "Configure file root directory",									0},
	{"serverid",        'r',    "serverid",			0,  "Server ID",														0},
	{"proxysvid",       's',    "proxysvid",		0,  "proxysvid oldTexasServerID",												0},
	{0,                 0,      0,					0,  0,																	0}
};

static error_t parseServiceOption(int32 key, char *arg, struct argp_state *state) {
	ZConfig::CmdArgument& ca = AccessConfigManager::getInstance().getArgs();
	switch (key) {
	case 'v':
		ca.version = arg;
		break;
	case 'f':
		ca.logdir = arg;
		break;
	case 'l':
		ca.loglv = static_cast<BPTLogLevel>(ZStringTool::integer(arg));
		break;
	case 'c':
		ca.cnfdir = arg;
		break;
	case 'r':
		ca.sid = ZStringTool::integer(arg);
		snprintf(ZConfig::LOG_MODULE_NAME, sizeof(ZConfig::LOG_MODULE_NAME)-1, "access-%u-", ca.sid);
		break;
	case 's':
		AccessConfigManager::getInstance().setProxySvid(ZStringTool::integer(arg));
		break;
	default: return ARGP_ERR_UNKNOWN;
	}
	return 0;
}

bool AccessServer::init() {
	ZConfig::CmdArgument& ca = AccessConfigManager::getInstance().getArgs();
	CheckCondition(logInit((BPTLogLevel)ca.loglv, ZConfig::LOG_MODULE_NAME, ca.logdir.c_str(), true), false);
	CheckCondition(AccessConfigManager::getInstance().init(), false);
	CheckCondition(AccessTaskParser::getInstance().init(), false);
	CheckCondition(AccessInterTaskParser::getInstance().init(), false);
	//CheckCondition(AccessHttpClientParser::getInstance().init(), false);
	uint32 sid = AccessConfigManager::getInstance().getArgs().sid;
	const std::string strExtAddr = AccessConfigManager::getInstance().getExternalAddr();
	const char *extAddr =  strExtAddr.c_str();
	uint32 extPort = AccessConfigManager::getInstance().getExternalPort();
	if (extAddr && (strlen(extAddr) > 0) && extPort > 0)
	{
		bool res = m_task_server.init(m_main_event, extAddr, extPort, onTaskAccept);
		if (!res)
		{
			ZERROR("init() error check the extPort:%d is already bind or not", extPort);
			return false;
		}
	}
	else
	{
		ZERROR("config error sid:%d extAddr:%p, extPort:%d", sid ,extAddr, extPort);
		return false;
	}
    const std::string strIntAddr = AccessConfigManager::getInstance().getInternalAddr();
	const char *interAddr = strIntAddr.c_str(); 
	uint32 interPort = AccessConfigManager::getInstance().getInternalPort();
	if (interAddr && (strlen(interAddr) > 0) && interPort> 0)
	{
		bool res = m_intertask_server.init(m_main_event, interAddr, interPort, onInterTaskAccept);
		if (!res)
		{
			ZERROR("init() error check the interPort:%d is already bind or not", interPort);
			return false;
		}
	}
	else
	{
		ZERROR("config error sid:%d interAddr:%p, interPort:%d", sid, interAddr, interPort);
		return false;
	}

	//CheckCondition(AccessHttpServer::getInstance().init(AccessConfigManager::getInstance().getJsIpByServerId(ca.sid).c_str(),AccessConfigManager::getInstance().getJsPortByServerId(ca.sid)), false);


	/*
	//监控上报
	if (!AccessConfigManager::getInstance().getMonitorRedisAddr().empty())
	{
		CheckCondition(motorcli::MotorReport::getInstance().init(AccessConfigManager::getInstance().getMonitorRedisAddr().c_str()), false);

		std::string sname = ServiceDoc;
		motorcli::MotorReport::getInstance().AddServer(AccessConfigManager::getInstance().getServerId(),\
				ZStringTool::erase(sname,"\n"), \
				ZStringTool::format("%s:%d", AccessConfigManager::getInstance().getInternalAddr(), \
					AccessConfigManager::getInstance().getInternalPort()),\
				ZStringTool::format("%s:%d", AccessConfigManager::getInstance().getExternalAddr(), \
					AccessConfigManager::getInstance().getExternalPort()));
	}
	*/
	return ZService::init();
}

void AccessServer::onTaskAccept(int32 fd, int16 which, void *arg) {
	ZTCPServer *s = (ZTCPServer*)arg;

	int32 sfd = s->getAcceptFd(fd);
	CheckConditionVoid(-1 != sfd);

	AccessTask *at = ZNEW AccessTask(sfd);
	CheckConditionVoid(at);

	ZDEBUG("the sfd is:%d, AccessTask:%p", sfd, at);
	if(!AccessTaskVerifyManager::getInstance().addTask(at)) {
		ZERROR("add to VerifyManager error :%p,%llu,%d", at,at->id(),sfd);
		ZDEL(at);
		return;
	}
	if(!at->init()) {
		ZERROR("init connnection error :%p,%llu,%d", at,at->id(),sfd);
		ZDEL(at);
		return;
	}
	else
	{
		ZDEBUG("init connection success:%p,%llu,%d",at,at->id(),sfd);
	}
	ZDEBUG("create connection success:%p,%llu,%d",at,at->id(),sfd);
}

void AccessServer::onInterTaskAccept(int32 fd, int16 which, void *arg) {
	ZTCPServer *s = (ZTCPServer*)arg;

	int32 sfd = s->getAcceptFd(fd);
	CheckConditionVoid(-1 != sfd);

	AccessInterTask *ait = ZNEW AccessInterTask(sfd);
	CheckConditionVoid(ait);

	if(!ait->init(m_main_event)) {
		ZERROR("init connnection error :%p,%llu,%d", ait,ait->id(),sfd);
		ZDEL(ait);
		return;
	}
	ZDEBUG("create connection success:%p,%llu,%d",ait,ait->id(),sfd);
}

int main(int argc, char **argv) {

	// 打印版本
	if (argc == 2) {
		if (strcmp(argv[1], "-v") == 0 || strcmp(argv[1], "-V") == 0) {
			printf("Version:        %s\r\n", PACKAGE_VERSION_SERVER);
			printf("Version:        %s\r\n", PACKAGE_VERSION_SERVER);
			printf("Time:           %s\r\n",   __TIME__);
			printf("Data:           %s\r\n",  __DATE__);
			exit(0);
		}
	}

	int i = 0;
	for (i = 1; i < argc; ++i){ 
		if (strcmp(argv[i], "-v") == 0) {
			goto find_version;
		}
	}
	char const * parg[20];
	for (i = 0; i < argc; ++i){
		parg[i] = argv[i];
	}
	parg[i++] = "-v";
	//版本号
	parg[i++] = PACKAGE_VERSION_SERVER;
	parg[i] = NULL;
	//  添加版本号信息 重新执行一遍
	execv(argv[0], (char* const*)parg);
	exit(0);

find_version:
	snprintf(ZConfig::LOG_MODULE_NAME, sizeof(ZConfig::LOG_MODULE_NAME)-1, "access-");
	CheckCondition(ZArg::getInstance().add(ServiceOptions, parseServiceOption, 0, ServiceDoc), EXIT_FAILURE);
	CheckCondition(ZArg::getInstance().parse(argc, argv), EXIT_FAILURE);
	CheckCondition(AccessServer::getInstance().init(), EXIT_FAILURE);
        if(AccessConfigManager::getInstance().isProxyModel()){
            ZTRACE("start proxy model,svid=%u",AccessConfigManager::getInstance().getProxySvid());
        }
	AccessServer::getInstance().start();
	return EXIT_SUCCESS;
}
