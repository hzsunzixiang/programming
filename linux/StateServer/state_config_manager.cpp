#include "Framework/z_xml_parser.h"
#include "Framework/z_string_tool.h"
#include "Framework/z_config.h"

#include "state_config_manager.h"

ZMyRedis myMultiTableRedis;
CMemcacheClient myGiMemcache;

StateConfigManager::StateConfigManager() {
	getArgs().logdir = ZConfig::LOG_STATE_DIR;
}

bool StateConfigManager::stateXMLParser(ZXmlParser *xml, void *param) {
	StateConfigManager* mgr = (StateConfigManager*)param;
	xml->getNextChildrenNode();
	ZConfig::CmdArgument& ca = mgr->getArgs();
	while (xml->isCurrentNodeValid()) {
		std::string sid, gi_memcacheid;
		if (xml->getNodePropVal("srv", "id", sid)
		   && xml->getNodePropVal("srv", "gi_memcacheid", gi_memcacheid)){
			if(!ca.sid) ca.sid = ZStringTool::integer(sid);
			if (ca.sid == ZStringTool::integer(sid)){
				mgr->m_gi_mecacheid = gi_memcacheid;
				ZDEBUG("statexml %s,%s", sid.c_str(), gi_memcacheid.c_str());
			}
		}
		xml->getNextNode();
	}
	return true;
}

bool StateConfigManager::init() {
	std::string server_cnf = getArgs().cnfdir + "Server/";
	{
		ZXmlParser xml;
		xml.parse(std::string(server_cnf + "state.xml").c_str(), stateXMLParser, this);
	}
	
	return ZConfigManager::init();
}

const char* StateConfigManager::getRedisAddr() {
	return getAddrByServerId(m_redisid).c_str();
}

const char* StateConfigManager::getMultiTableRedisAddr() {
	return getAddrByServerId(m_multi_table_redisid).c_str();
}
const char* StateConfigManager::getGiMemcacheAddr(){
	return getAddrByServerId(m_gi_mecacheid).c_str();
}

uint32 StateConfigManager::getServerId() {
	return getArgs().sid;
}

ZConfig::CmdArgument& StateConfigManager::getArgs() {
	return ZConfig::myArgs;
}
