#include <stdio.h>
#include <string>
#include <stdlib.h>
using namespace std;
int main()
{
		std::string  str("2030300 This is test");
		//char *ptr;
		long ret;

		ret = strtoul(str.c_str(), NULL, 10);
		printf("The number(unsigned long integer) is %lu\n", ret);
		//printf("String part is |%s|", ptr);

		return(0);
}
