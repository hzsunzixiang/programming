#pragma once
#include "Framework/z_stl.h"
#include "Framework/z_singleton.h"
#include "Framework/z_config.h"
#include "Framework/z_config_manager.h"

class ZXmlParser;
class AccessConfigManager : public ZConfigManager, public ZSingleton<AccessConfigManager> {
private:
	friend class ZSingleton<AccessConfigManager>;
	static bool accessXMLParser(ZXmlParser *xml, void* param);
	//static bool serverListXMLParser(ZXmlParser *xml, void* param);

public:
	AccessConfigManager();
	~AccessConfigManager(){}
	bool init();
	uint32 getServerId();
	const std::string getExternalAddr();
	const uint32 getExternalPort();
	const std::string getInternalAddr();
	const uint32 getInternalPort();
	const char* getWebAddr();
	bool isPHPMsg(const uint32 msgid);
	ZConfig::CmdArgument& getArgs();
	bool execEveryWebJs(ZCallback<std::string>& cb) {
		for(std::vector<std::string>::iterator it(m_webjs.begin()),end(m_webjs.end()); it!=end; ++it) {
			cb.exec(&(*it));
		}
		return true;
	}
	const uint32 getProxySvid();
	void setProxySvid(const uint32 proxysvid);
	bool isProxyModel();

private:
	typedef std::set<uint32> FarwordPHPMsgList;
	typedef FarwordPHPMsgList::iterator FarwordPHPMsgListIter;
	FarwordPHPMsgList m_forward_phpmsg;

public:
	const std::string &getMonitorRedisAddr(){
		static std::string addr = getAddrByServerId(m_monitor_redis_sid);
		return addr;
	}
	const char* get_http_acturl();
	const char* get_http_mburl();
	const char* get_http_pcurl();
	const char* get_http_host();
private:
	std::string m_monitor_redis_sid;
	uint32 m_oldTexasserver_svid;
	std::vector<std::string> m_webjs;
	uint32 proxy_texassvid;
	std::string m_http_acturl;
	std::string m_http_mburl;
	std::string m_http_pcurl;
	std::string m_http_host;
};
