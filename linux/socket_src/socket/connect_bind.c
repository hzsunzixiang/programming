#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>

int main(int argc, char *argv[])
{
    int sock;
    if ((sock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
    {
        perror("build socket fail");
        exit(1);
    }



    // 设置套接口选项
    int enable = 1;
    if (setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &enable, sizeof(int)) < 0)
        perror("setsockopt(SO_REUSEADDR) failed");

    struct sockaddr_in servaddr, cliaddr;
    memset(&servaddr, 0, sizeof(servaddr));
    memset(&servaddr, 0, sizeof(cliaddr));

    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(8888);

    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(8888);
    if (inet_aton(argv[1], &servaddr.sin_addr) == 0)
    {
        perror("inet_aton fail!");
        exit(1);
    }



    // 客户端绑定固定的端口
    cliaddr.sin_family = AF_INET;
    cliaddr.sin_port = htons(9999);
    cliaddr.sin_addr.s_addr = htonl(INADDR_ANY);
    if (bind(sock, (struct sockaddr *)&cliaddr, sizeof(cliaddr)) < 0)
    {
        perror("error on binding");
        exit(1);
    }


    //填充对端服务器
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(8888);
    if (inet_aton(argv[1], &servaddr.sin_addr) == 0)
    {
        perror("inet_aton fail!");
        exit(1);
    }

    if (connect(sock, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0)
    {
        perror("connect fail");
        exit(1);
    }
    sleep(10000);

    return 0;
}
