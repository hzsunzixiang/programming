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
#include "sqrt3.hpp"

int main() 
{
    std::cout << "Sqrt<16>::result = " << Sqrt<16>::result << std::endl;
    std::cout << "Sqrt<25>::result = " << Sqrt<25>::result << std::endl;
    std::cout << "Sqrt<42>::result = " << Sqrt<42>::result << std::endl;
    std::cout << "Sqrt<1>::result =  " << Sqrt<1>::result << std::endl;
    std::cout << "Sqrt<900>::result =  " << Sqrt<900>::result << std::endl;
}



// g++ -Wall -g -std=c++11 -W -Wall -pedantic -Wno-enum-compare    sqrt3.cpp -o sqrt3
// In file included from sqrt3.cpp:12:0:
// sqrt3.hpp:18:29: error: template instantiation depth exceeds maximum of 900 (use -ftemplate-depth= to increase the maximum) instantiating ‘class Sqrt<9999, 901>’
//      enum { result = (I*I<N) ? Sqrt<N,I+1>::result
//                              ^
// sqrt3.hpp:18:29:   recursively required from ‘class Sqrt<9999, 2>’
// sqrt3.hpp:18:29:   required from ‘class Sqrt<9999>’
// sqrt3.cpp:20:53:   required from here
// 
// sqrt3.hpp:18:29: error: incomplete type ‘Sqrt<9999, 901>’ used in nested name specifier
// Makefile:8: recipe for target 'sqrt3' failed

