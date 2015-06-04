#include<unistd.h>
#include<stdio.h>
#include<signal.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<string.h>

#define MAXLINE 1024

static void recvfrom_int(int);
typedef void Sigfunc(int);
static int count;
    Sigfunc *
signal(int signo, Sigfunc *func);
void dg_echo(int sockfd, struct sockaddr *pcliaddr, socklen_t clilen);
int main(int argc, char* argv[])
{
    int sockfd;

    struct sockaddr_in servaddr;
    if ( (sockfd = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0)
    {
        perror("socket fail!");
        exit(EXIT_FAILURE);
    }

    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(8888);
	if (argv[1] == NULL)
	{
		argv[1] = "0.0.0.0";
	}
    if (inet_aton(argv[1], &servaddr.sin_addr) == 0)
    {
        perror("inet_aton failure!");
        printf("address:%u\n", servaddr.sin_addr.s_addr);
        exit(EXIT_FAILURE);
    }
    if (bind(sockfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) != 0)
    {
        perror("bind error!");
        exit(EXIT_FAILURE);
    }

    struct sockaddr_in cliaddr;

	dg_echo(sockfd, (struct sockaddr*)&cliaddr, sizeof(struct sockaddr));

    return 0;
}



// 大多数tcp服务器是并发的，大多数udp服务器是迭代的
void dg_echo(int sockfd, struct sockaddr *pcliaddr, socklen_t clilen)
{

	int n;
	socklen_t len;
	char mesg[MAXLINE];

    if (signal(SIGINT, recvfrom_int) == SIG_ERR)
        perror("signal:");
    while(1)
    {
		len = clilen;
        n = recvfrom(sockfd, mesg, MAXLINE, 0, pcliaddr, &len); // 从客户端收取数据
        if (n < 0)
        {
            perror("read error");
            exit(EXIT_FAILURE);
        }
        count++;
        //fprintf(stderr, "count=%d\n", count);
    }
}


    Sigfunc *
signal(int signo, Sigfunc *func)
{
    struct sigaction act, oact;

    act.sa_handler = func;
    sigemptyset(&act.sa_mask);
    act.sa_flags = 0;
    if (signo == SIGALRM)
    {
#ifdef SA_INTERRUPT
        act.sa_flags |= SA_INTERRUPT;
#endif
    }
    else
    {
#ifdef SA_RESTART
        act.sa_flags |= SA_RESTART;
#endif
    }

    if (sigaction(signo, &act, &oact) < 0)
        return SIG_ERR;
    return oact.sa_handler;

}


static void 
recvfrom_int(int signo)
{
    printf("\nreceived %d datagram\n", count);
    exit(1);
}
