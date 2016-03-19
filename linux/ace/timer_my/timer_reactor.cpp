#include <ace/OS.h>  
#include "ace/Log_Msg.h"
#include <ace/Reactor.h>  

//http://andylin02.iteye.com/blog/440572

class MyTimerHandler : public ACE_Event_Handler  
{  
	private:  
		int inteval;    //执行时间间隔  
		int delay;        //延迟执行时间  
		int timerid;  

	public:  
		MyTimerHandler(int delay,int inteval)  
		{  
			this->delay=delay;  
			this->inteval=inteval;  
		}  

		int open()    //注册定时器  
		{  
			ACE_Time_Value delaytime(delay);  
			ACE_Time_Value intevaltime(inteval);  
			timerid = reactor()->schedule_timer(this,  
					0,    //传递handle_timeout给的参数  
					delaytime,  
					intevaltime);  
			return timerid;  
		}  

		int close()    //取消定时器  
		{  
			return reactor()->cancel_timer(timerid);  
		}  

		//定时器回调函数  
		int handle_timeout (const ACE_Time_Value &current_time,  
				const void * = 0)  
		{  
			time_t epoch = ((timespec_t)current_time).tv_sec;  
			ACE_DEBUG ((LM_INFO,  
						ACE_TEXT ("handle_timeout: %s\n"),  
						ACE_OS::ctime (&epoch)));  
			return 0;  
		}  
};  

int main(int argc, char *argv[])   
{  
	MyTimerHandler * timer = new MyTimerHandler (1, 2);  
	timer->reactor(ACE_Reactor::instance());  
	timer->open();  

	// 前面这块代码不要
	//for(int i = 0; i < 2; i++)    //触发次handle_timeout事件  
	//{  
	//	//ACE_OS::printf("\n--- %d-----\n", i);  
	//	printf("\n--- %d-----\n", i);  
	//	ACE_Reactor::instance()->handle_events();  
	//}  

	//timer->close();  
	//ACE_OS::printf("cancel timer");  
	//ACE_OS::printf("cancel timer");  
	while(true)  
		ACE_Reactor::instance()->handle_events();  
	return 0;   
}  




