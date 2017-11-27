/* memcpy example */
// http://www.cplusplus.com/reference/cstring/memcpy/
#include <stdio.h>
#include <string.h>



int cont_str(char *str)
{
	int i = 0;      
	//while ( str[i] != '\0')

	// while (str[i])
	// {
	// 	i++;
	// }
	for(i=0; str[i]; i++);
	return i;
}


int main()
{
	char * str = "hello,world";
	char str1[] = {'\0'};
	printf("%d, %d\n", cont_str(str), cont_str(str1));
	printf("%ld, %ld\n", strlen(str), strlen(str1));

	return 0;
}
