

#include <stdio.h>

void reverse(char *s);

int main()
{

		char s[100]="hello,world";

		printf("before reverse:%s\n", s);
		reverse(s);
		printf("after reverse:%s\n", s);

		return 0;
}


void reverse(char *s)
{
		char *a, *b, c;
		int i, length;
		a=b=s;
		while(*b)
		{
				b++;
		}

		// the length of string
		length=b-a;
		printf("length:%d\n",length);

		// the end of string
		--b;
		for(i=0; i<length/2; i++)
		{
				c = *b;
				*b = *a;
				*a = c;
				a++;
				b--;
		}

		// find the end
}
