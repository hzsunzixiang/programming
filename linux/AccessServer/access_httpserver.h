#pragma once

#include "Framework/z_singleton.h"
#include "Framework/z_httpserver.h"

class AccessHttpServer : public ZHttpServer, public ZSingleton<AccessHttpServer> {
private:
	friend class ZSingleton<AccessHttpServer>;
	AccessHttpServer(){}

public:
	~AccessHttpServer(){}
	bool init(const char* addr, const uint16 port);
};
