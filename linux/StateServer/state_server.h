#pragma once
#include "Framework/z_event.h"
#include "Framework/z_tcpserver.h"
#include "Framework/z_singleton.h"
#include "Framework/z_service.h"


enum TimeTickEvent {
	TimeTickEvent_Null,
	TimeTickEvent_Reconnect,
};
class StateServer :  public ZService, public ZSingleton<StateServer> {
private:
	friend class ZSingleton<StateServer>;
	StateServer(){}

public:
	~StateServer(){}
	bool init();
	ZEvent& getMainEvent() {return m_main_event;}

private:
	static void onHttpTaskAccept(int32 fd, int16 which, void *arg);

private:
	ZTCPServer m_httptask_server;
};
