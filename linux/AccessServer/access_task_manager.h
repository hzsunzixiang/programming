#pragma once

#include "Framework/z_entry.h"
#include "Framework/z_task.h"
#include "Framework/z_singleton.h"

class AccessTaskManager : public ZTaskManager<>, public ZSingleton<AccessTaskManager> {
private:
	friend class ZSingleton<AccessTaskManager>;
	AccessTaskManager(){}
public:
	~AccessTaskManager(){destroy();}
};

class AccessTask;
class AccessTaskVerifyManager : public IndexTempID<>, public ZSingleton<AccessTaskVerifyManager> {
private:
	friend class ZSingleton<AccessTaskVerifyManager>;
	AccessTaskVerifyManager() : IndexTempID<>(0x100000000){}
public:
	~AccessTaskVerifyManager(){}
	bool addTask(AccessTask *t);
	void removeTask(AccessTask *t);
	AccessTask* getTaskById(const uint64 id);
};
