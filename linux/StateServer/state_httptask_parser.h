#pragma once
#include "Framework/z_singleton.h"
#include "Framework/z_msgparser.h"

class StateHttpTaskParser : public ZMsgParser, public ZSingleton<StateHttpTaskParser> {
private:
	friend class ZSingleton<StateHttpTaskParser>;
	StateHttpTaskParser(){}

public:
	~StateHttpTaskParser(){}
	bool init();
};
