#include<stdio.h>

static int i = 0;


void a_add(int *k);
void c_add(int *k)
{
	(*k)++;
} 

int main(void)
{    
	a_add(&i);
	printf("%d\n",i);

	return 0;
}
