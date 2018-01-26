/* The following code example is taken from the book
 * "C++ Templates - The Complete Guide"
 * by David Vandevoorde and Nicolai M. Josuttis, Addison-Wesley, 2002
 *
 * (C) Copyright David Vandevoorde and Nicolai M. Josuttis 2002.
 * Permission to copy, use, modify, sell and distribute this software
 * is granted provided this copyright notice appears in all copies.
 * This software is provided "as is" without express or implied
 * warranty, and with no claim as to its suitability for any purpose.
 */
#include "rparam.hpp"
#include "rparamcls.hpp"

// 重点是参数传递 函数实现可以忽略
// function that allows parameter passing by value or by reference
template <typename T1, typename T2>
void foo_core (typename RParam<T1>::Type p1,
               typename RParam<T2>::Type p2)
{
	(void)p1;
	(void)p2;
    //...
}

// wrapper to avoid explicit template parameter passing
template <typename T1, typename T2>
inline
void foo (T1 const & p1, T2 const & p2) 
{
    foo_core<T1,T2>(p1,p2);
}

int main()
{
    MyClass1 mc1;
    MyClass2 mc2;
    foo(mc1,mc2);  // same as foo_core<MyClass1,MyClass2>(mc1,mc2)
}
