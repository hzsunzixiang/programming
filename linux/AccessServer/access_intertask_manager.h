#pragma once

#include "Framework/z_task.h"
#include "Framework/z_singleton.h"

class AccessInterTaskManager : public ZTaskManager<>, public ZSingleton<AccessInterTaskManager> {
private:
	friend class ZSingleton<AccessInterTaskManager>;
	AccessInterTaskManager(){}
public:
	~AccessInterTaskManager(){destroy();}
};
