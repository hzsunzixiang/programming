#include <iostream> 
#include <sys/socket.h>  
#include <sys/epoll.h>  
#include <netinet/in.h>  
#include <arpa/inet.h>  
#include <fcntl.h>  
#include <unistd.h>  
#include <stdio.h>  
#include <errno.h>  
#include <stdlib.h>  
#include <string.h>  
using namespace std; 

#define MAXLINE 512  
#define OPEN_MAX 100  
#define LISTENQ 2  
#define SERV_PORT  9999
#define INFTIM 1000  

void setnonblocking(int sock)  
{  
		int opts;  
		opts=fcntl(sock,F_GETFL);  

		if(opts<0)  
		{  
				perror("fcntl(sock,GETFL)");  
				exit(1);  
		}  

		opts = opts | O_NONBLOCK;  

		if(fcntl(sock,F_SETFL,opts)<0)  
		{  
				perror("fcntl(sock,SETFL,opts)");  
				exit(1);  
		}  
}  




/* 
   真真真真真真真� 
   (真�epoll真真真真真socket真), 
   真真真�socket,真send()真真真, 
   真真真真真真真真真, 
   真真真真� 
   真真真真�EAGAIN真(真man send),真, 
   真真真真真真.真, 
   真真socket_send()真真真真真�, 
   真真真真真真真真�-1真真� 
   �socket_send()真,真真真(send()真-1,�errno�EAGAIN), 
   真真真真�.真真真真�, 
   真真真真真真真socket_send()真, 
   真真真真�. 

 */ 

ssize_t socket_send(int sockfd, const char* buffer, size_t buflen) 
{ 
		ssize_t tmp; 
		size_t total = buflen; 
		const char *p = buffer; 

		while(1) 
		{ 
				tmp = send(sockfd, p, total, 0); 
				if(tmp < 0) 
				{ 
						// �send真真�,真真�,真真�-1. 
						if(errno == EINTR) 
								//return -1;zxd 
								continue; 

						// �socket真真�,真真真,真真真真�, 
						// 真真真真真. 
						if(errno == EAGAIN) 
						{ 
								usleep(1000); 
								continue; 
						} 

						return -1; 
				} 

				if((size_t)tmp == total) 
						return buflen; 

				total -= tmp; 
				p += tmp; 
		} 

		return tmp; 
} 


void epoll_ctl_err_show()   
{   
		std::cout << "error at epoll_ctl" << std::endl;   
		if(EBADF == errno)   
		{   
				std::cout << "error at epoll_ctl, error  is EBADF" << std::endl;   
		}   
		else if(EEXIST == errno)   
		{   
				std::cout << "error at epoll_ctl, error  is EEXIST" << std::endl;   
		}   
		else if(EINVAL == errno)   
		{   
				std::cout << "error at epoll_ctl, error  is EINVAL" << std::endl;   
		}   
		else if(ENOENT == errno)   
		{   
				std::cout << "error at epoll_ctl, error  is ENOENT" << std::endl;   
		}   
		else if(ENOMEM == errno)   
		{   
				std::cout << "error at epoll_ctl, error  is ENOMEM" << std::endl;   
		}   
		else if(ENOSPC == errno)   
		{   
				std::cout << "error at epoll_ctl, error  is ENOSPC" << std::endl;   
		}   

}  

