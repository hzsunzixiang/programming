
// C program to reverse a string using recursion
# include <stdio.h>

/* Function to print reverse of the passed string */
void reverse(char *str)
{
	if (*str)
	{
		reverse(str + 1);
		printf("%c", *str);
	}
}

int strlen_r(char *s)
{
	if (*s == '\0') return 0;
	else return(1 + strlen_r(s+1));
}
/* Driver program to test above function */
int main()
{
	char a[] = "Geeks for Geeks";
	reverse(a);
	printf("\nlength:%d\n", strlen_r(a));
	return 0;
}
