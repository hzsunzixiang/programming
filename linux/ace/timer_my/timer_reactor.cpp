#include <ace/OS.h>  
#include "ace/Log_Msg.h"
#include <ace/Reactor.h>  

//http://andylin02.iteye.com/blog/440572
// 定时器的实现
// 
// 通过Reactor机制，还可以很容易的实现定时器的功能，使用方式如下。
// 
// 编写一个事件反应器，重载handle_timeout()方法，该方法是定时器的触发时间到时，会自动触发该方法。
// 通过Reactor的schedule_timer()方法注册定时器。
// 启动reacotr的handle_events()事件分发循环。
// 当不想使用定时器时，可以通过Reactor的cancel_timer()方法注销定时器。

class MyTimerHandler : public ACE_Event_Handler  
{  
	private:  
		int inteval;    //执行时间间隔  
		int delay;        //延迟执行时间  
		int timerid;  

	public:  
		MyTimerHandler(int delay, int inteval)  
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
			//return reactor()->cancel_timer(this);  

			// 这里有个重载 既可以根据timer_id 也可以根据ACE_Event_Handler 做参数
			///usr/local/src/ACE_wrappers/ace/Reactor_Timer_Interface.h
  			// virtual int cancel_timer (long timer_id,
  			//                           const void **arg = 0,
  			//                           int dont_call_handle_close = 1) = 0;

  			// virtual int cancel_timer (ACE_Event_Handler *event_handler,
  			//                           int dont_call_handle_close = 1) = 0;

		}  

		//定时器回调函数  
		int handle_timeout (const ACE_Time_Value &current_time, const void * = 0)  
		{  
			time_t epoch = ((timespec_t)current_time).tv_sec;  
			ACE_DEBUG((LM_INFO,  ACE_TEXT ("handle_timeout: %s\n"), ACE_OS::ctime(&epoch)));  
			return 0;  
		}  
};  

int main(int argc, char *argv[])   
{  
	MyTimerHandler * timer = new MyTimerHandler (1, 2);  
	timer->reactor(ACE_Reactor::instance());  
	timer->open();  

	// 反注释掉前面这块代码
	// 表示  处理两次之后关闭定时器
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
	//ACE_Reactor::instance()->run_reactor_event_loop();
	return 0;   
}  




