#include "Framework/z_type.h"
#include "Framework/z_event.h"
#include "Framework/z_argument.h"
#include "Framework/z_myredis.h"
#include "Framework/z_config.h"
#include "Framework/z_string_tool.h"

#include "GameLib/access-cli/cli.h"
#include "GameLib/notify-cli/notifycli.h"

#include "state_server.h"
#include "state_httptask.h"
#include "state_httptask_parser.h"
#include "state_user_msgparser.h"
#include "state_config_manager.h"
#include "state_shared_parser.h"
#include "state_forward_msgparser.h"

static char ServiceDoc[] = "\nStateServer(状态服务器)\n";

#define PACKAGE_VERSION_SERVER "1.0.2.0"

static struct argp_option ServiceOptions[] = {
	{"version",         'v',    "version",		    0,  "Service version",													0},
	{"logdir",          'f',    "logdir",			0,  "Log file directory",												0},
	{"loglv",           'l',    "loglv",			0,  "Log level(1 debug, 2 trace, 3 notice,4 warning, 5 error)",         0},
	{"cnfdir",			'c',    "cnfdir",			0,  "Configure file root directory",									0},
	{"serverid",        'r',    "serverid",			0,  "Server ID",														0},
	{0,                 0,      0,					0,  0,																	0}
};

static error_t parseServiceOption(int32 key, char *arg, struct argp_state *state) {
	ZConfig::CmdArgument& ca = StateConfigManager::getInstance().getArgs();
	switch (key) {
	case 'v':
		// printf("%s\n", argp_program_version);
		// exit(EXIT_SUCCESS);
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
		snprintf(ZConfig::LOG_MODULE_NAME, sizeof(ZConfig::LOG_MODULE_NAME)-1, "state-%u-", ca.sid);
		break;
	default: return ARGP_ERR_UNKNOWN;
	}
	return 0;
}

bool StateServer::init() {
	CheckCondition(StateConfigManager::getInstance().init(), false);
	CheckCondition(accli::UClientTaskManager::getInstance().init(&StateConfigManager::getInstance(),
																 &StateSharedParser::getInstance(),
																 &StateUserMsgParser::getInstance(), 
																 &StateForwardMsgParser::getInstance(),
																 NULL), false);

	CheckCondition(StateHttpTaskParser::getInstance().init(), false);
	//CheckCondition(myRedis.initRedis(StateConfigManager::getInstance().getRedisAddr()), false);
	//CheckCondition(myMultiTableRedis.initRedis(StateConfigManager::getInstance().getMultiTableRedisAddr()), false);
	CheckCondition(notifycli::UClientTaskManager::getInstance().initMS(StateConfigManager::getInstance()), false);
	const char* giMemcacheAddr = StateConfigManager::getInstance().getGiMemcacheAddr();
	if (giMemcacheAddr && (strlen(giMemcacheAddr) > 0))
	{
		CheckCondition(myGiMemcache.Init(giMemcacheAddr), false);
	}
	else
	{
		ZERROR("config error. GiMemcacheAddr strlen:%lu", strlen(giMemcacheAddr));
		return false;
	}

	return ZService::init();
}

void StateServer::onHttpTaskAccept(int32 fd, int16 which, void *arg) {
	ZTCPServer *s = (ZTCPServer*)arg;

	int32 sfd = s->getAcceptFd(fd);
	CheckConditionVoid(-1 != sfd);

	StateHttpTask *ait = ZNEW StateHttpTask(sfd);
	CheckConditionVoid(ait);

	if(!ait->init()) {
		ZDEL(ait);
		ZERROR("初始化连接失败:%d", sfd);
	}
}

static void onSighupHandler(evutil_socket_t fd, short ev_type, void *arg){
	StateServer::getInstance().init();
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

	snprintf(ZConfig::LOG_MODULE_NAME, sizeof(ZConfig::LOG_MODULE_NAME)-1, "state-");
	CheckCondition(ZArg::getInstance().add(ServiceOptions, parseServiceOption, 0, ServiceDoc), EXIT_FAILURE);
	CheckCondition(ZArg::getInstance().parse(argc, argv), EXIT_FAILURE);
	ZConfig::CmdArgument& ca = StateConfigManager::getInstance().getArgs();
	CheckCondition(logInit((BPTLogLevel)ca.loglv, ZConfig::LOG_MODULE_NAME, ca.logdir.c_str(), true), false);
	StateServer::getInstance().regSysSignal();
	StateServer::getInstance().regSignal(SIGHUP, onSighupHandler, NULL);
	CheckCondition(StateServer::getInstance().init(), EXIT_FAILURE);

	StateServer::getInstance().start();
	return EXIT_SUCCESS;
}
