/* include serv01 */
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/un.h>
#include <signal.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <time.h>
#include <wait.h>
#include <errno.h>
#include <sys/resource.h>
#include	<sys/mman.h>

#define MAXLINE  1024
#define err_msg(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define err_sys(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define err_quit(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
int tcp_listen(const char *host, const char *serv, socklen_t *addrlenp);
int Tcp_listen(const char *host, const char *serv, socklen_t *addrlenp);
pid_t child_make(int i, int listenfd, int addrlen);
ssize_t write_fd(int fd, void *ptr, size_t nbytes, int sendfd);
ssize_t Write_fd(int fd, void *ptr, size_t nbytes, int sendfd);
ssize_t read_fd(int fd, void *ptr, size_t nbytes, int *recvfd);
ssize_t Read_fd(int fd, void *ptr, size_t nbytes, int *recvfd);
#define max(x,y) ((x) > (y) ? (x) : (y))

typedef struct {
  pid_t		child_pid;		/* process ID */
  int		child_pipefd;	/* parent's stream pipe to/from child */
  int		child_status;	/* 0 = ready */
  long		child_count;	/* # connections handled */
} Child;

Child	*cptr;		/* array of Child structures; calloc'ed */

void web_child(int sockfd);
void pr_cpu_time(void);
void sig_chld(int signo);

static int nchildren;
static pid_t *pids;


static int		nchildren;

int
main(int argc, char **argv)
{
	int			listenfd, i, navail, maxfd, nsel, connfd, rc;
	void		sig_int(int);
	pid_t		child_make(int, int, int);
	ssize_t		n;
	fd_set		rset, masterset;
	socklen_t	addrlen, clilen;
	struct sockaddr	*cliaddr;

	if (argc == 3)
		listenfd = Tcp_listen(NULL, argv[1], &addrlen);
	else if (argc == 4)
		listenfd = Tcp_listen(argv[1], argv[2], &addrlen);
	else
		err_quit("usage: serv05 [ <host> ] <port#> <#children>");

	FD_ZERO(&masterset);
	FD_SET(listenfd, &masterset);
	maxfd = listenfd;
	cliaddr = malloc(addrlen);
	if(cliaddr == NULL)
	{
		err_quit("malloc");
	}
	nchildren = atoi(argv[argc-1]);
	navail = nchildren;
	cptr = calloc(nchildren, sizeof(Child));
	if(cptr == NULL)
	{
		err_sys("calloc");
	}

		/* 4prefork all the children */
	for (i = 0; i < nchildren; i++) {
		child_make(i, listenfd, addrlen);	/* parent returns */
		FD_SET(cptr[i].child_pipefd, &masterset);
		maxfd = max(maxfd, cptr[i].child_pipefd);
	}

	if (signal(SIGINT, sig_int) == SIG_ERR)
		perror("signal SIGINT");

	for ( ; ; ) {
		rset = masterset;
		if (navail <= 0)
			FD_CLR(listenfd, &rset);	/* turn off if no available children */
		nsel = select(maxfd + 1, &rset, NULL, NULL, NULL);
		if(nsel < 0)
		{
			perror("select");
			continue;
		}

			/* 4check for new connections */
		if (FD_ISSET(listenfd, &rset)) {
			clilen = addrlen;
			connfd = accept(listenfd, cliaddr, &clilen);

			for (i = 0; i < nchildren; i++)
				if (cptr[i].child_status == 0)
					break;				/* available */

			if (i == nchildren)
				err_quit("no available children");
			cptr[i].child_status = 1;	/* mark child as busy */
			cptr[i].child_count++;
			navail--;

			n = Write_fd(cptr[i].child_pipefd, "", 1, connfd);
			close(connfd);
			if (--nsel == 0)
				continue;	/* all done with select() results */
		}

			/* 4find any newly-available children */
		for (i = 0; i < nchildren; i++) {
			if (FD_ISSET(cptr[i].child_pipefd, &rset)) {
				if ( (n = read(cptr[i].child_pipefd, &rc, 1)) == 0) // 注意处理返回-1的情形
					err_quit("child  terminated unexpectedly");
				cptr[i].child_status = 0;
				navail++;
				if (--nsel == 0)
					break;	/* all done with select() results */
			}
		}
	}
}
/* end serv05a */

void
sig_int(int signo)
{
	int		i;
	void	pr_cpu_time(void);

		/* 4terminate all children */
	for (i = 0; i < nchildren; i++)
		kill(cptr[i].child_pid, SIGTERM);
	while (wait(NULL) > 0)		/* wait for all children */
		;
	if (errno != ECHILD)
		err_sys("wait error");

	pr_cpu_time();

	for (i = 0; i < nchildren; i++)
		printf("child %d, %ld connections\n", i, cptr[i].child_count);

	exit(0);
}


/* include tcp_listen */

