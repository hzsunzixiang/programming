#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

struct m1
{
	int i;
	short s;
};

struct m2
{
	short s;
	int i;
};

struct m3
{
	long l;
	short s;
	int i;
};

struct m4
{
	short s;
	long l;
	int i;
};

int main(void)
{

	printf("sizeof(m1):%ld \t sizeof(m2):%ld\n", sizeof(struct m1), sizeof(struct m2));
	printf("sizeof(m3):%ld \t sizeof(m4):%ld\n", sizeof(struct m3), sizeof(struct m4));

	return 0;
}

// sizeof(m1):8     sizeof(m2):8
// sizeof(m3):16    sizeof(m4):24



