#include <stdio.h>
int main (void)
{
	int i = 1;

	void* the_label_pointer = &&the_label;
	void* that_label_pointer = &&that_label;


	if (--i)
		goto *the_label_pointer;
	else
		goto *that_label_pointer;

the_label:
	printf("in the_label\n");
	goto done;
that_label:
	printf("in that_label\n");
	
done:

	return 0;
}
