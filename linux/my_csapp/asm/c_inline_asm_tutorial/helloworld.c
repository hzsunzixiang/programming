
#include <stdio.h>


//http://nxlhero.blog.51cto.com/962631/1099568
//使用__asm__宏就可以嵌入汇编，__volatile__指示不让gcc优化下面的汇编代码。
// 第一个汇编程序
int main() 

{ 
	register int eax asm("eax");
	register int ebx asm("ebx");
	register int esp asm("esp");

	printf("eax:%u\n", eax);
	printf("ebx:%u\n", ebx);
	printf("esp:%u\n", esp);
	__asm__ __volatile__ (  
			"movl %eax,%ebx\n\taddl %eax,%ebx\n" 
			); 

	printf("eax:%u\n", eax);
	printf("ebx:%u\n", ebx);
	__asm__ __volatile__ (  
			"movl %eax,%ebx\n\taddl %eax,%ebx\n" 
			); 
	printf("eax:%u\n", eax);
	printf("ebx:%u\n", ebx);
	return 0; 
} 
