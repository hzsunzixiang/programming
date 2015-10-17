
#include <stdio.h>


#ifdef USE_INLINE
inline int hello(int a, int b)  __attribute__((always_inline));
#else
#endif


//  1. 默认情况下，如果是-O0选项，不会内联
//  2. -O0情况下 -finline-functions 选项无效，不会内联
//      而 __attribute__((always_inline)); 情况下有效果，会内联
//  3. -O1及以上优化，不加任何其他选项，会内联
//      加不加  -finline-functions 都会内联


// int hello(int a, int b) 
inline int hello(int a, int b) 
{
	return a + b;
	
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

