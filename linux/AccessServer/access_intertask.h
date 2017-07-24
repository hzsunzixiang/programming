#pragma once
#include "Framework/z_tcp_task.h"

class AccessInterTask : public ZTCPTask {
public:
	AccessInterTask(const int32 nfd);
	~AccessInterTask();
	bool init(ZEvent &e);
	const char* getClassName() {return "AccessInterTask";}
	const std::string& getVersion() {return m_version;}
	void setVersion(const std::string& v){m_version = v;}
	void setLatestVersion(const std::string& v) {m_latest_version = v;}
	const std::string& getLatestVersion() {return m_latest_version;}

private:
	std::string m_version;
	std::string m_latest_version;
};
