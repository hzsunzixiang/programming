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
    if ( (sockfd = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0)
    {
        perror("socket fail!");
        exit(EXIT_FAILURE);
    }

    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(8888);
	if (argv[1] == NULL)
	{
		//argv[1] = "0.0.0.0";
		argv[1] = "123.56.106.58";
	}
    if (inet_aton(argv[1], &servaddr.sin_addr) == 0)
    {
        perror("inet_aton failure!");
        printf("address:%u\n", servaddr.sin_addr.s_addr);
        exit(EXIT_FAILURE);
    }

    struct sockaddr_in addrsock;
	socklen_t len;
	char buff[32];

	printf("before bind");
	len = sizeof(addrsock);
	if(getsockname(sockfd, (struct sockaddr *)&addrsock, &len))
	{
        perror("getsockname failure!");
        exit(EXIT_FAILURE);
	}
	else
	{
		printf("before bind address %s, port: %d\n", inet_ntop(AF_INET, &addrsock.sin_addr, buff, sizeof(buff)), ntohs(addrsock.sin_port));
	}

    if (bind(sockfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) != 0)
    {
        perror("bind error!");
        exit(EXIT_FAILURE);
    }

	// before bindbefore bind address 0.0.0.0, port: 0
	// after bindbind address 0.0.0.0, port: 8888

	// 改为不同的地址之后
	// before bindbefore bind address 0.0.0.0, port: 0
	// after bindbind address 123.56.106.58, port: 8888

	// 如果监听在0.0.0.0  只有对已连接套接口才能获取到确切的地址

	printf("after bind");
	len = sizeof(addrsock);
	if(getsockname(sockfd, (struct sockaddr *)&addrsock, &len))
	{
        perror("getsockname failure!");
        exit(EXIT_FAILURE);
	}
	else
	{
		printf("bind address %s, port: %d\n", inet_ntop(AF_INET, &addrsock.sin_addr, buff, sizeof(buff)), ntohs(addrsock.sin_port));
	}


	pause();
	return 0;

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

    while(1)
    {
		len = clilen;
        n = recvfrom(sockfd, mesg, MAXLINE, 0, pcliaddr, &len); // 从客户端收取数据
		printf("server recvfrom %s, port: %d\n", 
				inet_ntop(AF_INET, &((struct sockaddr_in*)pcliaddr)->sin_addr, buff, sizeof(buff)), 
				ntohs(((struct sockaddr_in*)pcliaddr)->sin_port));
        fputs(mesg, stderr); // 把结果打印出来
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


