#include <stdio.h>
int gotodiff(int x, int y) {
	//int result;
	if (x >= y)
		goto x_ge_y;
	return y - x;
x_ge_y:
	return  x - y;
}


int main()
{
	int x = 1, y = -10;
	int c = gotodiff(x, y);
	printf("c= %d\n", c);
	return 0;
}
