#include<unistd.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<stdlib.h>
#include<string.h>
#include<stdio.h>
int main(int argc, char** argv)
{
    int send_sk;
    struct sockaddr_in s_addr;
    socklen_t len = sizeof(s_addr);
    send_sk = socket(AF_INET, SOCK_STREAM, 0);
    if(send_sk == -1)
    {
        perror("socket failed  ");
        return -1;
    }
    bzero(&s_addr, sizeof(s_addr));
    s_addr.sin_family = AF_INET;

    inet_pton(AF_INET, argv[1], &s_addr.sin_addr);
    s_addr.sin_port = htons(9877);
    if(connect(send_sk, (struct sockaddr*)&s_addr, len) < 0)
    {
        perror("connect fail  ");
        return -1;
    }
    char pcContent[5000]={0};
    write(send_sk, pcContent, 5000);
    sleep(1);
    // 客户端在服务端已经关闭掉socket之后，仍然在发送数据。这时服务端会产生RST。
    close(send_sk);
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
