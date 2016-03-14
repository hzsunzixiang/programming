#include <iostream>
#include "ace/Log_Msg.h"
#include "ace/Event_Handler.h"
#include "ace/Reactor.h"
#include "ace/Thread_Manager.h"

// http://blog.csdn.net/calmreason/article/details/38336213

bool stop_event_loop = false;//是否需要终止计时器服务

class My_Timer_Handler : public ACE_Event_Handler
{
	public:
		My_Timer_Handler(const int delay, const int interval);
		~My_Timer_Handler();
		int handle_timeout(const ACE_Time_Value&, const void *act /* = 0 */);//计时器到期后执行的回调函数
	private:
		int n_;//循环计时的次数
		long time_handle_;//在计时器队列中的ID
};

My_Timer_Handler::My_Timer_Handler(const int delay,const int interval):n_(0)
{
	std::cout<<"My_Timer_Handler()"<<std::endl;
	this->reactor(ACE_Reactor::instance());
	this->time_handle_ = this->reactor()->schedule_timer(this,//在这里注册定时器
			0,
			ACE_Time_Value(delay),//程序一开始延迟delay秒开始首次执行到期函数
			ACE_Time_Value(interval));//循环计时，每隔interval秒重复执行
}

My_Timer_Handler::~My_Timer_Handler()
{
	std::cout<<"~My_Timer_Handler()"<<std::endl;
}


int My_Timer_Handler::handle_timeout(const ACE_Time_Value& , const void *act /* = 0 */)
{
	if (++this->n_>3)
	{
			// 这里有个重载 既可以根据timer_id 也可以根据ACE_Event_Handler 做参数
			///usr/local/src/ACE_wrappers/ace/Reactor_Timer_Interface.h
  			// virtual int cancel_timer (long timer_id,
  			//                           const void **arg = 0,
  			//                           int dont_call_handle_close = 1) = 0;

  			// virtual int cancel_timer (ACE_Event_Handler *event_handler,
  			//                           int dont_call_handle_close = 1) = 0;

		ACE_Reactor::instance()->cancel_timer(this->time_handle_);
		stop_event_loop = true;
		std::cout<<"cancle_timer"<<std::endl;
	}
	else
	{
		std::cout<<"my timer handler " << time_handle_ << "  handled timeout"<<std::endl;
	}

	return 0;
}

int main(int argc, char* argv[])
{

	My_Timer_Handler my_handle(1,1);
	My_Timer_Handler my_handle1(2,1);

	while (true)
	{
		if (stop_event_loop)
		{
			std::cout<<"stop handle time"<<std::endl;
			break;
		}
		ACE_Reactor::instance()->handle_events();
	}

	// 这种方式无法处理 停止情况  handler中用 exit 不会调用析构函数
	// ACE_Reactor::instance ()->run_reactor_event_loop();

	return 0;
}

