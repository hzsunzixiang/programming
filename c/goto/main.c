#include <stdio.h>

int main ()
{
	/* local variable definition */
	int a = 1;
	if(a == 10)
		goto done;
	
	printf("done here 0,\n");

done:
	 printf("done here 1,\n");


printf("done here 2,\n");
	 return 0;
}
