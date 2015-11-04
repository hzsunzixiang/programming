#include <stdio.h>
#include <stdlib.h>


// 和test2的汇编对比 
// __attribute__((constructor)) static void _bar() 
static void _hello() 
{
	printf("in_hellofun\n"); 
}
int main()
{

	_hello();
	return 0;
}
