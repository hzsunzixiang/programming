#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>

#define ADDR(address) (void *)(address), (unsigned long)(address)/1024/1024, (unsigned long)(address)/1024/1024/1024

static void sigseg_handler(int sig)
{
	int x;
	printf ("Caught signal %d (%s)\n", sig, strsignal(sig));
	printf ("Top of handler stack near %p(%luM, %luG)\n", ADDR(&x));
	fflush(NULL);

	_exit(EXIT_FAILURE);    //在段错误后不能从此处返回
}

static void overflow_stack(int call_num)
{
	char a[100000];        //撑大栈帧

	printf ("Call %4d - top of stack near %p(%luM, %luG) \n", call_num, ADDR(&a[0]));

	overflow_stack(call_num + 1);
}

int main(int argc, char *argv[])
{
	stack_t sigstack;
	struct sigaction sa;
	int j;

	printf ("Top of standard stack is near %p(%luM, %luG)\n", ADDR(&j));
	//分配可变栈并通知内核

	sigstack.ss_sp = malloc(SIGSTKSZ);
	if (sigstack.ss_sp == NULL) {
		perror ("malloc");
		exit (EXIT_FAILURE);
	}
	sigstack.ss_size = SIGSTKSZ;
	sigstack.ss_flags = 0;
	if (sigaltstack(&sigstack, NULL) == -1) {
		perror ("sigaltstack");
		exit (EXIT_FAILURE);
	}
	printf("\nAlternate stack is at=%p(%luM, %luG),  Top of heap 堆顶 is =%p(%luM, %luG) \n", ADDR(sigstack.ss_sp), ADDR(sbrk(0)));

	sa.sa_handler = sigseg_handler;    //建立SIGSEGV  的处理函数
	sigemptyset(&sa.sa_mask);
	sa.sa_flags = SA_ONSTACK;    //处理函数使用可变栈
	if (sigaction(SIGSEGV, &sa, NULL) == -1) {
		perror("sigaction");
		exit(EXIT_FAILURE);
	}

	overflow_stack(1);
	return 0;
}
