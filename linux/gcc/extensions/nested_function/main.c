#include <stdio.h>
double foo (double a, double b);
int main()
{

	double a = 9;
	double b = 100;
	double z = foo(a, b);
	printf("%lf\n", z);
	
	return 0;
}
