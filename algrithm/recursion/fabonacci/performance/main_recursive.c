#include <stdio.h>



unsigned long long Fibonacci(unsigned int n)
{
	if ( n == 0 )
		return 0;
	else if ( n == 1 )
		return 1;
	else
		return ( Fibonacci(n-1) + Fibonacci(n-2) );
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

