
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<arpa/inet.h>
#include<sys/socket.h>
#include<sys/types.h>
#include<netinet/in.h>
#include<signal.h>


void handle_pipe(int sig);
int main(int argc, char* argv[])
{
    struct sigaction action;
    action.sa_handler = handle_pipe;
    sigemptyset(&action.sa_mask);
    action.sa_flags = 0;
    sigaction(SIGPIPE, &action, NULL);
    int sockconn;
    struct sockaddr_in servaddr;
    if ((sockconn = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
    {
        perror("socket failure");
        exit(EXIT_FAILURE);
    }

    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(19);
    if (inet_aton(argv[1], &servaddr.sin_addr) == 0)
    {
        perror("inet_aton error");
        exit(EXIT_FAILURE);
    }

    if (connect(sockconn, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0)
    {
        perror("connnect error");
        exit(EXIT_FAILURE);
    }
    // SHUT_RD 关闭连接的读这一半——套接口中不再有数据可接收，而且套接口接收缓冲区中的现有数据都被丢弃。进程不能再对这样的套接口调用任何读函数。对一个TCP套接口这样调用shutdown函数后，由该套接口接收的来自对端的任何数据都被确认，然后悄然丢弃。


    //shutdown(sockconn, SHUT_RD); // 

    // SHUT_WR 关闭连接的写这一半——对于TCP套接口，这称为半关闭（half-close）。当前留在套接口发送缓冲区中的数据将被发送掉，后跟TCP的正常连接终止序列。不管套接口描述字的引用计数是否等于0，这样的写这一半关闭照样执行。进程不能再对这样的套接口调用任何写函数。


    //shutdown(sockconn, SHUT_WR); 
    sleep(5);
    // SHUT_RDWR 连接的读这一半和写这一半都关闭——这与调用shutdown两次等效：第一次调用指定SHUT_RD，第二次调用指定SHUT_WR。
    // 跟SHUT_WR 行为类似，半关闭
    //shutdown(sockconn, SHUT_RDWR);  
    close(sockconn);  // 关闭描述符时，进程消失了，描述符也就释放了，而shutdown不释放描述符
    pause();
    return 0;
}
void handle_pipe(int sig)
{
    printf("receive pipe!\n");
}
