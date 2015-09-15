
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<arpa/inet.h>
#include<sys/socket.h>
#include<sys/types.h>
#include<netinet/in.h>
#include<signal.h>

#define MAXLINE 1024
void dg_cli(FILE *fp, int sockconn, const struct sockaddr *pservaddr, socklen_t servlen);
int main(int argc, char* argv[])
{

    int sockconn;
    struct sockaddr_in servaddr, cliaddr;
    socklen_t len;
    if ((sockconn = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0)
    {
        perror("socket failure");
        exit(EXIT_FAILURE);
    }

    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(8888);
	if (argv[1] == NULL)
	{
		argv[1] = "127.0.0.1";
	}
	if (inet_aton(argv[1], &servaddr.sin_addr) == 0)
	{
		perror("inet_aton error");
        exit(EXIT_FAILURE);
    }
    // 可以把connect注释掉，看看效果
    if (connect(sockconn, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0)
    {
        perror("connect:");
        fprintf(stderr, "connect error\n");
    }
    getsockname(sockconn, (struct sockaddr*)&cliaddr, &len);
    fprintf(stderr, "local address %s\n", inet_ntoa(cliaddr.sin_addr));

    close(sockconn); // 这里即使不close，在进程关闭的时候，仍然会会关闭
    return 0;
}

////使用connect
//root@debian-1:~/programming/socket_src/socket/udp/udp_outgo# ./echocli 192.168.253.132
//local address 192.168.253.128
//root@debian-1:~/programming/socket_src/socket/udp/udp_outgo# ./echocli 192.168.232.131
//local address 192.168.232.130
//root@debian-1:~/programming/socket_src/socket/udp/udp_outgo# ./echocli 127.0.0.1
//local address 127.0.0.1
//
//
//// 不用connect
//root@debian-1:~/programming/socket_src/socket/udp/udp_outgo# ./echocli 127.0.0.1
//local address 0.0.0.0
//root@debian-1:~/programming/socket_src/socket/udp/udp_outgo# ./echocli 192.168.253.132
//local address 0.0.0.0
//root@debian-1:~/programming/socket_src/socket/udp/udp_outgo# ./echocli 192.168.232.131
//local address 0.0.0.0
//root@debian-1:~/programming/socket_src/socket/udp/udp_outgo# ./echocli 127.0.0.1
//local address 0.0.0.0

