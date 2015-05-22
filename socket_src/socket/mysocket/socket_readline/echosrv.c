#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<string.h>


int main(int argc, char* argv[])
{
    int sockfd;

    struct sockaddr_in servaddr;
    if ( (sockfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
    {
        perror("socket fail!");
        exit(EXIT_FAILURE);
    }

    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(8888);
    if (inet_aton(argv[1], &servaddr.sin_addr) == 0)
    {
        perror("inet_aton failure!");
        printf("address:%u\n", servaddr.sin_addr.s_addr);
        exit(EXIT_FAILURE);
    }

    int on = 1;
    if(setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on)) < 0)
    {
        perror("setsockopt:");
        exit(EXIT_FAILURE);
    }

    if (bind(sockfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) != 0)
    {
        perror("bind error!");
        exit(EXIT_FAILURE);
    }

    listen(sockfd, SOMAXCONN);
    char recvbuf[1024] = {0};
    struct sockaddr_in cliaddr;
    int connfd;
    socklen_t clilen = sizeof(cliaddr);
    memset(&cliaddr, 0, sizeof(cliaddr));
    if ((connfd = accept(sockfd, (struct sockaddr*)&cliaddr, &clilen)) < 0)
    {
        perror("accept error");
        exit(EXIT_FAILURE);
    }
    fprintf(stderr, "the client addr:port,%s:%d\n", inet_ntoa(cliaddr.sin_addr), cliaddr.sin_port);

    setvbuf (stderr, NULL , _IONBF , 1024 );
    setvbuf (stdout, NULL , _IONBF , 1024 );
    while(1)
    {
        memset(recvbuf, 0, sizeof(recvbuf));
        fprintf(stderr, "begin to read\n");
        int ret = read(connfd, recvbuf, sizeof(recvbuf)); // 从客户端收取数据
        fprintf(stderr, "retr=%d\n", ret);
        fputs(recvbuf, stdout); // 把结果打印出来
        if (ret > 0)
        {
            int retw = 0;
            if((retw=write(connfd, recvbuf, strlen(recvbuf))) < 0)  // 把数据再发给客户端
            {
                perror("write error");
                exit(EXIT_FAILURE);
            }
            fprintf(stderr, "write over: retw=%d\n", retw);
        }
        else if (ret == 0) //  从客户端接受FIN报文
        {
            sleep(10); // 在客户端正常终止时，为了查看close_wait 和 FIN_WAIT_2
            fputs("receive FIN from client\n", stderr);
            break;
        }
        else //  客户端分两次write数据时， 如果客户端使用read而不是readline， 那么客户端的缓冲区可能一直存有数据，而客户端不去读取
        {    //  这时如果强制关闭客户端，那么客户端会发送RST
            perror("read error");
            close(connfd);
            exit(EXIT_FAILURE);
        }
    }

    fputs("will close connfd\n", stderr);
    close(connfd);

    return 0;
}





