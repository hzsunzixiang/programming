#include <stdio.h>

#include <iostream>
using namespace std;

int main()
{
	string test;
	test.clear();
	const char *testc = test.c_str();
	if (*testc == '\0')
	{
		printf("testc:%s  == \\0", testc);
	}
	else
	{
		printf("testc:%s", testc);
	}
	return 0;
}
