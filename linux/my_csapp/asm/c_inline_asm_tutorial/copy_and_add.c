
#include <stdio.h>


#include <stdio.h>
// This code copies src to dst and add 1 to dst. 
int main()
{
	int src = 1;
	int dst;

	asm ("mov %1, %0\n\t"
			"add $1, %0"
			: "=r" (dst)
			: "r" (src));

	printf("%d\n", dst);
	return 0;
}
