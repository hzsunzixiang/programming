



template <typename T> class List {

};

typedef struct {
	double x, y, z;
} Point;

typedef enum { red, green, blue } *ColorPtr;


	template <typename T>
void clear (T p)
{
	*p = 0; // requires that the unary * be applicable to T
	// error: invalid type argument of unary ‘*’ (have ‘int’)
}
int test_fun()
{
	int a = 10;
	//clear(a); // ERROR: int doesn't support the unary *
    return a;
}

int main()
{
	struct Association
	{
		int* p;
		int* q;
	};
	///  error: ‘Assocation’ was not declared in this scope

	//List<Assocation*> error1; // ERROR: local type in template argument

	//  error: ‘<anonymous enum>*’ is/uses anonymous type
	//List<ColorPtr> error2; // ERROR: unnamed type in template

	// argument
	List<Point> ok; // OK: unnamed class type named through
	(void)ok;
	// a typedef
	//test_fun();
}
