#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <pthread.h>

#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

static void sig_int(int);

int main(void)
{
	if (signal(SIGINT, sig_int) == SIG_ERR)
	{
		err_sys("can't catch SIGINT");
	}
	for (; ;)
	{
		printf("in main pid_t:%lu, threadid:%lu\n", (unsigned long)getpid(), (unsigned long)pthread_self());
		pause();
	}
}

static void sig_int(int signo)
{
	printf("in signal pid_t:%lu, threadid:%lu\n", (unsigned long)getpid(), (unsigned long)pthread_self());
	if (signo == SIGINT)
		printf("recived SIGINT\n");
	else
		fprintf(stderr, "received signal:%d\n", signo);
}
