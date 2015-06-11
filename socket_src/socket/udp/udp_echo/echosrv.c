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
		argv[1] = "127.0.0.1";
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

    while(1)
    {
		len = clilen;
        n = recvfrom(sockfd, mesg, MAXLINE, 0, pcliaddr, &len); // 从客户端收取数据
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


