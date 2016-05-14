#include <stdarg.h>
#include <stdio.h>

void myfunc(const char *fmt, ...)
{
	va_list args;
	va_start(args, fmt);
	vprintf(fmt, args);
	va_end(args);
	return;
}

int main(int argc, char *argv[])
{
	myfunc("test 1: %s %s\n", "one", "two");
	myfunc("test 2: %s %d %c\n", "apple", 222, 'y');
	return 0;
}
