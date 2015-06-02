#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>


void sig_handler(int signum)
{
	printf("in handler\n");
	sleep(1);
	printf("handler return\n");
}
int main(int argc, char **argv)
{
	char buf[10];
	int n;
	bzero(buf, 10);

	struct sigaction action, old_action;

	action.sa_handler = sig_handler;
	sigemptyset(&action.sa_mask);
	action.sa_flags = 0;
	/* 版本1:不设置SA_RESTART属性
	 * 版本2:设置SA_RESTART属性 */
	//action.sa_flags |= SA_RESTART;

	sigaction(SIGINT, NULL, &old_action);
	if (old_action.sa_handler != SIG_IGN) {
		sigaction(SIGINT, &action, NULL);
	}

	while (1) {

		n = read(0, buf, 10);

		if (n == -1 && errno != EINTR) {
			perror("read error");
			printf("read error errno:%d\n", errno);
			break;

		}
		else if (errno == EINTR)
		{
			perror("read error EINTR");
			printf("read error errno:%d\n", errno);
			errno = 0;
			continue;
		}

		if (n == 0) {
			printf("read done\n");
			break;
		}
		if(n > 0)
		{
			printf("read %d bytes:\n", n);
			break;
		}

	}

	printf("read %d bytes:\n", n);
	printf("%s\n", buf);

	return 0;
}
