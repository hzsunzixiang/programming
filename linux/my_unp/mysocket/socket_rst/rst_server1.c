#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<stdlib.h>
#include<string.h>
#include<stdio.h>
#include<unistd.h>
//server.c

int main(int argc, char** argv)
{
    int listen_fd, real_fd;
    struct sockaddr_in listen_addr, client_addr;
    socklen_t len = sizeof(struct sockaddr_in);
    listen_fd = socket(AF_INET, SOCK_STREAM, 0);
    if (listen_fd == -1)
    {
        perror("socket failed   ");
        return -1;
    }
    bzero(&listen_addr, sizeof(listen_addr));
    listen_addr.sin_family = AF_INET;
    listen_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    listen_addr.sin_port = htons(9877);
    bind(listen_fd, (struct sockaddr *)&listen_addr, len);
    listen(listen_fd, 10);
    while(1)
    {
        real_fd = accept(listen_fd, (struct sockaddr*)&client_addr, &len);
        if(real_fd == -1)
        {
            perror("accpet fail  ");
            return -1;
        }
        if(fork() == 0)
        {
            close(listen_fd);
            char pcContent[4096];
            //每次只是读socket的前4096个字节，然后就关闭掉连接。
            // 这个跟服务器端同时write两次，而只read一次就关闭很类似，内核缓冲区中还有数据，
            // 然而连接就关闭了，
            read(real_fd, pcContent, 4096);
            //sleep(20);
            close(real_fd);
            exit(0);
        }
        close(real_fd);
    }
    return 0;

}



