

#include <iostream>
using namespace std;

//template<int I> void f(int (&)[24/(4-I)])
//{
//}

// SFINAE_error.cpp:6:22: error: size of array is not an integral constant-expression
//  template<int I> void f(int (&)[24/(4-I)])
//                       ^
// SFINAE_error.cpp:6:40: error: size of array is not an integral constant-expression
//  template<int I> void f(int (&)[24/(4-I)])
//                                         ^
// SFINAE_error.cpp: In function ‘int main()’:
// SFINAE_error.cpp:12:7: error: statement cannot resolve address of overloaded function
//   &f<4>; // ERROR: division by zero (SFINAE doesn't apply)

template<int I> void f(int (&)[24/(4+I)])
{
}
int main()
{
	&f<4>; // ERROR: division by zero (SFINAE doesn't apply)
}