int tcp_listen(const char *host, const char *serv, socklen_t *addrlenp)
{
	int				listenfd, n;
	const int		on = 1;
	struct addrinfo	hints, *res, *ressave;

	bzero(&hints, sizeof(struct addrinfo));
	hints.ai_flags = AI_PASSIVE;
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
		listenfd = socket(res->ai_family, res->ai_socktype, res->ai_protocol);
		if (listenfd < 0)
			continue;		/* error, try next one */

		if(setsockopt(listenfd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on)))
		{
			err_quit("setsockopt");
		}
		if (bind(listenfd, res->ai_addr, res->ai_addrlen) == 0)
			break;			/* success */

		close(listenfd);	/* bind error, close and try next one */
	} while ( (res = res->ai_next) != NULL);

	if (res == NULL)	/* errno from final socket() or bind() */
	{
		char tmp[128];
		snprintf(tmp, sizeof(tmp),  "tcp_connect error for %s, %s", host, serv);
		err_sys(tmp);
	}

	if(listen(listenfd, SOMAXCONN) < 0)
	{
		err_quit("listen");
	}

	if (addrlenp)
		*addrlenp = res->ai_addrlen;	/* return size of protocol address */

	freeaddrinfo(ressave);

	return(listenfd);
}
/* end tcp_listen */

/*
 * We place the wrapper function here, not in wraplib.c, because some
 * XTI programs need to include wraplib.c, and it also defines
 * a Tcp_listen() function.
 */

int Tcp_listen(const char *host, const char *serv, socklen_t *addrlenp)
{
	return(tcp_listen(host, serv, addrlenp));
}
#define	MAXN	16384		/* max # bytes client can request */

