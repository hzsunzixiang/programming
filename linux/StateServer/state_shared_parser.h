#pragma once
#include "Framework/z_singleton.h"
#include "Framework/z_msgparser.h"

class StateSharedParser : public ZMsgParser, public ZSingleton<StateSharedParser> {
private:
	friend class ZSingleton<StateSharedParser>;
	StateSharedParser(){}

public:
	~StateSharedParser(){}
	bool init();
};
