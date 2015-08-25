#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <time.h>

void sig_handler(int signum)
{
	printf("in handler\n");
	//sleep(1);
	printf("handler return\n");
}

int main(int argc, char **argv)
{
	char buf[100];
	struct sigaction action, old_action;
	time_t starttime;

	action.sa_handler = sig_handler;
	sigemptyset(&action.sa_mask);
	action.sa_flags = 0;
	/* 版本1:不设置SA_RESTART属性
	 * 版本2:设置SA_RESTART属性 */
	//action.sa_flags |= SA_RESTART;
	action.sa_flags |= SA_INTERRUPT;

	sigaction(SIGINT, &action, &old_action);

	bzero(buf, 100);


	starttime = time(NULL);
	// for循环不会被中断
	for (; ;)
	{
		if (time(NULL) > (starttime + 10))
		{
			printf("break,endtime:%d, starttime:%d\n", (int)time(NULL), (int)starttime);
			break;
		}
	}
	printf("for loop return\n");

	return 0;
}
