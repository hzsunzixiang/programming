
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

inline int rand_p(int m, int a, int c)
{
	return rseed = (rseed * a + c) % m;
}


int main()
{
	int i;
	srand(8);
	for (i = 0; i < 100; i++)
		printf("%d\t", rand_p(9, 4, 1));
	printf("\n");

	return 0;
}
