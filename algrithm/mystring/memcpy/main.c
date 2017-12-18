/* memcpy example */
// http://www.cplusplus.com/reference/cstring/memcpy/
#include <stdio.h>
#include <string.h>

// Notes:
// 1) memcpy() doesn’t check for overflow or \0
// 2) memcpy() leads to problems when source and destination addresses overlap. 

struct Person{
	char name[40];
	int age;
};

int main ()
{
	char myname[] = "Pierre de Fermat";
	struct Person person, person_copy;
	/* using memcpy to copy string: */
	memset (person.name, '-', 40);

	// 这里 必须 +1 把 0 字符拷贝进去 不然 不会正常结束 
	memcpy ( person.name, myname, strlen(myname)+1 );
	//memcpy ( person.name, myname, strlen(myname));
	person.age = 46;

	/* using memcpy to copy structure: */
	memcpy ( &person_copy, &person, sizeof(person) );

	printf ("person_copy: %s, %d \n", person_copy.name, person_copy.age );

	return 0;
}
