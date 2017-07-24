#pragma once
#include "Framework/z_event.h"
#include "Framework/z_tcpserver.h"
#include "Framework/z_singleton.h"
#include "Framework/z_service.h"

enum TimeTickEvent {
	TimeTickEvent_Null,
	TimeTickEvent_OnHeartBeat,
};
class AccessServer : public ZService, public ZSingleton<AccessServer> {
private:
	friend class ZSingleton<AccessServer>;
	AccessServer(){}
	static void onTaskAccept(int32 fd, int16 which, void *arg);
	static void onInterTaskAccept(int32 fd, int16 which, void *arg);
	static void onHttpTaskAccept(int32 fd, int16 which, void *arg);

public:
	~AccessServer(){}
	bool init();
	ZEvent& getMainEvent() {return m_main_event;}

private:
	ZTCPServer m_task_server;
	ZTCPServer m_intertask_server;
};
