#include <stdio.h>
int rfact(int n)
{
	int result;
	if (n <= 1)
		result = 1;
	else
		result = n * rfact(n-1);
	return result;
}

int main()
{
	int x = rfact(10);
	printf("%d\n", x);
	return 0;
}
