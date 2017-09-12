#pragma once
#include "Framework/z_singleton.h"
#include "Framework/z_user_msgparser.h"

class StateUserMsgParser : public ZUserMsgParser, public ZSingleton<StateUserMsgParser> {
private:
	friend class ZSingleton<StateUserMsgParser>;
	StateUserMsgParser(){}

public:
	~StateUserMsgParser(){}
	bool init();
};
