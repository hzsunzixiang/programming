//client.c:
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<stdlib.h>
#include<string.h>
#include<stdio.h>

#include<unistd.h>
#define MAXLINE 80
#define SERV_PORT 8000
int main(int argc, char *argv[])
{
    struct sockaddr_in servaddr;
    char buf[MAXLINE];
    int sockfd, n;
    char *str;

    if (argc != 2) {        fputs("usage: ./client message\n", stderr);
        exit(1);
    }
    str = argv[1];

    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    bzero(&servaddr, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    inet_pton(AF_INET, "192.168.253.128", &servaddr.sin_addr);  // 地址固定了
    servaddr.sin_port = htons(SERV_PORT);

    connect(sockfd, (struct sockaddr *)&servaddr, sizeof(servaddr));
    write(sockfd, str, strlen(str));
    printf("after write:\n");
    fflush(stdout);
    n = read(sockfd, buf, MAXLINE); // 服务器端故意不写数据，导致客户端一直hang在这里，知道服务器端发送FIN(close函数，或终止)
    printf("Response from server:%s\n", buf);
    fflush(stdout);
    write(STDOUT_FILENO, buf, n);
    write(STDOUT_FILENO, "\n", 1);
    close(sockfd);
    return 0;
}

