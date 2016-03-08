#include <stdio.h>

#include <stdlib.h>
int main()
{
	int i = 100;
	char *s =  "hello,world";
	char array[100] =  "hello,china";
	long j = 1000;
	for (;;)
	{
		//printf("---%i,%s,%s,%ld----\n", i, s, array, j);   // right  no coredump
		//printf("---%i,%s,%d----\n", i, s, array);          // error  no coredump
		//printf("---%ld,%d,%d,%s----\n", i, s, array, j);   // error coredump
		//printf("---%i,%s,%s----\n", i, s, j);   	   	// error coredump
		//printf("---%s----\n", j);   	   	// error coredump
		// printf("---%ld,%d,%d,%s----\n", i, s, array, j);
		
		//printf("---%ld,%ld,%ld,%d----\n", i, i, i, j);
		printf("---%ld,%d----\n", s, array);
	}
	printf("over");
	return 0;
}

