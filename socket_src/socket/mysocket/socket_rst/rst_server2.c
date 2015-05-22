#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<stdlib.h>
#include<stdio.h>
#include<unistd.h>
#include<string.h>
//server.c


int main(int argc, char** argv)
{
    int listen_fd, real_fd;
    struct sockaddr_in listen_addr, client_addr;
    socklen_t len = sizeof(struct sockaddr_in);
    listen_fd = socket(AF_INET, SOCK_STREAM, 0);
    if(listen_fd == -1)
    {
        perror("socket failed   ");
        return -1;
    }
    bzero(&listen_addr,sizeof(listen_addr));
    listen_addr.sin_family = AF_INET;
    listen_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    listen_addr.sin_port = htons(9877);
    bind(listen_fd,(struct sockaddr *)&listen_addr, len);
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
            read(real_fd,pcContent,4096);
            // 服务器每次只接收4096个字节，那么就是说客户端发送的剩下的4个字节服务端的应用程序没有接收到，服务器端的socket就被关闭掉
            // TCP想取消一个已有连接， 这符合p83 第二条
            close(real_fd);
            exit(0);
        }
        close(real_fd);
    }
    return 0;
}


//root@debian-1:~# tcpdump  -ni any port  9877
//tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
//listening on any, link-type LINUX_SLL (Linux cooked), capture size 65535 bytes
//07:32:29.213068 IP 192.168.253.128.57078 > 192.168.253.128.9877: Flags [S], seq 4250862334, win 32792, options [mss 16396,sackOK,TS val 12285752 ecr 0,nop,wscale 3], length 0
//07:32:29.213113 IP 192.168.253.128.9877 > 192.168.253.128.57078: Flags [S.], seq 1719177492, ack 4250862335, win 32768, options [mss 16396,sackOK,TS val 12285752 ecr 12285752,nop,wscale 3], length 0
//07:32:29.213155 IP 192.168.253.128.57078 > 192.168.253.128.9877: Flags [.], ack 1, win 4099, options [nop,nop,TS val 12285752 ecr 12285752], length 0
//07:32:29.216524 IP 192.168.253.128.57078 > 192.168.253.128.9877: Flags [P.], seq 1:5001, ack 1, win 4099, options [nop,nop,TS val 12285753 ecr 12285752], length 5000
//07:32:29.216642 IP 192.168.253.128.9877 > 192.168.253.128.57078: Flags [.], ack 5001, win 4096, options [nop,nop,TS val 12285753 ecr 12285753], length 0
//07:32:29.219432 IP 192.168.253.128.9877 > 192.168.253.128.57078: Flags [R.], seq 1, ack 5001, win 4096, options [nop,nop,TS val 12285753 ecr 12285753], length 0
//
