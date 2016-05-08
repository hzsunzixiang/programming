#include <stdarg.h>
#include <stdio.h>
#include <stdio.h>
#include <stdarg.h>
#include <math.h>

int stddev(int count, ...) 
{
	int sum = 0;
	va_list ap;
	va_start(ap, count);
	for (int i = 0; i < count; ++i) {
		int num = va_arg(ap, int);
		sum += num;
	}
	va_end(ap);
	return sum;
}

int main(void) 
{
	printf("%d\n", stddev(4, 0x1111, 0x2222, 0x3333, 0x4444));
}
