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



#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)


// 只有消息再从空变为非空时才会触发 mq_notify ,不然得不到想要的结果

int main(int argc, char *argv[])
{
	int signo;
	mqd_t mqd;
	void *buff;
	ssize_t n;
	sigset_t newmask;
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


	// 以下三个函数要处理错误
	sigemptyset(&newmask);
	sigaddset(&newmask, SIGUSR1);
	sigprocmask(SIG_BLOCK, &newmask, NULL);  // block SIGUSR1

	sigev.sigev_notify =  SIGEV_SIGNAL;
	sigev.sigev_signo = SIGUSR1;
	// 注意这里必须先注册，不然sigwait得不到通知
	ret =  mq_notify(mqd, &sigev);  //register first
	if (ret < 0)
	{
		handle_error("mq_notify");
	}
	for (; ;)
	{
		int ret = sigwait(&newmask, &signo);
		printf("sigwait return\n");
		if (ret > 0)
		{
			handle_error("sigwait");
		}

		if (signo == SIGUSR1)
		{
			ret =  mq_notify(mqd, &sigev);  // reregister first
			if (ret < 0)
			{
				handle_error("mq_notify");
			}
			while ( (n = mq_receive(mqd, buff, attr.mq_msgsize, NULL)) >=0)
			{
				printf("read %ld bytes\n", (long)n);
			}
			if (errno != EAGAIN)
				handle_error("mq_receive");
		}

	}


	exit(EXIT_SUCCESS);
}











