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
	extern __sighandler_t sysv_signal (int __sig, __sighandler_t __handler);
	extern __sighandler_t bsd_signal (int __sig, __sighandler_t __handler);
	// sysv_signal 和signal 表现不一致的地方，  默认是中断
	//__sighandler_t handler = sysv_signal(SIGINT, sig_handler);
	__sighandler_t handler = bsd_signal(SIGINT, sig_handler);
	//bsd 行为和signal一致，和sysv_signal 不一样
	// rt_sigaction(SIGINT, {0x8048564, [], SA_INTERRUPT|SA_NODEFER|SA_RESETHAND}, {SIG_DFL, [], 0}, 8) = 0
	// sigreturn() (mask [])                   = -1 EINTR (Interrupted system call)
	//
	//
	//__sighandler_t handler = signal(SIGINT, sig_handler);
	// rt_sigaction(SIGINT, {0x8048544, [INT], SA_RESTART}, {SIG_DFL, [], 0}, 8) = 0
	// 
	if (handler == SIG_ERR)
	{
		err_sys("can't catch SIGUSR1");
	}
	printf("__sighandler_t : %d\n", (int)handler);
	// 设置自动重启时 read不返回
	// 不自动重启，read返回 -1 
	// 参考 ~/programming/linux/my_apue/signals/signal/signal_sysv.c 等
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
