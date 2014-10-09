#include<stdlib.h>
#include<stdio.h>
#include<string.h>



void itob(int a , char s[] , int b);
void reverse(char s[]);


int main()
{
	int x = -255;
	int i;
	char buffer[100];
    for(i = 2; i < 20; i++)	
	{
			itob(x, buffer, i);
			printf("base:%d\tvalue:%s\n", i, buffer );
	}

	return 0;

}

void itob(int a, char s1[], int b )
{
		int flag;
		char *s=s1;
		static char digits[] = "01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";


		if ( b < 2 || b>36) 
		{
				fprintf(stderr,"cant support base %d\n", b) ;
				exit(EXIT_FAILURE);
		}
		if(a < 0)
		{
				a = -a;
				flag = 1;
		}

		do
		{
				*s++ = digits[a % b];
				a = a / b;
		}while(a != 0 );
		if(flag  == 1)
		{
				*s++ = '-';
		}

		*s++ = '\0';
		printf("s:\t%s\n", s1 );
		reverse(s1);

}



void reverse(char s[]) {
		int c, i, j;
		for ( i = 0, j = strlen(s)-1; i < j; i++, j--) {
				c = s[i];
				s[i] = s[j];
				s[j] = c;
		}
}








