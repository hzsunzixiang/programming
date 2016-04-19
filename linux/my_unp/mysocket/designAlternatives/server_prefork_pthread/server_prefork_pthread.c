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
#include <pthread.h>
#include <sys/resource.h>
#include<sys/mman.h>
#include <sys/file.h>


#define MAXLINE  1024
#define err_msg(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define err_sys(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define err_quit(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
int tcp_listen(const char *host, const char *serv, socklen_t *addrlenp);
int Tcp_listen(const char *host, const char *serv, socklen_t *addrlenp);
long * meter(int nchildren);
pid_t child_make(int i, int listenfd, int addrlen);


void web_child(int sockfd);
void pr_cpu_time(void);
void sig_chld(int signo);

static int nchildren;
static pid_t *pids;
long			*cptr, *meter(int);	/* for counting #clients/child */

void my_lock_wait();
void my_lock_init(char *pathname);
void my_lock_release();

	int
main(int argc, char **argv)
{
	int			listenfd, i;
	socklen_t	addrlen;
	void		sig_int(int);
	pid_t		child_make(int, int, int);

	if (argc == 3)
		listenfd = Tcp_listen(NULL, argv[1], &addrlen);
	else if (argc == 4)
		listenfd = Tcp_listen(argv[1], argv[2], &addrlen);
	else
		err_quit("usage: ./server_prefork_meter [ <host> ] <port#> <#children>");
	nchildren = atoi(argv[argc-1]);
	pids = calloc(nchildren, sizeof(pid_t));
	cptr = meter(nchildren);
	if(pids == NULL)
	{
		err_sys("calloc");
	}

	my_lock_init("/tmp/lock.XXXXXX");
	for (i = 0; i < nchildren; i++)
		pids[i] = child_make(i, listenfd, addrlen);	/* parent returns */

	if (signal(SIGINT, sig_int) == SIG_ERR)
		perror("signal SIGINT");

	for ( ; ; )
		pause();	/* everything done by children */
}
/* end serv01 */


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
		sprintf(tmp, "tUcp_connect error for %s, %s: %s", host, serv, gai_strerror(n) );
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

/* include sigint */
	void
sig_int(int signo)
{
	int		i;
	void	pr_cpu_time(void);

	/* terminate all children */
	for (i = 0; i < nchildren; i++)
		kill(pids[i], SIGTERM);
	while (wait(NULL) > 0)		/* wait for all children */
		;
	if (errno != ECHILD)
		err_sys("wait error");

	pr_cpu_time();

	for (i = 0; i < nchildren; i++)
		printf("child %d, %ld connections\n", i, cptr[i]);

	exit(0);
}

pid_t child_make(int i, int listenfd, int addrlen)
{
	pid_t	pid;
	void	child_main(int, int, int);

	pid = fork();
	if(pid < 0)
	{
		err_sys("fork");
	}
	else if ( pid  > 0)
		return(pid);		/* parent */

	child_main(i, listenfd, addrlen);	/* never returns */
}
/* end child_make */

/* include child_main */
void child_main(int i, int listenfd, int addrlen)
{
	int				connfd;
	void			web_child(int);
	socklen_t		clilen;
	struct sockaddr	*cliaddr;

	cliaddr = malloc(addrlen);
	if(cliaddr == NULL)
	{
		err_sys("malloc addrlen");
	}

	printf("child %ld starting\n", (long) getpid());
	for ( ; ; ) {
		clilen = addrlen;
		my_lock_wait();
		if ( (connfd = accept(listenfd, cliaddr, &clilen)) < 0) {
			if (errno == EINTR)
				continue;		/* back to for() */
			else
				err_sys("accept error");
		}
		my_lock_release();

		cptr[i]++;
		web_child(connfd);		/* process the request */
		close(connfd);
	}
}
/* end child_main */

/*
 * Allocate an array of "nchildren" longs in shared memory that can
 * be used as a counter by each child of how many clients it services.
 * See pp. 467-470 of "Advanced Programming in the Unix Environment."
 */

long * meter(int nchildren)
{
	int		fd;
	long	*ptr;

	// 这里没有处理函数调用错误时的情况
#ifdef	MAP_ANON
	ptr = mmap(0, nchildren*sizeof(long), PROT_READ | PROT_WRITE,
			MAP_ANON | MAP_SHARED, -1, 0);
#else
	fd = open("/dev/zero", O_RDWR, 0);

	ptr = mmap(0, nchildren*sizeof(long), PROT_READ | PROT_WRITE,
			MAP_SHARED, fd, 0);
	close(fd);
#endif

	return(ptr);
}


/* end my_lock_wait */
static pthread_mutex_t	*mptr;	/* actual mutex will be in shared memory */

void
my_lock_init(char *pathname)
{
	int		fd;
	pthread_mutexattr_t	mattr;

	fd = open("/dev/zero", O_RDWR, 0);

	mptr = mmap(0, sizeof(pthread_mutex_t), PROT_READ | PROT_WRITE,
				MAP_SHARED, fd, 0);
	close(fd);

	pthread_mutexattr_init(&mattr);
	pthread_mutexattr_setpshared(&mattr, PTHREAD_PROCESS_SHARED);
	pthread_mutex_init(mptr, &mattr);
}
/* end my_lock_init */

/* include my_lock_wait */
void
my_lock_wait()
{
	pthread_mutex_lock(mptr);
}

void
my_lock_release()
{
	pthread_mutex_unlock(mptr);
}
/* end my_lock_wait */
