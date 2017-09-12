#pragma once
#include "Framework/z_tcp_task.h"

class StateHttpTask : public ZTCPTask {
public:
	StateHttpTask(const int32 nfd);
	~StateHttpTask();
	bool init();
	const char* getClassName() {return "StateHttpTask";}
};
