#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/un.h>
#include <sys/socket.h>


#define SA struct sockaddr
#define max(x,y) ((x) > (y) ? (x) : (y))
#define UNIXDG_PATH "/tmp/testdg"
#define err_msg(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define err_quit(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define MAXLINE 1024


void dg_cli(FILE *fp, int sockconn, const struct sockaddr *pservaddr, socklen_t servlen);
int
main(int argc, char **argv)
{
	int					sockfd;
	struct sockaddr_un	cliaddr, servaddr;

	sockfd = socket(AF_LOCAL, SOCK_DGRAM, 0);

	bzero(&cliaddr, sizeof(cliaddr));		/* bind an address for us */
	cliaddr.sun_family = AF_LOCAL;

	// receive from name = /tmp/fileX6drQq, returned len = 18
	// Unlike our UDP client, when using the Unix domain datagram protocol, we must explicitly bind a pathname to our socket so that the server has a pathname to which it can send its reply. We call tmpnam to assign a unique pathname that we then bind to our socket. Recall from Section 15.4 that sending a datagram on an unbound Unix domain datagram socket does not implicitly bind a pathname to the socket. Therefore, if we omit this step, the server's call to recvfrom in the dg_echo function returns a null pathname, which then causes an error when the server calls sendto.
	strcpy(cliaddr.sun_path, tmpnam(NULL));

	bind(sockfd, (SA *) &cliaddr, sizeof(cliaddr));

	bzero(&servaddr, sizeof(servaddr));	/* fill in server's address */
	servaddr.sun_family = AF_LOCAL;
	strcpy(servaddr.sun_path, UNIXDG_PATH);

	dg_cli(stdin, sockfd, (SA *) &servaddr, sizeof(servaddr));

	exit(0);
}
void dg_cli(FILE *fp, int sockconn, const struct sockaddr *pservaddr, socklen_t servlen)
{
    struct sockaddr_un  cliaddr;
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

		// receive from name = /tmp/fileX6drQq, returned len = 18
		len = sizeof(cliaddr);
		int n= recvfrom(sockconn, recvbuf, MAXLINE, 0, (struct sockaddr*)&cliaddr, &len);
		if (n >= 0)
		{
			recvbuf[n] = 0;
			printf("receive from name = %s, returned len = %d\n", cliaddr.sun_path, len);
			fputs(recvbuf, stdout);
		}
		else
		{
			perror("read error");
			exit(EXIT_FAILURE);
		}
	}
}
