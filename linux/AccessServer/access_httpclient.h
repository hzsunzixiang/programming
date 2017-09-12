#pragma once
#include "Framework/z_httpclient.h"
#include "Framework/z_singleton.h"

class AccessTask;
class AccessHttpClient : public ZHttpClient {
public:
	AccessHttpClient(AccessTask *task);
	~AccessHttpClient();
	static void httpHandle(struct evhttp_request *req, void *arg);
	static void httpOldTexasHandle(struct evhttp_request *req, void *arg);
	const char* getClassName()const {return "AccessHttpClient";}
	void clear();
	AccessTask* task();
	bool sendCmd(const void* data, const uint16 dlen);
	static bool req(const char* uri, AccessTask *t, const void *data, const int32 dlen);
	static bool reqOldTexas(const bool islogin,const uint8 clitype, const uint32 seq, AccessTask *t, const std::string& head, const std::string& content);

private:
	uint64 m_taskid;
	uint32 m_client_fid;
	bool m_islogin;
};
