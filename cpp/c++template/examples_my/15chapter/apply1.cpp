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
#include <iostream>
#include "apply1.hpp"

void incr (int& a) 
{ 
    ++a; 
}

void print (int a) 
{
    std::cout << a << std::endl;
}

int main()
{
    int x = 7;
    apply (x, print);
    //apply (x, incr);
}


// apply1.cpp: In function ‘int main()’:
// apply1.cpp:28:19: error: no matching function for call to ‘apply(int&, void (&)(int&))’
//      apply (x, incr);
//                    ^
// apply1.cpp:28:19: note: candidate is:
// In file included from apply1.cpp:12:0:
// apply1.hpp:12:6: note: template<class T> void apply(T&, void (*)(T))
//  void apply (T& arg, void (*func)(T))
//       ^
// apply1.hpp:12:6: note:   template argument deduction/substitution failed:
// apply1.cpp:28:19: note:   deduced conflicting types for parameter ‘T’ (‘int’ and ‘int&’)
//      apply (x, incr);
//                    ^
// Makefile:8: recipe for target 'apply1' failed

// template <typename T>
// void apply (T& arg, void (*func)(T))
// {
//     func(arg);
// }




