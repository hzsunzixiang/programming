#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <stdio.h>
int main()
{
	sleep(10);
	clock_t start;
	clock_t end;
	int i = 0;
	int j = 0;
	start = clock();
	for(i=0; i<100000000; i++)
	{
		for(j=0; j<2; j++);
	}
	end = clock();
	printf("Time Expense is %ld\n",end-start);

	start = clock();
	for(i=0; i<2; i++)
	{
		for(j=0; j<100000000; j++);
	}
	end = clock();
	printf("Time Expense is %ld\n",end-start);
	return 0;
}


//stephensun@debian:~/programming/perf/local_space$ ./predict1
//Time Expense is 317910
//Time Expense is 409123
