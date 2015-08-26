#include <signal.h>
#include <unistd.h>
#include <stdio.h>
#define ADDR(address) (void *)(address), (unsigned long)(address)/1024/1024, (unsigned long)(address)/1024/1024/1024




void handler(int sig)
{
	int x;
	printf ("Top of handler stack near %p(%luM, %luG)\n", ADDR(&x));
	write(2, "stack overflow\n", 15);
	_exit(1);
}
unsigned infinite_recursion(unsigned call_num) {
	int a[100000];
	printf ("Call %4d - top of stack near %p(%luM, %luG) \n", call_num, ADDR(&a[0]));
	return infinite_recursion(call_num + 1);
}
int main()
{
	static char stack[SIGSTKSZ];
	printf ("top of static stack near %p(%luM, %luG) \n",  ADDR(&stack));
	stack_t ss = {
		.ss_size = SIGSTKSZ,
		.ss_sp = stack,
	};
	struct sigaction sa = {
		.sa_handler = handler,
		.sa_flags = SA_ONSTACK
	};
	sigaltstack(&ss, 0);
	sigfillset(&sa.sa_mask);
	sigaction(SIGSEGV, &sa, 0);
	infinite_recursion(0);
	return 0;
}
