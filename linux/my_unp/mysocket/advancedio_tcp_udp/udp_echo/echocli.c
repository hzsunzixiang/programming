
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
void handle_pipe(int sig);
void dg_cli(FILE *fp, int sockconn, const struct sockaddr *pservaddr, socklen_t servlen);
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


void dg_cli(FILE *fp, int sockconn, const struct sockaddr *pservaddr, socklen_t servlen)
{
	char buff[MAXLINE];
    struct sockaddr_in cliaddr;
	socklen_t len;
	char recvbuf[1024] = {0};
	char sendbuf[1024] = {0};
	while(1){
		memset(recvbuf, 0, sizeof(recvbuf));
		memset(sendbuf, 0, sizeof(sendbuf));
		char * tmp = fgets(sendbuf, sizeof(sendbuf), stdin); // 键入EOF时，fgets返回一个空指针
		fputs("sendto begin\n", stderr);
		if (tmp != NULL)
		{
			if (sendto(sockconn, sendbuf, strlen(sendbuf), 0, pservaddr, servlen) < 0)
			{
				perror("write to socket error");
				exit(EXIT_FAILURE);
			}
			fputs("sendto return\n", stderr);
		}
		else // 键入EOF时也返回空指针
		{
			fputs("get EOF\n", stderr);
			break;
		}
		//fputs("read from connfd\n", stderr);
		// 如果为空就不关心地址
		//int n= recvfrom(sockconn, recvbuf, MAXLINE, 0, NULL, NULL);
		len = sizeof(cliaddr);
		int n= recvfrom(sockconn, recvbuf, MAXLINE, 0, (struct sockaddr*)&cliaddr, &len);
		if (n >= 0)
		{
			recvbuf[n] = 0;
			printf("client recvfrom %s, port: %d\n", 
					inet_ntop(AF_INET, &cliaddr.sin_addr, buff, sizeof(buff)), ntohs(cliaddr.sin_port));
			fputs(recvbuf, stdout);
		}
		else
		{
			perror("read error");
			exit(EXIT_FAILURE);
		}
	}
}
void handle_pipe(int sig)
{
	printf("receive pipe!\n");
}
