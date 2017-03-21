int rfact(int x)
{
	int rval;
	if (x <= 1)
		return 1;
	rval = rfact(x-1);
	return rval * x;
}

int main()
{
	rfact(5);
	return 0;
}
