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
	if(argv[1] == NULL)
	{
		argv[1] = "0.0.0.0";
	}
    if (inet_aton(argv[1], &servaddr.sin_addr) == 0)
    {
        perror("inet_aton failure!");
        printf("address:%u\n", servaddr.sin_addr.s_addr);
        exit(EXIT_FAILURE);
    }
    // 设置SO_REUSEADDR 选项不代表没有TIME_WAIT, 而是说，在TIME_WAIT状态允许再次监听
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

    while(1)
    {
        memset(recvbuf, 0, sizeof(recvbuf));
        //int ret = read(connfd, recvbuf, sizeof(recvbuf)); // 从客户端收取数据
        int ret = recv(connfd, recvbuf, sizeof(recvbuf), 0); // 从客户端收取数据
		// 看以看出recv是包装的系统调用 recvfrom
		// recvfrom(5, "\0023\n", 1024, 0, NULL, NULL) = 3
        fputs(recvbuf, stderr); // 把结果打印出来
        if (ret > 0)
        {
            //if(write(connfd, recvbuf, ret) < 0)  // 把数据再发给客户端
			// 从strace 看出send包装的sendto系统调用
			// sendto(5, "adsfads\n", 8, 0, NULL, 0)   = 8
            if(send(connfd, recvbuf, ret, 0) < 0)  // 把数据再发给客户端
            {
                perror("write error");
                exit(EXIT_FAILURE);
            }
        }
        else if (ret == 0) //  从客户端接受FIN报文
        {
            sleep(10); // 在客户端正常终止时，为了查看close_wait 和 FIN_WAIT_2
            fputs("receive FIN from client\n", stderr);
            break;
        }
        else
        {
            perror("read error");
            close(connfd);
            exit(EXIT_FAILURE);
        }
    }

    fputs("will close connfd\n", stderr);
    close(connfd);

    return 0;
}





