
#include <stdio.h>


void str_cat(char *s, char const *t);
int main()
{
		char s[50] = "hello,world";
		char t[50] = ",and,very good!";
		printf("before str_cat:\n%s\n", s);
		str_cat(s, t);
		printf("after str_cat:\n%s\n", s);
		return 0;
}

void str_cat(char *s, char const *t)
{
		while(*s)  // *s not s
		{
				++s;
		}
		//while(*s++ = *t++);
		while( (*s++ = *t++) != 0 );
}


