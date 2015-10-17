


template<typename T>
T hello(T a) {
	return a + 1;
}



int main()
{
	int a = 1;
	short b = 1;
	unsigned char c  = 3;

	hello(a);
	hello(b);
	hello(c);
}
