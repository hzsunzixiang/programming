#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main()
{   int i;
	for(i = 0; ; ++i) {
		printf("My counter: %d\n", i);
		sleep(2);
	}
	return 0;
}
