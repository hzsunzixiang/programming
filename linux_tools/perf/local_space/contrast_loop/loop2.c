#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <stdio.h>

#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <stdio.h>

#define  M 100
#define  N 100000000
int main()
{
	clock_t start;
	clock_t end;
	int i = 0;
	int j = 0;

	start = clock();
	for(i=0; i<M; i++)
	{
		for(j=0; j<N; j++);
	}
	end = clock();
	printf("Time Expense is %ld\n",end-start);
	return 0;
}
