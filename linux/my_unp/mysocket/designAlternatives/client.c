#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<arpa/inet.h>
#include<sys/socket.h>
#include<sys/types.h>
#include<netinet/in.h>
#include<signal.h>
#include <sys/socket.h>
#include <netdb.h>
#include <errno.h>
#include <sys/wait.h>


#define	MAXN	16384		/* max # bytes to request from server */
#define	MAXLINE 1024 
#define err_msg(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define err_quit(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define err_sys(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)

ssize_t readn(int fd, void *buf, size_t count);
int tcp_connect(const char *host, const char *serv);
	int
main(int argc, char **argv)
{
	int		i, j, fd, nchildren, nloops, nbytes;
	pid_t	pid;
	ssize_t	n;
	char	request[MAXLINE], reply[MAXN];

	if (argc != 6)
		err_quit("usage: client <hostname or IPaddr> <port> <#children> "
				"<#loops/child> <#bytes/request>");

	nchildren = atoi(argv[3]);
	nloops = atoi(argv[4]);
	nbytes = atoi(argv[5]);
	snprintf(request, sizeof(request), "%d\n", nbytes); /* newline at end */

	for (i = 0; i < nchildren; i++) {
		pid = fork();

		if(pid < 0)
		{
			err_quit("fork");
		}
		else if ( pid  == 0) {		/* child */
			for (j = 0; j < nloops; j++) {
				fd = tcp_connect(argv[1], argv[2]);

				if(write(fd, request, strlen(request)) < 0)
					err_quit("write");

				if ( (n = readn(fd, reply, nbytes)) != nbytes)
					err_quit("server readn returned ");

				close(fd);		/* TIME_WAIT on client, not server */
			}
			printf("child %d done\n", i);
			exit(0);
		}
		/* parent loops around to fork() again */
	}

	while (wait(NULL) > 0)	/* now parent waits for all children */
		;
	if (errno != ECHILD)
		err_sys("wait error");

	exit(0);
}
ssize_t readn(int fd, void *buf, size_t count)
{
	size_t nleft = count;
	ssize_t nread;
	char *bufp = (char*)buf;

	while (nleft > 0)
	{
		if ((nread = read(fd, bufp, nleft)) < 0)
		{
			if (errno == EINTR)
				continue;
			return -1;
		}
		else if (nread == 0)
			return count - nleft;

		bufp += nread;
		nleft -= nread;
	}

	return count;
}
int tcp_connect(const char *host, const char *serv)
{
	int				sockfd, n;
	struct addrinfo	hints, *res, *ressave;

	bzero(&hints, sizeof(struct addrinfo));
	hints.ai_family = AF_UNSPEC;
	hints.ai_socktype = SOCK_STREAM;

	if ( (n = getaddrinfo(host, serv, &hints, &res)) != 0)
	{
		char tmp[128];
		sprintf(tmp, "tcp_connect error for %s, %s: %s", host, serv, gai_strerror(n) );
		err_quit(tmp);
	}
	ressave = res;

	do {
		sockfd = socket(res->ai_family, res->ai_socktype, res->ai_protocol);
		if (sockfd < 0)
			continue;	/* ignore this one */

		if (connect(sockfd, res->ai_addr, res->ai_addrlen) == 0)
			break;		/* success */

		close(sockfd);	/* ignore this one */
	} while ( (res = res->ai_next) != NULL);

	if (res == NULL)	/* errno set from final connect() */
	{
		char tmp[128];
		snprintf(tmp, sizeof(tmp),  "tcp_connect error for %s, %s", host, serv);
		err_sys(tmp);
	}

	freeaddrinfo(ressave);

	return(sockfd);
}
