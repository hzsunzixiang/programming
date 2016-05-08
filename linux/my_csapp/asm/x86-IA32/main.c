

long int simple_l(long int *xp, long int y)
{
	long int t = *xp + y;
	*xp = t;
	return t;
}

int main()
{

	long int tmp = 0x111;
	long int *xp = &tmp;
	long int y = 0x222;
	simple_l(xp, y);
	
	return 0;
}

