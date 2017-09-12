#pragma once
#include "Framework/z_stl.h"
#include "Framework/z_entry.h"
#include "Framework/z_singleton.h"
#include "Framework/z_config.h"
#include "Framework/z_myredis.h"
#include "GameLib/memcached/MemCacheClient.h"
#include "Framework/z_config_manager.h"

class ZXmlParser;
class StateConfigManager : public ZConfigManager, public ZSingleton<StateConfigManager> {
private:
	friend class ZSingleton<StateConfigManager>;
	static bool stateXMLParser(ZXmlParser *xml, void *param);

public:
	StateConfigManager();
	~StateConfigManager(){}
	bool init();
	uint32 getServerId();
	const char* getRedisAddr();
	const char* getMultiTableRedisAddr();
	const char* getGiMemcacheAddr();
	ZConfig::CmdArgument& getArgs();

private:
	std::string m_redisid;
	std::string m_multi_table_redisid;
	std::string m_gi_mecacheid;
};
extern ZMyRedis myMultiTableRedis;
extern CMemcacheClient myGiMemcache;
