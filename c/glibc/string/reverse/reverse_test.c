//http://www.programmingsimplified.com/c/source-code/reverse-words-in-string


#include <stdio.h>
#include <string.h>


int string_length(char*);
void reverse(char*);

main() 
{
		char string[100];

		printf("Enter a string\n");
		gets(string);

		reverse(string);

		printf("Reverse of entered string is \"%s\".\n", string);

		return 0;
}

void reverse(char *string) 
{
		int length, c;
		char *begin, *end, temp;

		length = string_length(string);

		begin = string;
		end = string;

		for ( c = 0 ; c < ( length - 1 ) ; c++ )
				end++;

		for ( c = 0 ; c < length/2 ; c++ ) 
		{        
				temp = *end;
				*end = *begin;
				*begin = temp;

				begin++;
				end--;
		}
}

int string_length(char *pointer)
{
		int c = 0;

		while( *(pointer+c) != '\0' )
				c++;

		return c;
}

/*
 * Function to reverse a word.
 */

void reverse_string(char *t) {
		int l, c;
		char *e, s;

		l = strlen(t);
		e = t + l - 1;

		for (c = 0; c < l/2; c++) {
				s  = *t;
				*t = *e;
				*e = s;
				t++;
				e--;
		}
}
