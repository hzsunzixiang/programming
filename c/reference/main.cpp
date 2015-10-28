



int main()
{
	int x = 11111;
	int *y = &x;
	*y = 33333;
	int &z = x;
	z = 22222;

	return 0;
}
