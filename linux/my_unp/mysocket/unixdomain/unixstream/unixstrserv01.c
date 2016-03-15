#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#include <signal.h>
#include <errno.h>
#include <sys/un.h>
#include <sys/socket.h>
#include <sys/types.h>          /* See NOTES */
#include <sys/wait.h>



// strace 跟踪
// socket(PF_LOCAL, SOCK_STREAM, 0)        = 3
// unlink("/tmp/test")                     = 0
// bind(3, {sa_family=AF_LOCAL, sun_path="/tmp/test"}, 110) = 0
// listen(3, 128)                          = 0
// rt_sigaction(SIGCHLD, {0x400b5c, [CHLD], SA_RESTORER|SA_RESTART, 0x7f522f7751c0}, {SIG_DFL, [], 0}, 8) = 0
// accept(3, {sa_family=AF_LOCAL, NULL}, [2]) = 4
// 

#define SA struct sockaddr
#define	MAXLINE 1024
#define UNIXSTR_PATH "/tmp/test"
#define err_msg(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define err_quit(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)
#define err_sys(m)  do  {  perror(m); exit(EXIT_FAILURE);  } while(0)

void str_echo(int sockfd);

typedef void Sigfunc(int);

int
main(int argc, char **argv)
{
	int					listenfd, connfd;
	pid_t				childpid;
	socklen_t			clilen;
	struct sockaddr_un	cliaddr, servaddr;
	void				sig_chld(int);

	if((listenfd = socket(AF_LOCAL, SOCK_STREAM, 0)) < 0)
	{
		perror("socket");
		return -1;
	}

	unlink(UNIXSTR_PATH);
	bzero(&servaddr, sizeof(servaddr));
	servaddr.sun_family = AF_LOCAL;
	strcpy(servaddr.sun_path, UNIXSTR_PATH);

	if(bind(listenfd, (SA *) &servaddr, sizeof(servaddr)) < 0)
	{
		perror("bind");
		return -1;
	}

	if(listen(listenfd, SOMAXCONN) < 0)
	{
		perror("bind");
		return -1;
	}

	Sigfunc	*sigfunc;
	sigfunc = signal(SIGCHLD, sig_chld);
	if (sigfunc == SIG_ERR)
        perror("signal:");

	for ( ; ; ) {
		clilen = sizeof(cliaddr);
		if ( (connfd = accept(listenfd, (SA *) &cliaddr, &clilen)) < 0) {
			if (errno == EINTR)
				continue;		/* back to for() */
			else
				err_sys("accept error");
		}

		if ( (childpid = fork()) == 0) {	/* child process */
			close(listenfd);	/* close listening socket */
			str_echo(connfd);	/* process request */
			exit(0);
		}
		close(connfd);			/* parent closes connected socket */
	}
}

// 这个实现不全面 使用writen 等函数
void
str_echo(int sockfd)
{
	ssize_t		n;
	char		buf[MAXLINE];

again:
	while ( (n = read(sockfd, buf, MAXLINE)) > 0)
		write(sockfd, buf, n);

	if (n < 0 && errno == EINTR)
		goto again;
	else if (n < 0)
		err_sys("str_echo: read error");
}
void sig_chld(int signum)
{
	pid_t pid;
	int stat;
	
	while ( (pid = waitpid(-1, &stat, WNOHANG)) > 0)
	{
		printf("child %d terminated\n", pid);
	}
	return;

}