int main()  
{  
		int i, maxi, listenfd, connfd, sockfd, epfd, nfds;  
		ssize_t n;  
		char line[MAXLINE];  
		socklen_t clilen;  

		struct epoll_event ev,events[20]; //真epoll_event真真真, ev真真真, events真真真真真真  
		epfd=epoll_create(256); //真真真accept�epoll真真真真, 真真真真真真�256  

		struct sockaddr_in clientaddr;  
		struct sockaddr_in serveraddr;  

		listenfd = socket(AF_INET, SOCK_STREAM, 0);  
	    const int		on = 1;
		if(setsockopt(listenfd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on)))
		{
			printf("setsockopt\n");
			exit(1);
		}

		setnonblocking(listenfd); //真真真socket真真真真  

		ev.data.fd=listenfd; //真真真真真真真真�  
		ev.events=EPOLLIN | EPOLLET; //真真真真真  
		//ev.events=EPOLLIN ; //真真真真真  
		epoll_ctl(epfd,EPOLL_CTL_ADD,listenfd,&ev); //真epoll真 

		bzero(&serveraddr, sizeof(serveraddr));  
		serveraddr.sin_family = AF_INET;  
		char *local_addr="0.0.0.0";  
		inet_aton(local_addr,&(serveraddr.sin_addr)); 
		serveraddr.sin_port=htons(SERV_PORT);  //真htons(SERV_PORT);  

		bind(listenfd,(sockaddr *)&serveraddr, sizeof(serveraddr));  

		listen(listenfd, LISTENQ);  

		maxi = 0;  

		for( ; ; ) {  
				nfds=epoll_wait(epfd, events, 20, -1); //真epoll真真�  


				for(i=0;i<nfds;++i) //真真真真真  
				{  
						if(events[i].data.fd==listenfd)    /**真真**/ 
						{  
								//真accept 
								while((connfd = accept(listenfd,(sockaddr *)&clientaddr, &clilen)) > 0) 
								{ 
										setnonblocking(connfd); //真真�socket真真真真 

										char *str = inet_ntoa(clientaddr.sin_addr);  
										std::cout<<"connect from "<<str<<std::endl;  

										ev.data.fd=connfd; //真真真真真真�  
										ev.events=EPOLLIN | EPOLLET; //真真真真真真  
										//ev.events=EPOLLIN ; //真真真真真真  
										epoll_ctl(epfd,EPOLL_CTL_ADD,connfd,&ev); //真ev真  
								} 
						}  
						else if(events[i].events&EPOLLIN)     /**真�**/ 
						{  
								//fprintf(stderr, "EPOLLIN................%d\n", maxi++); 
								if ( (sockfd = events[i].data.fd) < 0)  
								{ 
										continue;  
								} 
								memset(line, 0, MAXLINE); 
								n = 0; 
								int nread = 0; 
						//		while((nread= read(sockfd, line + n, MAXLINE)) > 0) 
					//			while((nread= read(sockfd, line + n, 12)) > 0) 
								nread= read(sockfd, line + n, 12) ;
							//	{ 
										n += nread; 
							//	}//真EAGAIN真真真 


								if(nread == -1 && errno != EAGAIN) 
								{ 
										epoll_ctl_err_show(); 
										std::cout<<"readline error"<<std::endl; 
										close(sockfd); //真真真真真真真�epoll真真真� 
										//真真真真真真真EPOLLOUT真真真真真 
										events[i].data.fd = -1;  
								} 

								//真真真真nread�0真真真真真� 
								//真真真真真真真/proc/id/fd真真真真真真 
								if(nread == 0) 
								{ 
										close(sockfd); 
										continue; 
								} 


								int iRet = socket_send(sockfd, line, strlen(line) + 1); 
								if(iRet == -1 || iRet != strlen(line) + 1) 
								{ 
										perror("write error!"); 
								}/*zxd*/ 

							//	ev.data.fd=sockfd; //真真真真真真�  
							//	ev.events=EPOLLOUT ; //真真真真真真  
							//	//ev.events=EPOLLOUT | EPOLLET; //真真真真真真  
							//	epoll_ctl(epfd,EPOLL_CTL_ADD,sockfd,&ev); //真sockfd真真真真EPOLLOUT  
						}  
						//else if(events[i].events & EPOLLOUT)    /**真�**/ 
						//{  
						//		sockfd = events[i].data.fd;  
						//		//write(sockfd, line, n); orig 

						//		int iRet = socket_send(sockfd, line, strlen(line) + 1); 
						//		if(iRet == -1 || iRet != strlen(line) + 1) 
						//		{ 
						//				perror("write error!"); 
						//		}/*zxd*/ 

						//		ev.data.fd=sockfd; //真真真真真真�  
						//		//ev.events=EPOLLIN | EPOLLET; //真真真真真真  
						//		ev.events=EPOLLIN ; //真真真真真真  
						//		epoll_ctl(epfd, EPOLL_CTL_ADD, sockfd, &ev); //真sockfd真真真真EPOLIN  
						//}  
				}  
		}  
} 
