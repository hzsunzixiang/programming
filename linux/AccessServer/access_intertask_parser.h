#pragma once
#include "Framework/z_singleton.h"
#include "Framework/z_msgparser.h"

class AccessInterTaskParser : public ZMsgParser, public ZSingleton<AccessInterTaskParser> {
private:
	friend class ZSingleton<AccessInterTaskParser>;
	AccessInterTaskParser(){}

public:
	~AccessInterTaskParser(){}
	bool init();
};
