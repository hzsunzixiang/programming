#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <stdio.h>
#define  M 50000000

void Summation1(int* pSum, int size)
{
	for(int i=0; i<size-1; i++)
	{
		pSum[i+1] += pSum[i];
	}
	return;
}
int sum1[M] = {1,2,3,4,5,6,7,8,9,0};
int main()
{
	clock_t start;
	clock_t end;

	start = clock();
	Summation1(sum1, M);
	end = clock();
	printf("Time Expense is %ld\n",end-start);


	return 0;
}
