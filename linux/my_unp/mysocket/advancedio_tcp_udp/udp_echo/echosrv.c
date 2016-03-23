#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<string.h>

#define MAXLINE 1024

void dg_echo(int sockfd, struct sockaddr *pcliaddr, socklen_t clilen);

int main(int argc, char* argv[])
{
    int sockfd;

    struct sockaddr_in servaddr;
    //if ( (sockfd = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0)
    if ( (sockfd = socket(AF_INET, SOCK_DGRAM, 0)) < 0)
    {
        perror("socket fail!");
        exit(EXIT_FAILURE);
    }

    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(8888);
	if (argv[1] == NULL)
	{
		argv[1] = "0.0.0.0";
	}
    if (inet_aton(argv[1], &servaddr.sin_addr) == 0)
    {
        perror("inet_aton failure!");
        printf("address:%u\n", servaddr.sin_addr.s_addr);
        exit(EXIT_FAILURE);
    }
    if (bind(sockfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) != 0)
    {
        perror("bind error!");
        exit(EXIT_FAILURE);
    }

    struct sockaddr_in cliaddr;

	dg_echo(sockfd, (struct sockaddr*)&cliaddr, sizeof(struct sockaddr));

    return 0;
}



// 大多数tcp服务器是并发的，大多数udp服务器是迭代的
void dg_echo(int sockfd, struct sockaddr *pcliaddr, socklen_t clilen)
{

	int n;
	socklen_t len;
	char mesg[MAXLINE];
	char buff[MAXLINE];

	// 该函数永不终止，因为UDP是一个无连接的协议，它没有像TCP中EOF之类的东西
	// 对于TCP的已连接套接口，多进程情况下，其中每一个都有各自的套接口接受缓冲区
	// UDP只有一个服务器进程, 该套接口只有一个接受缓冲区用来存放所到达的数据
    while(1)
    {
		len = clilen;
        n = recvfrom(sockfd, mesg, MAXLINE, 0, pcliaddr, &len); // 从客户端收取数据
		// 下面这行代码参考4.6节
		// 如果没有下面这行代码 这个函数是协议无关的
		printf("server recvfrom %s, port: %d\n", 
				inet_ntop(AF_INET, &((struct sockaddr_in*)pcliaddr)->sin_addr, buff, sizeof(buff)), 
				ntohs(((struct sockaddr_in*)pcliaddr)->sin_port));
        fputs(mesg, stderr); // 把结果打印出来
		// 写一个数据为0的数据报是可行的。在udp情况下，这导致一个只包含一个ip头部和一个8字节udp头部
		// 而没有数据的ip数据报， 这也意味着对于数据报协议，recvfrom返回0是可接受的：它并不像tcp套接口上read返回0值那样表示对端
		// 已关闭连接。 既然udp是无连接的，因此并没有诸如关闭一个udp连接之类事情
        if (n >= 0)
        {
            if(sendto(sockfd, mesg, n, 0, pcliaddr, len) < 0)  // 把数据再发给客户端
            {
                perror("sendto error");
                exit(EXIT_FAILURE);
            }
        }
        else
        {
            perror("read error");
            exit(EXIT_FAILURE);
        }
    }
}


