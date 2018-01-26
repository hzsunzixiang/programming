
#include <iostream>
using namespace std;

template<int N> int g() 
{ 
	cout << "in template<int N> int g()" << endl;
	return N; 
}
template<int* P> int g()
{ 
	cout << "in template<int* P> int g()" << endl;
	return *P; 
}

int x ;
int main()
{
	//SFINAE_right.cpp:10:22: note:   template argument deduction/substitution failed:
	//SFINAE_right.cpp:19:8: error: ‘& x’ is not a valid template argument of type ‘int*’ because ‘x’ does not have external linkage
    // x 必须要有外部链接 否则报错
	// int x;

	g<1>(); // 1 cannot be bound to int* parameter,
	g<&x>(); 
	return 0;

} // but SFINAE principle applies
