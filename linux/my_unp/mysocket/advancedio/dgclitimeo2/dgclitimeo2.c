
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





int
readable_timeo(int fd, int sec)
{
	fd_set			rset;
	struct timeval	tv;

	FD_ZERO(&rset);
	FD_SET(fd, &rset);

	tv.tv_sec = sec;
	tv.tv_usec = 0;

	return(select(fd+1, &rset, NULL, NULL, &tv));
		/* 4> 0 if descriptor is readable */
}
void
dg_cli(FILE *fp, int sockfd, const SA *pservaddr, socklen_t servlen)
{
	int	n;
	char	sendbuf[MAXLINE], recvline[MAXLINE + 1];
	struct timeval	tv;

	tv.tv_sec = 5;
	tv.tv_usec = 0;
	int ret = setsockopt(sockfd, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv));
	if(ret < 0)
	{
		err_sys("setsockopt");
	}

	while (fgets(sendbuf, MAXLINE, fp) != NULL) {

		if (sendto(sockfd, sendbuf, strlen(sendbuf), 0, pservaddr, servlen) < 0)
		{
			perror("write to socket error");
			exit(EXIT_FAILURE);
		}
		n = recvfrom(sockfd, recvline, MAXLINE, 0, NULL, NULL);
		if (n >= 0)
		{
			alarm(0);
			recvline[n] = 0;
			fputs(recvline, stdout);
		}
		else
		{
			if (errno == EWOULDBLOCK)  // 注意其返回错误码
			{
				fprintf(stderr, "socket timeout\n");
			}
			else
				err_sys("recvfrom error");
		}
	}
}

	int
Readable_timeo(int fd, int sec)
{
	int		n;

	if ( (n = readable_timeo(fd, sec)) < 0)
		err_sys("readable_timeo error");
	return(n);
}
