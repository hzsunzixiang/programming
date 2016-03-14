#include <ace/OS.h>  
#include <ace/Reactor.h>  
#include "ace/Log_Msg.h"
#include <iostream>
#include <stdio.h>


// http://www.tuicool.com/articles/Zb263e
class MyTimerHandler : public ACE_Event_Handler  
{  

	public:  
		MyTimerHandler(int delay, int inteval)  
		{  
			//注册回调器
			this->reactor(ACE_Reactor::instance());
			//设置回调器多长时间回调一次
			this->reactor()->schedule_timer(this,  
					0,    //传递handle_timeout给的参数  
					ACE_Time_Value(delay),  
					ACE_Time_Value(inteval));
		}  
		//定时器回调函数  
		// 注意这里必须是引用 不然重载的不是想要的函数
		int handle_timeout (const ACE_Time_Value &t_time, const void * = 0)  
		{  
			std::cout<<"time out :: handle_timeout() "<<std::endl;
			return 0;  
		}  
};  

int main(int argc, char *argv[])   
{  
	//创建一个定时器
	MyTimerHandler mt(1, 1);  
	//捕捉定时器到时事件，到时后，执行计时器的handle_timeout()方法
	ACE_Reactor::instance()->run_reactor_event_loop();

	return 0;   
}
