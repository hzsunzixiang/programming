#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <semaphore.h>
#include <sys/shm.h>
#include <sys/stat.h>        /* For mode constants */
#include <fcntl.h>           /* For O_* constants */
#include <mqueue.h> 
#include <errno.h> 
#include <sys/ipc.h>  // ftok
#include <signal.h> 
#include <sys/select.h> 



#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

volatile sig_atomic_t mqflag;
typedef void Sigfunc(int);
    Sigfunc *
signal(int signo, Sigfunc *func);
static void sig_usr1(int);

// 只有消息再从空变为非空时才会触发 mq_notify ,不然得不到想要的结果

int pipefd[2];
int main(int argc, char *argv[])
{
	//int nfds;
	char c;
	fd_set rset;
	mqd_t mqd;
	void *buff;
	ssize_t n;
	struct mq_attr attr;
	struct sigevent sigev;

	if (argc != 2)
	{
		fprintf(stderr, "usage: %s <name> \n", argv[0]);
		exit(1);
	}

	mqd = mq_open(argv[1], O_RDONLY | O_NONBLOCK);
	if (mqd < 0)
	{
		handle_error("mq_open");
	}
	int ret = mq_getattr(mqd, &attr);
	if (ret < 0)
	{
		handle_error("mq_getattr");
	}
	buff = malloc(attr.mq_msgsize);
	if (buff == NULL)
	{
		handle_error("mq_getattr");
	}


	pipe(pipefd);
	signal(SIGUSR1, sig_usr1);

	sigev.sigev_notify =  SIGEV_SIGNAL;
	sigev.sigev_signo = SIGUSR1;
	// 注意这里必须先注册，不然sigwait得不到通知
	ret =  mq_notify(mqd, &sigev);  //register first
	if (ret < 0)
	{
		handle_error("mq_notify");
	}
	FD_ZERO(&rset);
	for (; ;)
	{
		FD_SET(pipefd[0], &rset);	
again:
		if ( (n = select (pipefd[0] + 1, &rset, NULL, NULL, NULL)) < 0)
		{
			if (errno == EINTR)
				goto again;
			else
				handle_error("select");
		}
		if (FD_ISSET(pipefd[0], &rset))
		{
			read(pipefd[0], &c, 1);
		}
		//else if (n == 0 && timeout == NULL)
		//{
		//	fprintf(stderr, "select return 0 with no timeout");
		//	exit(EXIT_FAILURE);
		//}
		ret =  mq_notify(mqd, &sigev);  // reregister 
		if (ret < 0)
		{
			handle_error("mq_notify");
		}
		while ( (n = mq_receive(mqd, buff, attr.mq_msgsize, NULL)) >=0)
		{
			printf("read %ld bytes\n", (long)n);
		}
		if (errno != EAGAIN)
		{
			handle_error("mq_receive");
		}
	}


	exit(EXIT_SUCCESS);
}

static void sig_usr1(int signo)
{
	//sleep(2);
	write(pipefd[1], "", 1);
	return;
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









