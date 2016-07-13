#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int global = 0;

int fun_1(void)
{
	return 1;
}

int fun_a(void)
{
	int a = 0;
	printf("%d\n", a);
	return 0;
}

int main(void)
{
	for (;;)
	{
		fun_1();
		fun_a();
		sleep(2);
	}
	return 0;
}

