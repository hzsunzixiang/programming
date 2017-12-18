


//http://www.geeksforgeeks.org/memcpy-in-cc/

// Notes:
// 1) memcpy() doesn’t check for overflow or \0
// 2) memcpy() leads to problems when source and destination addresses overlap. 

/* A C program to demonstrate working of memcpy */
#include <stdio.h>
#include <string.h>

int main ()
{
	char str1[] = "Geeks";  
	char str2[] = "Quiz";  

	puts("str1 before memcpy ");
	puts(str1);

	/* Copies contents of str2 to sr1 */
	memcpy (str1, str2, sizeof(str2));   // 注意这里是sizeof 是有 0 字符长度的
	//memcpy (str1, str2, strlen(str2));   // 如果用strlen 则是不正确的

	puts("\nstr1 after memcpy ");
	puts(str1);

	return 0;
}
