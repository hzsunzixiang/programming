
#include <stdio.h>


#include <stdio.h>

int main()
{
	//int a=100, b=500, c=300;
	int a=100, b=500, sum=300;

	// add 操作
	//__asm__(
	//		"addl %2, %0"       // 1
	//		: "=g"(sum)           // 2
	//		: "r"(a), "g"(b)    // 3  c(0)  第一次出现  a(1)   b(2)
	//		: "memory");        // 4



	__asm__ ( 

			"addl %2,%2\n\tmovl %1,%0\n" 

			:"=m"(sum) 

			:"r"(a),"r"(b) 

			); 

	printf("现在sum是:%d, a: %d, b:%d\n", sum, a, b);
	return 0;
}
