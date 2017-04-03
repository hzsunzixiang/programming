
//https://en.wikipedia.org/wiki/Linear_congruential_generator

#include <stdio.h>

int rand();
int rseed = 0;

inline void srand(int x)
{
	rseed = x;
}

inline int rand()
{
	//return rseed = (rseed * 4 + 1) % 9;
	return rseed = (rseed * 4 + 1) % 9;
}


int main()
{
	int i;
	for (i = 0; i < 100; i++)
		printf("%d\t", rand());
	printf("%d\n", rand());

	return 0;
}
