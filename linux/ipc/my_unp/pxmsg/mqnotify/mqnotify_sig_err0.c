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

volatile sig_atomic_t mqflag;
typedef void Sigfunc(int);
Sigfunc *
signal(int signo, Sigfunc *func);
static void sig_usr1(int);
mqd_t mqd;
void *buff;
struct mq_attr attr;

struct sigevent sigev;
// 只有消息再从空变为非空时才会触发 mq_notify ,不然得不到想要的结果

int main(int argc, char *argv[])
{
	if (argc != 2)
	{
		fprintf(stderr, "usage: %s <name> \n", argv[0]);
		exit(1);
	}

	mqd = mq_open(argv[1], O_RDONLY);
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
	signal(SIGUSR1, sig_usr1);

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
		pause();
	}


	exit(EXIT_SUCCESS);
}

// 里面的函数不适合在信号处理中调用
static void sig_usr1(int signo)
{
	// 可以模拟信号丢失, 连续发两个，队列非空
	// sleep(2);
	ssize_t n;
	// 不重新注册，不行 习题5.
	int ret =  mq_notify(mqd, &sigev);  // reregister 
	if (ret < 0)
	{
		handle_error("mq_notify");
	}
	// 如果不接受，下一个无法通知 习题5.3
	if ( (n = mq_receive(mqd, buff, attr.mq_msgsize, NULL)) < 0)
	{
		if (errno != EAGAIN)
		{
			handle_error("mq_receive");
		}
	}
	printf("read %ld bytes\n", (long)n);
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









