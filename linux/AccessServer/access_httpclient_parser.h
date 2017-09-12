#pragma once
#include "Framework/z_singleton.h"
#include "Framework/z_msgparser.h"

class AccessHttpClient;
class AccessHttpClientParser : public ZMsgParser, public ZSingleton<AccessHttpClientParser> {
private:
	friend class ZSingleton<AccessHttpClientParser>;
	AccessHttpClientParser(){}

public:
	~AccessHttpClientParser(){}
	bool init();
};
