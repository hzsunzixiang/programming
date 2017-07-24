#pragma once
#include "Framework/z_singleton.h"
#include "Framework/z_msgparser.h"

class AccessTask;
class AccessTaskParser : public ZMsgParser, public ZSingleton<AccessTaskParser> {
private:
	friend class ZSingleton<AccessTaskParser>;
	AccessTaskParser(){}

public:
	~AccessTaskParser(){}
	bool init();
};
