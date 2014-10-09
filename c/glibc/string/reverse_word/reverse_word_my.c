


#include<stdlib.h>
#include<stdio.h>


void reverse(char *s, char *e);
void reverse_word(char *s);

int main()
{
		char s[] = "hello world and you ";
		printf("before reverse\n %s\n", s);
		reverse_word(s);
		printf("after reverse\n %s\n", s);

		 return 0;
}


void reverse_word(char *s1)
{
		char *a, *b, *c, *s;

		c = s = s1;

		// the start of the word

		while(*s)
		{
				if(*s != ' ')
				{
						a = c = s;
						// not space
						while(*c != ' ')
						{
								++c;
						}

						s = b = c - 1 ; 
						reverse(a, b);
						
				}

				s++;
		}

}
void reverse(char *s1, char *e1)
{
		int length ;
		int i=0;
		char tmp;
		char *t, *s, *e;
		s = s1;
		e = e1;

		if(e < s)
		{
				t = e;
				e = s;
				s = t;
		}
		
		length = e -s + 1 ;
		//printf("will be revese length %d\n", length);
		//for(i = 0 ; i<length; i++)
		//{
		//		printf("%c", *(s1 + i));
		//}

		//printf("\n");
		for(i=0 ; i < length/2; i++)
		{
				tmp = *e;
				*e = *s;
				*s = tmp;
				s++;
				e--;
		}
		
}








