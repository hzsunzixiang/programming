
#include <stdio.h>


#ifdef USE_INLINE
inline int hello(int a, int b)  __attribute__((always_inline));
#else
#endif



inline int hello(int a, int b) 
{
	int i = 0;
	// 强制内联，即使油循环也会生成内联函数
	// 此时内联，性能反倒差
	for (; i < 100; i++)
	{
		i += 2;
	}
	return a + b + i;
	
}

int main(void)
{
	int a = 1;
	int b = 2;
	int i = 0;
	int c = 0;
	// 去掉for循环可以查看内联函数的汇编语言
	for (; i < 100000000; i++)
	{
	  c = hello(a, b);
	}

	printf("c = %d\n", c);



	return 0;
}

