
#include <list>
#include <vector>



template<bool B>
class Invert
{
	public:
		static bool const result = !B;
			
};
void g()
{
	bool test = Invert<(1>0)>::result;
	(void)test;
	// If the parentheses in B<(1>0)> were omitted, the "larger than" symbol would be mistaken for the closing of the
	// template argument list. This would make the code invalid because the compiler would read it to be equivalent to
	// ((B<1>))0>::result
	bool test1 = Invert<(1>0)>::result;
	(void)test1;
}
int main()
{

	return 0;
}

