#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<stdlib.h>
#include<string.h>
#include<stdio.h>
#include<unistd.h>

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

    if(connect(send_sk, (struct sockaddr*)&s_addr, len) == -1)
    {
        perror("connect fail  ");
        return -1;
    }

    //就是打开一个socket然后连接一个服务器并两次发送4096个字节。刚才我们看服务器的代码，每次只接收4096个字节，那么就是说客户端发送的剩下的4096个字节服务端的应用程序没有接收到(内核tcp已经响应)，服务器端的socket就被关闭掉，
    char pcContent[4096]={0};
    write(send_sk,pcContent,4096);
    sleep(1);
    //服务器端关闭之后, 服务器TCP接受到一个根本不存在连接上的分节
    // 符合unp p83 的第三个条件
    write(send_sk,pcContent,4096);
    close(send_sk);
    fprintf(stderr, "over");
    return 0;
}

//root@debian-1:~# tcpdump  -ni any port  9877
//tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
//listening on any, link-type LINUX_SLL (Linux cooked), capture size 65535 bytes
//07:10:32.830038 IP 192.168.253.128.57065 > 192.168.253.128.9877: Flags [S], seq 4213789777, win 32792, options [mss 16396,sackOK,TS val 11956656 ecr 0,nop,wscale 3], length 0
//07:10:32.830062 IP 192.168.253.128.9877 > 192.168.253.128.57065: Flags [S.], seq 2108394672, ack 4213789778, win 32768, options [mss 16396,sackOK,TS val 11956656 ecr 11956656,nop,wscale 3], length 0
//07:10:32.830084 IP 192.168.253.128.57065 > 192.168.253.128.9877: Flags [.], ack 1, win 4099, options [nop,nop,TS val 11956656 ecr 11956656], length 0
//07:10:32.831140 IP 192.168.253.128.57065 > 192.168.253.128.9877: Flags [P.], seq 1:4097, ack 1, win 4099, options [nop,nop,TS val 11956656 ecr 11956656], length 4096
//07:10:32.831167 IP 192.168.253.128.9877 > 192.168.253.128.57065: Flags [.], ack 4097, win 4096, options [nop,nop,TS val 11956656 ecr 11956656], length 0
//07:10:32.831899 IP 192.168.253.128.9877 > 192.168.253.128.57065: Flags [F.], seq 1, ack 4097, win 4096, options [nop,nop,TS val 11956657 ecr 11956656], length 0
//07:10:32.835725 IP 192.168.253.128.57065 > 192.168.253.128.9877: Flags [.], ack 2, win 4099, options [nop,nop,TS val 11956658 ecr 11956657], length 0
//07:10:33.831955 IP 192.168.253.128.57065 > 192.168.253.128.9877: Flags [P.], seq 4097:8193, ack 2, win 4099, options [nop,nop,TS val 11956907 ecr 11956657], length 4096
//07:10:33.832003 IP 192.168.253.128.9877 > 192.168.253.128.57065: Flags [R], seq 2108394674, win 0, length 0
//

