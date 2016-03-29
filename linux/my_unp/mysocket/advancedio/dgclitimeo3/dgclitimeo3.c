#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<arpa/inet.h>
#include<sys/socket.h>
#include<sys/types.h>
#include<netinet/in.h>
#include<signal.h>
#include<errno.h>


#define err_sys(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define   SA  struct sockaddr
#define MAXLINE 1024
static void	sig_alrm(int);

// 测试的时候让客户端无法连接服务器 
// iptables -A INPUT -p tcp    --dport 8888 -j DROP
typedef void Sigfunc(int);
Sigfunc * signal(int signo, Sigfunc *func);

void dg_cli(FILE *fp, int sockconn, const struct sockaddr *pservaddr, socklen_t servlen);

void handle_pipe(int sig);

int main(int argc, char* argv[])
{
    struct sigaction action;
    action.sa_handler = handle_pipe;
    sigemptyset(&action.sa_mask);
    action.sa_flags = 0;
    sigaction(SIGPIPE, &action, NULL);


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

void handle_pipe(int sig)
{
    printf("receive pipe!\n");
}




void dg_cli(FILE *fp, int sockconn, const struct sockaddr *pservaddr, socklen_t servlen)
{

	char recvbuf[1024] = {0};
	char sendbuf[1024] = {0};
	Sigfunc	*sigfunc;
	sigfunc = signal(SIGALRM, sig_alrm);
	if (sigfunc == SIG_ERR)
        perror("signal:");
    // signal    act.sa_flags |= SA_INTERRUPT;
	// 这里signal 必须设为 SA_INTERRUPT  不然connect还会重启
	if (sigfunc == SIG_ERR)
        perror("signal:");
	while(1){
		memset(recvbuf, 0, sizeof(recvbuf));
		memset(sendbuf, 0, sizeof(sendbuf));
		char * tmp = fgets(sendbuf, sizeof(sendbuf), stdin); // 键入EOF时，fgets返回一个空指针
		//fputs("sendto begin\n", stderr);
		if (tmp != NULL)
		{
			if (sendto(sockconn, sendbuf, strlen(sendbuf), 0, pservaddr, servlen) < 0)
			{
				perror("write to socket error");
				exit(EXIT_FAILURE);
			}
			// fputs("sendto return\n", stderr);
		}
		else // 键入EOF时也返回空指针
		{
			fputs("get EOF\n", stderr);
			break;
		}
		alarm(5);
		//fputs("read from connfd\n", stderr);
		int n= recvfrom(sockconn, recvbuf, MAXLINE, 0, NULL, NULL);
		if (n >= 0)
		{
			alarm(0);
			recvbuf[n] = 0;
			fputs(recvbuf, stdout);
		}
		else
		{
			if (errno == EINTR)
				fprintf(stderr, "socket timeout\n");
			else
				err_sys("recvfrom error");
		}
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
sig_alrm(int signo)
{
	return;			/* just interrupt the recvfrom() */
}
