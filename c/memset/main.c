
#include <stdio.h>
#include <stdlib.h>
#include <string.h>



int main()
{
	int i = 0;
	for (i = 0; i < 10000000; i++)
	{
		char x[50000];
		memset(x, 12, sizeof(x));
		if (i % 10000 == 0)
		{
			printf("1111\n");
		}
	}
	return 0;
}
