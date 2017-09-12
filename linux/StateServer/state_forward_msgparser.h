#pragma once
#include "Framework/z_singleton.h"
#include "Framework/z_user_msgparser.h"

class StateForwardMsgParser : public ZUserMsgParser, public ZSingleton<StateForwardMsgParser>{
private:
	friend class ZSingleton<StateForwardMsgParser>;
	StateForwardMsgParser(){}

public:
	~StateForwardMsgParser(){}
	bool init();
};
