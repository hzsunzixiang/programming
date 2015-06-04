
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
#define NDG 2000
#define DGLEN 1400

void dg_cli(FILE *fp, int sockconn, const struct sockaddr *pservaddr, socklen_t servlen);
int main(int argc, char* argv[])
{

    int sockconn;
    struct sockaddr_in servaddr;
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
	dg_cli(stdin, sockconn, (struct sockaddr*)&servaddr, sizeof(servaddr));

	close(sockconn); // 这里即使不close，在进程关闭的时候，仍然会会关闭
	return 0;
}


void dg_cli(FILE *fp, int sockconn, const struct sockaddr *pservaddr, socklen_t servlen)
{

	char sendline[DGLEN];
    int i;
    for (i = 0; i < NDG; i++)
    {
        if (sendto(sockconn, sendline, strlen(sendline), 0, pservaddr, servlen) < 0)
        {
            perror("write to socket error");
            exit(EXIT_FAILURE);
        }
        fputs("sendto return\n", stderr);
    }
}
