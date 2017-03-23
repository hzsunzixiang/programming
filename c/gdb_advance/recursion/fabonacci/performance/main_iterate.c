#include <stdio.h>



unsigned long long Fibonacci(int n)
{
	if (n == 0) return 0;

	unsigned long long  previous = 0;

	unsigned long long current = 1;

	for (unsigned int i = 1; i < n; ++i) {

		unsigned long long  next = previous + current;
		previous = current;
		current = next;
	}
	return current;
} 

int main()
{
	for (unsigned int i = 0; i < 70; ++i) 
	{
		unsigned long long x = Fibonacci(i);
		printf("i:%d --- %lld\n", i, x);
	}
	return 0;
}


