
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

    memset(&servaddr, 0, sizeof(servaddr));

    servaddr.sin_family = AF_INET;
    //servaddr.sin_port = htons(8888);
    // 改为标准的回射服务器
    servaddr.sin_port = htons(7);
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

	char recvbuf[1024] = {0};
	char sendbuf[1024] = {0};
    socklen_t len;
    struct sockaddr_in preply_addr;
    memset(&preply_addr, 0, sizeof(preply_addr));
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
        //fprintf(stderr, "preply_addr.sin_len = %d\n", preply_addr.sin_len);
        //#define PF_UNSPEC   0   /* Unspecified.  */
        //#define PF_INET     2   /* IP protocol family.  */
        int n= recvfrom(sockconn, recvbuf, MAXLINE, 0, (struct sockaddr*)&preply_addr, &len);
        if (n >= 0)
        {
            //preply_addr.sin_family = 2;
            fprintf(stderr, "pservaddr->sin_addr= %u, preply_addr.sin_addr= %u\n", ((struct sockaddr_in *)pservaddr)->sin_addr.s_addr, preply_addr.sin_addr.s_addr);
            fprintf(stderr, "pservaddr->sin_family= %u, preply_addr.family= %u\n", ((struct sockaddr_in *)pservaddr)->sin_family, preply_addr.sin_family);
            fprintf(stderr, "pservaddr->sin_port= %u, preply_addr.sin_port= %u\n", ((struct sockaddr_in *)pservaddr)->sin_port, preply_addr.sin_port);
            fprintf(stderr, "pservaddr->sin_zero= %s, preply_addr.sin_zero= %s\n", ((struct sockaddr_in *)pservaddr)->sin_zero, preply_addr.sin_zero);
            if (len != servlen || memcmp(pservaddr, &preply_addr, len) != 0)
            {
                fprintf(stderr, "reply from %s (ignore)\n", inet_ntoa(preply_addr.sin_addr));
                //continue;
            }

            recvbuf[n] = 0;
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
