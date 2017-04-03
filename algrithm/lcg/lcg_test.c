#include <stdio.h>
#include <time.h>
#include <stdint.h>

/* always assuming int is at least 32 bits */
int rand();
int rseed = 0;

inline void srand(int x)
{
	rseed = x;
}

#define RAND_MAX ((1U << 31) - 1)

inline int rand()
{
	// 因为不可能超过 最大值 ，取模操作省略了
	//return rseed = (rseed * 1103515245 + 12345) & RAND_MAX;
	return rseed = (rseed * 1103515245 + 12345) % RAND_MAX;
	//return rseed = rseed * 1103515245 + 12345;
}


int main()
{
	int64_t i;

	srand(10000);
	long time_cur = time(NULL);
	printf("rand max is 0x%x, time_cur:%ld\n", RAND_MAX, time_cur);
	srand(time_cur);
	// 打印前100个数就能看出端倪来; 种子一样 产生的数值序列一样
	//for (i = 0; i < (int64_t)(2*(RAND_MAX)) + 100; i++)
	//for (i = 0; i < (int64_t)(0*(RAND_MAX)) + 100; i++)
	for (i = 0; i < (int64_t)(0*(RAND_MAX)) + 10; i++)
		printf("%d\t", rand());

	printf("\n");

	return 0;
}




//root@debian:~/programming/algrithm/lcg# ./lcg_test 
//rand max is 2147483647, time_cur:1491254314
//542841371       346064825       600463359       842095053       1777197699      161451008       2107034682      441110763       1044692552      1760503010
//root@debian:~/programming/algrithm/lcg# fg
//

// 最大不超过 2**32 故 以此取模
//root@debian:~/programming/algrithm/lcg# python  
//>>> print ((1491254314*1103515245)%(2**32) + 12345)%(2**31-1)                                                                                                
//542841371
//>>> 
//
