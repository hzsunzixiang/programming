#include <ace/Reactor.h>  
#include <ace/SOCK_Connector.h>   
#include <ace/SOCK_Acceptor.h>   
#include <ace/Auto_Ptr.h>  


class ClientService : public ACE_Event_Handler  
{  
	public:  
		ACE_SOCK_Stream &peer (void) { return this->sock_; }  

		int open (void)  
		{  
			//注册读就绪回调函数  
			return this->reactor ()->register_handler(this, ACE_Event_Handler::READ_MASK);  
		}  

		virtual ACE_HANDLE get_handle (void) const { return this->sock_.get_handle (); }  

		virtual int handle_input (ACE_HANDLE fd )  
		{  
			int rev = peer().recv(buf,sizeof(buf));  
			if(rev<=0)  
				return -1;  
			buf[rev] = '\0';  
			printf("recv: %s",buf);  
			strcpy(buf,"hello,Client\n");  
			peer().send(buf,strlen(buf)); //向客户端发送信息。  
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

	protected:  
		char buf[100];  
		ACE_SOCK_Stream sock_;  
};  


class ClientAcceptor : public ACE_Event_Handler  
{  
	public:  
		virtual ~ClientAcceptor (){this->handle_close (ACE_INVALID_HANDLE, 0);}  

		int open (const ACE_INET_Addr &listen_addr)  
		{  
			if (this->acceptor_.open (listen_addr, 1) == -1)  
			{  
				printf("open port fail\n");  
				return -1;  
			}  
			//注册接受连接回调事件  
			return this->reactor ()->register_handler(this, ACE_Event_Handler::ACCEPT_MASK);  
		}  

		virtual ACE_HANDLE get_handle (void) const  
		{ return this->acceptor_.get_handle (); }  

		virtual int handle_input (ACE_HANDLE fd )  
		{  
			ClientService *client = new ClientService();  
			auto_ptr<ClientService> p (client);  

			if (this->acceptor_.accept (client->peer ()) == -1)  
			{  
				printf("accept client fail\n");  
				return -1;  
			}  
			p.release ();  
			client->reactor (this->reactor ());  
			if (client->open () == -1)  
				client->handle_close (ACE_INVALID_HANDLE, 0);  
			return 0;  
		}  

		virtual int handle_close (ACE_HANDLE handle,  
				ACE_Reactor_Mask close_mask)  
		{  
			if (this->acceptor_.get_handle () != ACE_INVALID_HANDLE)  
			{  
				ACE_Reactor_Mask m = ACE_Event_Handler::ACCEPT_MASK |  
					ACE_Event_Handler::DONT_CALL;  
				this->reactor ()->remove_handler (this, m);  
				this->acceptor_.close ();  
			}  
			return 0;  
		}  

	protected:  
		ACE_SOCK_Acceptor acceptor_;  
};  

int main(int argc, char *argv[])   
{  
	ACE_INET_Addr addr(3000,"127.0.0.1");  
	ClientAcceptor server;  
	server.reactor(ACE_Reactor::instance());  
	server.open(addr);  

	while(true)  
	{  
		ACE_Reactor::instance()->handle_events();   
	}  

	return 0;   
}   
