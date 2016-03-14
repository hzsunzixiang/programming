#include <ace/Reactor.h>  
#include <ace/SOCK_Connector.h>   
#include <ace/SOCK_Acceptor.h>   
#include <ace/Auto_Ptr.h>  
#include "ace/SOCK_Stream.h"
#include "ace/Svc_Handler.h"

#include "ace/Acceptor.h"  // ACE_Acceptor

#include "ace/Dev_Poll_Reactor.h"
#include "ace/Select_Reactor.h"
#include "ace/TP_Reactor.h"



#define ICHAT_TCP_DEFAULT_BUFFER 8192


//  这个是handler操作

// ****
// * handler 操作主要是处理数据包的

//  位于文件ICHAT_TCP_Handler.h
class ICHAT_TCP_Server;
template <int _buffer_size = ICHAT_TCP_DEFAULT_BUFFER>
class ICHAT_TCP_Handler:public ACE_Svc_Handler<ACE_SOCK_STREAM, ACE_NULL_SYNCH>
{  
	public:  
		ACE_SOCK_Stream &peer (void) { return this->sock_; }  

		virtual ACE_HANDLE get_handle (void) const { return this->sock_.get_handle (); }  

		virtual int handle_input (ACE_HANDLE fd )  
		{  
			int rev = peer().recv(buf, sizeof(buf));   // peer() 是内部定义的
			//int rev = this->peer_.recv(buf,sizeof(buf));  
			if(rev <= 0)  
				return -1;  
			buf[rev] = '\0';  
			printf("recv: %s", buf);  
			strcpy(buf, "hello,Client\n");  
			peer().send(buf, strlen(buf)); //向客户端发送信息。  
			//ICHAT_TCP_Server * server(void)             {return m_pServer;}
			// 有了获取server 的渠道之后 就可以 实现如下方式的回调
			//   SocketServer *pServer = (SocketServer *)this->server();
			// 第一个参数为数据包结构 ，第二个即是 ICHAT_TCP_Handler* 可以再继承一个类 专门用来处理这个数据包了 
			// 从而实现回调的功能
			//   return pServer->ProcessPacket(pPacket, this);
			//  处理数据包的时候加上模板参数 可以进一步封装包结构， 从而把数据和 handler同时传递到 mainserver
			// 再继承一层 用户接受和发送的时候 封装数据包
			
			return 0;  
		}  

		// 释放相应资源  
		virtual int handle_close (ACE_HANDLE, ACE_Reactor_Mask mask)  
		{  
			if (mask == ACE_Event_Handler::WRITE_MASK)  
				return 0;  
			mask = ACE_Event_Handler::ALL_EVENTS_MASK |  
				ACE_Event_Handler::DONT_CALL;  
			this->reactor ()->remove_handler (this, mask);  
			this->sock_.close ();  
			delete this;    //socket出错时，将自动删除该客户端，释放相应资源  
			return 0;  
		}  
		// 获取及设置server对象指针
		ICHAT_TCP_Server * server(void)             {return m_pServer;}
		virtual void server(ICHAT_TCP_Server *p)    {m_pServer = p;}


	protected:  
		char buf[100];  
		ACE_SOCK_Stream sock_;  
		ICHAT_TCP_Server *m_pServer;   // 保存 ICHAT_TCP_Server 注册 并可以获取

};  



// ICHAT_TCP_Server.h
// 继承 ACE_Acceptor， 且 其处理句柄为 ICHAT_TCP_Handler
// 当然 如果在句柄 ICHAT_TCP_Handler 的基础上再多加几个继承层次 可以封装的更加复杂
// make_svc_handler 是子类函数  请求到来时会自动调用
class ICHAT_TCP_Server:public ACE_Acceptor<ICHAT_TCP_Handler<>, ACE_SOCK_ACCEPTOR>
{
	public:
		ICHAT_TCP_Server(void);
		~ICHAT_TCP_Server(void);

	public:
		// 动态创建Handler
		virtual ICHAT_TCP_Handler<> * CreateHandler(void)
		{
			ICHAT_TCP_Handler<> *pNewHandler;   
			//  相当于  SocketHandler  创建的正式 ICHAT_TCP_Handler类，这个类 包含了一个  ICHAT_TCP_Server *m_pServer; 
			//  这样把两者结合起来了 
			ACE_NEW_RETURN(pNewHandler, ICHAT_TCP_Handler<>, 0);
			return pNewHandler;
		}

	private:
		int make_svc_handler(ICHAT_TCP_Handler<> *&);
};

ICHAT_TCP_Server::ICHAT_TCP_Server(void)
{
}

ICHAT_TCP_Server::~ICHAT_TCP_Server(void)
{
}

////////////////////////////////////////////////////////////////////////////////
// make_svc_handler  accept之后会自动调用这个函数来处理  
// 必须要等待链接到来之后才会触发 , 客户端连接过来之后
////////////////////////////////////////////////////////////////////////////////
int ICHAT_TCP_Server::make_svc_handler(ICHAT_TCP_Handler<> *&sh)
{
	sh = (ICHAT_TCP_Handler<>*)this->CreateHandler();

	if(sh == NULL)
	{
		ACE_SOCK_Stream peer;
		if(this->acceptor().accept(peer) == -1)
			return -1;
		peer.close();
		return -1;
	}

	sh->reactor(this->reactor());  // 把server的reactor  传递到 handler的reactor中 
	
	sh->server(this);   //  在这里把server保存 传递给 handler
	return 0;
}




int main(int argc, char *argv[])   
{  
	// ACE_Reactor::instance() 会直接返回一个单例
	printf("00 ACE_Reactor::instance()=%x\n", ACE_Reactor::instance());

	// 如果不想用默认的 可以指定reactor
	ACE_Reactor * pMyReacotr = new ACE_Reactor(new ACE_Dev_Poll_Reactor, 1);
	//ACE_Reactor * pMyReacotr = new ACE_Reactor(new ACE_Select_Reactor, 1);
	//ACE_Reactor * pMyReacotr = new ACE_Reactor(new ACE_TP_Reactor, 1);

	//pMyReacotr->restart(1);  // 这句可有可无吗
	ACE_Reactor::instance(pMyReacotr);



	ACE_INET_Addr addr(7777, "127.0.0.1");  
	ICHAT_TCP_Server test_server;
	// 调用 ACE_Svc_Handler 的open函数 是其父类的函数
	printf("11 ACE_Reactor::instance()=%x\n", ACE_Reactor::instance());
	if(test_server.open(addr, ACE_Reactor::instance(), ACE_NONBLOCK) == -1)
	{
		printf("SocketServer::open error");
		exit(-1);
	}
	printf("22 ACE_Reactor::instance()=%x\n", ACE_Reactor::instance());
	// 等待客户端的请求到来
	return ACE_Reactor::instance()->run_reactor_event_loop();
}   


// StephenSun@192.168.202.90:~/programming/linux/ace/Server_my$ telnet 127.0.0.1 7777
// Trying 127.0.0.1...
// Connected to 127.0.0.1.
// Escape character is '^]'.
// helll
// hello,Client






// StephenSun@192.168.202.90:~/programming/linux/ace/Server_my$ ./server1
// 00 ACE_Reactor::instance()=1fc61880
// 11 ACE_Reactor::instance()=1fc76cc0
// 22 ACE_Reactor::instance()=1fc76cc0
// recv: hhhhhhh


