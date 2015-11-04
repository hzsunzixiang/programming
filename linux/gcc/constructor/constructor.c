#include <stdio.h>
#include <stdlib.h>

//struct Foo {
//	Foo() {
//		printf("foo\n"); 
//	} 
//};
//static struct Foo foo;



// https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#Common-Function-Attributes
//constructor (priority)
//destructor (priority)
//    The constructor attribute causes the function to be called automatically before execution enters main (). Similarly, the destructor attribute causes the function to be called automatically after main () completes or exit () is called. Functions with these attributes are useful for initializing data that is used implicitly during the execution of the program.
//
//    You may provide an optional integer priority to control the order in which constructor and destructor functions are run. A constructor with a smaller priority number runs before a constructor with a larger priority number; the opposite relationship holds for destructors. So, if you have a constructor that allocates a resource and a destructor that deallocates the same resource, both functions typically have the same priority. The priorities for constructor and destructor functions are the same as those specified for namespace-scope C++ objects (see C++ Attributes).
//
//    These attributes are not currently implemented for Objective-C.
static void _hello() 
{
	printf("in_hellofun\n"); 
}

__attribute__((constructor)) static void _bar() 
{
	printf("inbarfun\n"); 
}

__attribute__((destructor)) static void _foo() 
{
	printf("infoofun\n"); 
}
int main()
{

	printf("in main\n");
	_hello();
	return 0;
}
