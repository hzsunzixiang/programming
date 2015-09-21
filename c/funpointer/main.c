#include <stdio.h>

#define offsetof(TYPE, MEMBER) ((int)(&((TYPE *)0)->MEMBER))

#define container_of(ptr, type, member) ({   \
		const typeof( ((type *)0)->member ) *__mptr = (ptr); \
		(type *)( (char *)__mptr - offsetof(type,member) );})

/* 例一：函数指针直接调用 */

# ifndef __cplusplus
# include <stdio.h>
# else
# include <cstdio>
# endif

int max(int x, int y)
{
	return x > y ? x : y;
}

int main(void)
{
	/* p 是函数指针 */
	int (* p)(int, int) = & max; // &可以省略
	int a = 1, b = 2, c = 3, d;

	/* 与直接调用函数等价，d = max(max(a, b), c) */
	d = p(p(a, b), c); 

	printf("the maxumum number is: %d\n", d);

	return 0;
}