ssize_t writen(int fd, const void *buf, size_t count)
{
	size_t nleft = count;
	ssize_t nwritten;
	char *bufp = (char*)buf;

	while (nleft > 0)
	{
		if ((nwritten = write(fd, bufp, nleft)) < 0)
		{
			if (errno == EINTR)
				continue;
			return -1;
		}
		else if (nwritten == 0)
			continue;

		bufp += nwritten;
		nleft -= nwritten;
	}

	return count;
}
ssize_t recv_peek(int sockfd, void *buf, size_t len)
{
	while (1)
	{
		int ret = recv(sockfd, buf, len, MSG_PEEK);
		if (ret == -1 && errno == EINTR)
			continue;
		return ret;
	}
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


ssize_t readline(int sockfd, void *buf, size_t maxline)
{
	int ret;
	int nread;
	char *bufp = buf;
	int nleft = maxline;
	while (1)
	{
		ret = recv_peek(sockfd, bufp, nleft);
		if (ret < 0)
			return ret;
		else if (ret == 0)
			return ret;

		nread = ret;
		int i;
		for (i=0; i<nread; i++)
		{
			if (bufp[i] == '\n')
			{
				ret = readn(sockfd, bufp, i+1);
				if (ret != i+1)
					exit(EXIT_FAILURE);

				return ret;
			}
		}

		if (nread > nleft)
			exit(EXIT_FAILURE);

		nleft -= nread;
		ret = readn(sockfd, bufp, nread);
		if (ret != nread)
			exit(EXIT_FAILURE);

		bufp += nread;
	}

	return -1;
}



	void
web_child(int sockfd)
{
	int			ntowrite;
	ssize_t		nread;
	char		line[MAXLINE], result[MAXN];

	for ( ; ; ) {
		nread = readline(sockfd, line, MAXLINE);
		if (nread < 0)
			err_quit("readline");
		else if(nread == 0)
			return;		/* connection closed by other end */

		/* 4line from client specifies #bytes to write back */
		ntowrite = atol(line);
		if ((ntowrite <= 0) || (ntowrite > MAXN))
		{
			char tmp[128];
			snprintf(tmp, sizeof(tmp), "client request for %d bytes", ntowrite);
			err_quit(tmp);
		}

		if(writen(sockfd, result, ntowrite) < 0)  // 其实这里不应该断掉
			err_quit("writen");

	}
}
void pr_cpu_time(void)
{
	double			user, sys;
	struct rusage	myusage, childusage;

	if (getrusage(RUSAGE_SELF, &myusage) < 0)
		err_sys("getrusage error");
	if (getrusage(RUSAGE_CHILDREN, &childusage) < 0)
		err_sys("getrusage error");

	user = (double) myusage.ru_utime.tv_sec +
		myusage.ru_utime.tv_usec/1000000.0;
	user += (double) childusage.ru_utime.tv_sec +
		childusage.ru_utime.tv_usec/1000000.0;
	sys = (double) myusage.ru_stime.tv_sec +
		myusage.ru_stime.tv_usec/1000000.0;
	sys += (double) childusage.ru_stime.tv_sec +
		childusage.ru_stime.tv_usec/1000000.0;

	printf("\nuser time = %g, sys time = %g\n", user, sys);
}
void sig_chld(int signo)
{
	pid_t   pid;
	int     stat;

	while ( (pid = waitpid(-1, &stat, WNOHANG)) > 0)
		printf("child %d terminated\n", pid);
	return;
}





pid_t child_make(int i, int listenfd, int addrlen)
{
	int		sockfd[2];
	pid_t	pid;
	void	child_main(int, int, int);

	if(socketpair(AF_LOCAL, SOCK_STREAM, 0, sockfd) < 0)
	{
		err_sys("socketpair");
	}

	pid = fork();
	if(pid < 0)
	{
		err_sys("fork");
	}
	else if ( pid  > 0)
	{
		close(sockfd[1]);
		cptr[i].child_pid = pid;
		cptr[i].child_pipefd = sockfd[0];
		cptr[i].child_status = 0;
		return(pid);		/* parent */
	}

	dup2(sockfd[1], STDERR_FILENO);		/* child's stream pipe to parent */
	close(sockfd[0]);
	close(sockfd[1]);
	close(listenfd);					/* child does not need this open */
	child_main(i, listenfd, addrlen);	/* never returns */
}
/* end child_make */



/* include child_main */
void
child_main(int i, int listenfd, int addrlen)
{
	char			c;
	int				connfd;
	ssize_t			n;
	void			web_child(int);

	printf("child %ld starting\n", (long) getpid());
	for ( ; ; ) {
		// 注意处理返回0的情形
		if ( (n = Read_fd(STDERR_FILENO, &c, 1, &connfd)) == 0)
			err_quit("read_fd returned 0");
		if (connfd < 0)
			err_quit("no descriptor from read_fd");

		web_child(connfd);				/* process request */
		close(connfd);

		// 处理错误情形
		write(STDERR_FILENO, "", 1);	/* tell parent we're ready again */
	}
}
/* end child_main */


ssize_t
write_fd(int fd, void *ptr, size_t nbytes, int sendfd)
{
	struct msghdr	msg;
	struct iovec	iov[1];

	union {
	  struct cmsghdr	cm;
	  char				control[CMSG_SPACE(sizeof(int))];
	} control_un;
	struct cmsghdr	*cmptr;

	msg.msg_control = control_un.control;
	msg.msg_controllen = sizeof(control_un.control);

	cmptr = CMSG_FIRSTHDR(&msg);
	cmptr->cmsg_len = CMSG_LEN(sizeof(int));
	cmptr->cmsg_level = SOL_SOCKET;
	cmptr->cmsg_type = SCM_RIGHTS;
	*((int *) CMSG_DATA(cmptr)) = sendfd;


	msg.msg_name = NULL;
	msg.msg_namelen = 0;

	iov[0].iov_base = ptr;
	iov[0].iov_len = nbytes;
	msg.msg_iov = iov;
	msg.msg_iovlen = 1;

	return(sendmsg(fd, &msg, 0));
}
/* end write_fd */

ssize_t
Write_fd(int fd, void *ptr, size_t nbytes, int sendfd)
{
	ssize_t		n;

	if ( (n = write_fd(fd, ptr, nbytes, sendfd)) < 0)
		err_sys("write_fd error");

	return(n);
}
ssize_t
read_fd(int fd, void *ptr, size_t nbytes, int *recvfd)
{
	struct msghdr	msg;
	struct iovec	iov[1];
	ssize_t			n;

	union {
	  struct cmsghdr	cm;
	  char				control[CMSG_SPACE(sizeof(int))];
	} control_un;
	struct cmsghdr	*cmptr;

	msg.msg_control = control_un.control;
	msg.msg_controllen = sizeof(control_un.control);


	msg.msg_name = NULL;
	msg.msg_namelen = 0;

	iov[0].iov_base = ptr;
	iov[0].iov_len = nbytes;
	msg.msg_iov = iov;
	msg.msg_iovlen = 1;

	if ( (n = recvmsg(fd, &msg, 0)) <= 0)
		return(n);

	if ( (cmptr = CMSG_FIRSTHDR(&msg)) != NULL &&
	    cmptr->cmsg_len == CMSG_LEN(sizeof(int))) {
		if (cmptr->cmsg_level != SOL_SOCKET)
			err_quit("control level != SOL_SOCKET");
		if (cmptr->cmsg_type != SCM_RIGHTS)
			err_quit("control type != SCM_RIGHTS");
		*recvfd = *((int *) CMSG_DATA(cmptr));
	} else
		*recvfd = -1;		/* descriptor was not passed */


	return(n);
}
/* end read_fd */

ssize_t
Read_fd(int fd, void *ptr, size_t nbytes, int *recvfd)
{
	ssize_t		n;

	if ( (n = read_fd(fd, ptr, nbytes, recvfd)) < 0)
		err_sys("read_fd error");

	return(n);
}
