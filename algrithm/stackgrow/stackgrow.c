// C program to check whether stack grows
// downward or upward.
#include<stdio.h>

void fun(int *main_local_addr)
{
	int fun_local;
	printf("main_local_addr:%p, &fun_local:%p\n", main_local_addr, &fun_local);
	if (main_local_addr < &fun_local)
		printf("Stack grows upward\n");
	else
		printf("Stack grows downward\n");
}

int main()
{
	// fun's local variable
	int main_local;
	printf("&main_local:%p\n", &main_local);

	fun(&main_local);
	return 0;
}
