template <typename T, T nontype_param>
class C
{
};

int a;

class X {
	public:
		int n;
		static bool b;
};

// an example of a pointer-to-member constant
template<typename T>
void templ_func()
{
}

int main()
{
	C<int, 33>* c1; // integer type
	C<int*, &a>* c2; // address of an external variable
	void f();
	void f(int);

	// name of a function: overload resolution selects
	// f(int) in this case; the & is implied
	C<void (*)(int), &f>* c3;

	C<bool&, X::b>* c4; // static class members are acceptable variable

	// and function names 指向成员的指针常量
	C<int X::*, &X::n>* c5;


	// function template instantiations are functions too
	C<void (*)(), &templ_func<double> >* c6;



	(void)c1, (void)c2, (void)c3, (void)c4, (void)c5, (void)c6; 

	return 0;
}
