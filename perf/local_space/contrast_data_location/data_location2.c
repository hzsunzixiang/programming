#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <stdio.h>
#define  M 50000000

void Summation2(int* pSum, int size)
{
	int temp;
	temp = 0;
	for(int i=0; i<size-1; i++)
	{
		temp += pSum[i];
	}
	pSum[size-1] = temp;
	return;
}
int sum2[M] = {1,2,3,4,5,6,7,8,9,0};
int main()
{
	clock_t start;
	clock_t end;


	start = clock();
	Summation2(sum2, M);
	end = clock();
	printf("Time Expense is %ld\n",end-start);
	return 0;
}
