
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



// 测试的时候让客户端无法连接服务器 
// iptables -A INPUT -p tcp    --dport 8888 -j DROP
#define err_msg(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define SA struct sockaddr
typedef void Sigfunc(int);
Sigfunc * signal(int signo, Sigfunc *func);
int
connect_timeo(int sockfd, const SA *saptr, socklen_t salen, int nsec);


void handle_pipe(int sig);

int main(int argc, char* argv[])
{

    int sockconn;
    struct sockaddr_in servaddr;
    if ((sockconn = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
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

	if (connect_timeo(sockconn, (struct sockaddr*)&servaddr, sizeof(servaddr), 5) < 0)
	{
		perror("connnect timeout");
		exit(EXIT_FAILURE);
	}

    char recvbuf[1024] = {0};
    char sendbuf[1024] = {0};
    while(1){
        memset(recvbuf, 0, sizeof(recvbuf));
        memset(sendbuf, 0, sizeof(sendbuf));
        char * tmp = fgets(sendbuf, sizeof(sendbuf), stdin); // 键入EOF时，fgets返回一个空指针
        //fputs("fget from stdin\n", stderr);
        if (tmp != NULL)
        {
            //fputs("write to socket\n", stderr);
            // 如果服务器过早终止 当服务器tcp接受到来自客户的数据时，既然先前打开的那个套接口进程已经终止
            // 于是响应以一个RST， 通过使用tcpdump，来观察分组，我们可以验证该RST确实发送了
            // 然而客户端进程看不到这个RST，因为它在调用write后立即调用read，并且服务器已发送FIN，所调用的
            // read接收到FIN，立即返回0(表示EOF),我们的客户端未预期收到EOF，所以打印..server terminated prematurely
            if (write(sockconn, sendbuf, strlen(sendbuf)) < 0)
            {
                perror("write to socket error");
                exit(EXIT_FAILURE);
            }
        }
        else // 键入EOF时也返回空指针
        {
            fputs("get EOF\n", stderr);
            break;
        }
        //fputs("read from connfd\n", stderr);
        int ret = read(sockconn, recvbuf, sizeof(recvbuf));
        if (ret != 0)
            fputs(recvbuf, stdout);
        else if (ret == 0) // 已经写往服务器了，所以应该收到数据，如果返回0，说明服务器已经过早终止了
        {
            perror("str_cli: server terminated prematurely");
            exit(EXIT_FAILURE);
        }
        else
        {
            perror("read error");
            exit(EXIT_FAILURE);
        }
    }
    close(sockconn); // 这里即使不close，在进程关闭的时候，仍然会会关闭
    return 0;
}
void handle_pipe(int sig)
{
    printf("receive pipe!\n");
}

static void	connect_alarm(int);

int
connect_timeo(int sockfd, const SA *saptr, socklen_t salen, int nsec)
{
	Sigfunc	*sigfunc;
	int		n;

	sigfunc = signal(SIGALRM, connect_alarm);
	if (sigfunc == SIG_ERR)
        perror("signal:");

	if (alarm(nsec) != 0)
		err_msg("connect_timeo: alarm was already set");

	if ( (n = connect(sockfd, saptr, salen)) < 0) {
		close(sockfd);
		if (errno == EINTR)
			errno = ETIMEDOUT;
	}
	alarm(0);					/* turn off the alarm */
	sigfunc = signal(SIGALRM, sigfunc);	/* restore previous signal handler */
	if (sigfunc == SIG_ERR)
        perror("signal:");

	return(n);
}

static void
connect_alarm(int signo)
{
	printf("connect_alarm\n");
	//return;		/* just interrupt the connect() */
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
