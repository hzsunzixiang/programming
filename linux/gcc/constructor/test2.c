#include <stdio.h>
#include <stdlib.h>

// 和test1的汇编对比 
__attribute__((constructor)) static void _bar() 
{
	printf("inbarfun\n"); 
}

// 和test1的汇编对比 
__attribute__((destructor)) static void _foo() 
{
	printf("infoofun\n"); 
}
int main()
{
	printf("in main..\n");
	return 0;
}

// constructor

//.LFE2:
//	.size	_bar, .-_bar
//	.section	.init_array,"aw"
//	.align 8
//	.quad	_bar
//	.section	.rodata


// destructor ---- 
//.LFE3:
//	.size	_foo, .-_foo
//	.section	.fini_array,"aw"
//	.align 8
//	.quad	_foo
//	.text
//	.globl	main
//	.type	main, @function
