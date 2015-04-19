// server.c
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<stdlib.h>
#include<string.h>
#include<stdio.h>
#define MAXLINE 80
#define SERV_PORT 8000
int main(void)
{
    struct sockaddr_in servaddr, cliaddr;
    socklen_t cliaddr_len;
    int listenfd, connfd;
    char buf[MAXLINE];
    char str[INET_ADDRSTRLEN];
    int i, n;
    listenfd = socket(AF_INET, SOCK_STREAM, 0);
    int opt = 1;
    setsockopt(listenfd, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(opt));
    int keepAlive = 1;
    setsockopt(listenfd, SOL_SOCKET, SO_KEEPALIVE, (void*)&keepAlive, sizeof(keepAlive));
    bzero(&servaddr, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
    servaddr.sin_port = htons(SERV_PORT);

    bind(listenfd, (struct sockaddr *)&servaddr, sizeof(servaddr));
    listen(listenfd, 20);
    printf("Accepting connections ...\n");
    while (1) {
        cliaddr_len = sizeof(cliaddr);
        connfd = accept(listenfd, (struct sockaddr *)&cliaddr, &cliaddr_len);
        while (1) 
        {
            n = read(connfd, buf, MAXLINE);
            if (n == 0) {
                printf("the other side has been closed.\n");
                fflush(stdout);
                break;
            }
            printf("received from %s at PORT %d, %s\n",  inet_ntop(AF_INET, &cliaddr.sin_addr, str, sizeof(str)), ntohs(cliaddr.sin_port), buf);
            fflush(stdout);
            //write(connfd, "hehehehe", strlen("hehehehe"));  // 这里服务器端故意不发送数据，导致客户端会hang在read的地方
            // 这样可以同时模拟服务器端或者客户端关闭的情形
            // 如果 ctrl+c 关闭服务器端，就是服务器端发起关闭
            // 如果 ctrl+c 关闭客户端，就是客户端发起关闭

            for (i = 0; i < 10; i++)    //这里故意不关闭socket,或者是在close之前加上一个sleep都可以
            {
                //sleep(5);
                //close(connfd);
            }
        }


    }
}
