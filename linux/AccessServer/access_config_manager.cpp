#include "Framework/z_xml_parser.h"
#include "Framework/z_string_tool.h"
#include "Framework/z_config.h"

#include "access_config_manager.h"

AccessConfigManager::AccessConfigManager() {
	getArgs().logdir = ZConfig::LOG_ACCESS_DIR;
	proxy_texassvid=0;
}
bool AccessConfigManager::accessXMLParser(ZXmlParser *xml, void* param) {
	AccessConfigManager *mgr = (AccessConfigManager*)param;
	mgr->m_forward_phpmsg.clear();
	mgr->m_webjs.clear();
	ZConfig::CmdArgument& ca = mgr->getArgs();
	xml->getNextChildrenNode();
	while (xml->isCurrentNodeValid()) {
		//std::string sid, logdir, msg,webjs, acturl, mburl, pcurl, host;
		std::string sid, logdir, acturl, mburl, pcurl, host;
		if(xml->getNodePropVal("srv", "id", sid) &&
		xml->getNodePropVal("srv", "act_url", acturl) && 
		xml->getNodePropVal("srv", "mb_url", mburl) && 
		xml->getNodePropVal("srv", "pc_url", pcurl) && 
		xml->getNodePropVal("srv", "host", host)) {
			if(!ca.sid) ca.sid = ZStringTool::integer(sid);
			if(ca.sid==ZStringTool::integer(sid)){
				//只读取本身sid的配置
				mgr->m_http_acturl=acturl;
				mgr->m_http_mburl=mburl;
				mgr->m_http_pcurl=pcurl;
				mgr->m_http_host=host;

				//std::vector<std::string> vec;
				//ZStringTool::split(msg, '-', vec);
				//for(std::vector<std::string>::iterator it(vec.begin()),end(vec.end()); it!=end; ++it) {
				//		mgr->m_forward_phpmsg.insert(ZStringTool::integer(*it));
				//}
				//vec.clear();
				//ZStringTool::split(webjs, ' ', vec);
				//for(std::vector<std::string>::iterator it(vec.begin()),end(vec.end()); it!=end; ++it) {
				//		mgr->m_webjs.push_back(*it);
				//}
				ZTRACE("accessxml %s", sid.c_str());
			}
		}
		/*std::string monitorrsid;
		if (xml->getNodePropVal("srv","monitorredisid",monitorrsid))
		{
			if (!monitorrsid.empty())
				mgr->m_monitor_redis_sid = monitorrsid;
		}*/
		xml->getNextNode();
	}
	return true;
}

bool AccessConfigManager::init() {
	std::string server_cnf = getArgs().cnfdir + "Server/";
	{
		ZXmlParser xml;
		xml.parse(std::string(server_cnf + "access.xml").c_str(), accessXMLParser, this);
	}
	return ZConfigManager::init();
}

uint32 AccessConfigManager::getServerId() {
	return getArgs().sid;
}

const uint32 AccessConfigManager::getProxySvid(){
	return proxy_texassvid;
}

void AccessConfigManager::setProxySvid(const uint32 proxysvid){
	proxy_texassvid=proxysvid;
}

bool AccessConfigManager::isProxyModel(){
	return proxy_texassvid > 0;
}

const std::string AccessConfigManager::getExternalAddr() {
	std::vector<std::string> vec;
	ZStringTool::split(m_exteraddr_list[getArgs().sid], ':', vec);
	if(vec.size() != 2) {
		return "";
	}
	return vec[0];
}

const uint32 AccessConfigManager::getExternalPort() {
	std::vector<std::string> vec;
	ZStringTool::split(m_exteraddr_list[getArgs().sid], ':', vec);
	if(vec.size() != 2) {
		return ZConfig::DEFAULT_PORT;
	}
	return ZStringTool::integer(vec[1]);
}

const std::string AccessConfigManager::getInternalAddr() {
	std::vector<std::string> vec;
	ZStringTool::split(m_srvlists[getArgs().sid], ':', vec);
	if(vec.size() != 2) {
		return ZConfig::DEFAULT_ADDRESS;
	}
	return vec[0];
}

const uint32 AccessConfigManager::getInternalPort() {
	std::vector<std::string> vec;
	ZStringTool::split(m_srvlists[getArgs().sid], ':', vec);
	if(vec.size() != 2) {
		return ZConfig::DEFAULT_PORT;
	}
	return ZStringTool::integer(vec[1]);
}

const char* AccessConfigManager::getWebAddr() {
	return m_webaddr_list[getArgs().sid].c_str();
}

bool AccessConfigManager::isPHPMsg(const uint32 msgid) {
	FarwordPHPMsgListIter it = m_forward_phpmsg.find(msgid);
	return it != m_forward_phpmsg.end();
}

const char* AccessConfigManager::get_http_acturl(){
	return m_http_acturl.c_str();
}
const char* AccessConfigManager::get_http_mburl(){
	return m_http_mburl.c_str();
}
const char* AccessConfigManager::get_http_pcurl(){
	return m_http_pcurl.c_str();
}
const char* AccessConfigManager::get_http_host(){
	return m_http_host.c_str();
}
ZConfig::CmdArgument& AccessConfigManager::getArgs() {
	return ZConfig::myArgs;
}
