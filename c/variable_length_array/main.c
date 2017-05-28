#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int fun();

int main()
{
	fun();
	return 0;
}
int fun()
{
	int n = 10;
	int vals[n];

	for (int i = 0; i < n; i++)
		vals[i] =  i + 100;

	for (int i = 0; i < n; i++)
		printf("i:%d\n",  vals[i]);
	return 0;
}
