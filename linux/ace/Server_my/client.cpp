#include "ace/Reactor.h"  
#include "ace/SOCK_Connector.h"  

#include <string>  
#include <iostream>  
using namespace std;  

class MyClient:public ACE_Event_Handler   
{  
	public:  
		bool open()  
		{  
			ACE_SOCK_Connector connector;  
			ACE_INET_Addr addr(7777,"127.0.0.1");  
			ACE_Time_Value timeout(5,0);  
			if(connector.connect(peer,addr,&timeout) != 0)  
			{  
				cout<<endl<<"connect fail.";  
				return false;  
			}  
			ACE_Reactor::instance()->register_handler(this,ACE_Event_Handler::READ_MASK);  
			cout<<endl<<"connected.";  
			strcpy(buf, "hello,Server\n");  
			peer.send(buf,strlen(buf));  
			return true;  
		}  

		ACE_HANDLE get_handle(void) const  
		{  
			return peer.get_handle();  
		}  

		int handle_input (ACE_HANDLE fd)  
		{  
			int rev=0;  
			ACE_Time_Value timeout(5,0);  
			if((rev=peer.recv(buf,sizeof(buf),&timeout))>0)  
			{  
				buf[rev]='\0';  
				cout<<endl<<"recv: "<<buf<<endl;  
			}  
			return 3;  
		}  

	private:  
		ACE_SOCK_Stream peer;  
		char buf[100];  
};  

int main(int argc, char *argv[])   
{  
	MyClient client;  
	client.open();  

	while(true)  
	{  
		ACE_Reactor::instance()->handle_events();   
	}  

	return 0;   
}  
