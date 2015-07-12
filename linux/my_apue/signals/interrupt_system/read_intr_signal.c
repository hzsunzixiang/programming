#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#define err_sys(msg)  do { perror(msg); exit(EXIT_FAILURE); } while (0)

void sig_handler(int signum)
{
	printf("in handler\n");
	sleep(1);
	printf("handler return\n");
}

int main(int argc, char **argv)
{
	char buf[100];
	int ret;

	bzero(buf, 100);

	typedef void (*__sighandler_t) (int);
	__sighandler_t handler = signal(SIGINT, sig_handler);
	if (handler == SIG_ERR)
	{
		err_sys("can't catch SIGUSR1");
	}
	printf("__sighandler_t : %d\n", (int)handler);
	// 设置自动重启时 read不返回
	// 不自动重启，read返回 -1 
	ret = read(0, buf, 100);
	printf("ret: %d \n", ret);
	if (ret == -1) {
		printf("errno: %d", errno);
		perror("read");
	}
	printf("errno: %d\n", errno);

	printf("read %d bytes:\n", ret);
	printf("%s\n", buf);

	return 0;
}
