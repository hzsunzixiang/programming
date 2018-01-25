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
#include "sqrt1.hpp"

int main()
{
    std::cout << "Sqrt<16>::result = " << Sqrt<16>::result << '\n';
    std::cout << "Sqrt<25>::result = " << Sqrt<25>::result << '\n';
    std::cout << "Sqrt<42>::result = " << Sqrt<42>::result << '\n';
    std::cout << "Sqrt<1>::result =  " << Sqrt<1>::result << '\n';
    std::cout << "Sqrt<1>::result =  " << Sqrt<600>::result << '\n';
}


// https://stackoverflow.com/questions/29685367/reasoning-behind-enumeral-and-non-enumeral-type-in-conditional-expression
// -Wno-enum-compare 可以避免下面的警告
// sqrt1.hpp:22:33: warning: enumeral mismatch in conditional expression: ‘Sqrt<42, 40, 40>::<anonymous enum>’ vs ‘Sqrt<42, 41, 42>::<anonymous enum>’ [-Wenum-compare]
// sqrt1.hpp: In instantiation of ‘class Sqrt<42, 37, 42>’:
// sqrt1.hpp:22:33:   recursively required from ‘class Sqrt<42, 22, 42>’
// sqrt1.hpp:22:33:   required from ‘class Sqrt<42>’
// sqrt1.cpp:20:51:   required from here


