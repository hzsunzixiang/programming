#include <typeinfo>
#include <iostream>


template< typename T >
struct A
{
	static void foo(){ std::cout<< "value" << std::endl; }
};

template< typename T >
struct A< T&>
{
	static void foo(){ std::cout<< "reference" << std::endl; }
};

float& bar()
{
	static float t=5.5;
	return t;
}

int main()
{
	auto a3 = bar();

	A<decltype(bar())>::foo();//notice the result 
	A<decltype(a3)>::foo();//notice the result
	return 0;
}
