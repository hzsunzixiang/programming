#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int array1[50000][1000];
int array2[50000][1000];

int main()
{
	clock_t start;
	clock_t end;
	int i = 0;
	int j = 0;
	long sum = 0;

	start = clock();
	for(i=0; i< 50000; i++)
	{
		for(j=0; j<1000; j++)
		{
			sum+=array1[i][j];
		}
	}
	end = clock();
	printf("Time Expense is %ld\n",end-start);
	printf("sum is %ld\n",sum);

	start = clock();
	for(i=0; i< 1000; i++)
	{
		for(j=0; j<50000; j++)
		{
			sum+=array2[j][i];
		}
	}
	end = clock();
	printf("Time Expense is %ld\n",end-start);
	printf("sum is %ld\n",sum);
	return 0;
}
// http://www.cnblogs.com/chencheng/p/3400216.html
