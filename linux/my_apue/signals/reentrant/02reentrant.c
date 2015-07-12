#include <unistd.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <fcntl.h>

#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <signal.h>


#define ERR_EXIT(m) \
	do  {  perror(m);  exit(EXIT_FAILURE);  } while(0) 

typedef struct
{
	int a;
	int b;
} TEST;

TEST g_data;

void handler(int sig);
int main(int argc, char *argv[])
{
	TEST zeros = {0, 0};
	TEST ones = {1, 1};
	if (signal(SIGALRM, handler) == SIG_ERR)
		ERR_EXIT("signal error");

	g_data = zeros;
	alarm(1);
	// 赋值的反汇编代码如下 每条语句均有可能被中断
	//804848d:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
	//8048494:	00 
	//8048495:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
	//804849c:	00 
	//804849d:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
	//80484a4:	00 
	//80484a5:	c7 44 24 14 01 00 00 	movl   $x1,0x14(%esp)
	//80484ac:	00 
	//80484ad:	c7 44 24 04 4e 85 04 	movl   $0x804854e,0x4(%esp)
	for (;;)
	{
		g_data = zeros;
		g_data = ones;
	}
	return 0;
}

void unsafe_fun()
{
	printf("%d %d\n", g_data.a, g_data.b);
}

void handler(int sig)
{
	unsafe_fun();
	alarm(1);
}
