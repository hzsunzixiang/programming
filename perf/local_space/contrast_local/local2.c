#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <stdio.h>
#define  M 50000 
#define  N 10000
int array[M][N];

int main()
{
	clock_t start;
	clock_t end;
	int i = 0;
	int j = 0;
	int sum = 0;

	start = clock();
	for(i=0; i< N; i++)
	{
		for(j=0; j<M; j++)
		{
			sum+=array[j][i];
		}
	}
	end = clock();
	printf("Time Expense is %ld\n",end-start);
	printf("sum is %d\n",sum);
	return 0;
}
