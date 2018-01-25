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
#include "pow3.hpp"

int main() 
{
    std::cout << "Pow3<7>::result = " << Pow3<7>::result << '\n';
    std::cout << "Pow3<19>::result = " << Pow3<19>::result << '\n';
}


// 最多 19 次
// pow3.hpp:18: warning: overflow in constant expression
// pow3.hpp: In instantiation of ‘Pow3<67>’:
// pow3.hpp:18:   instantiated from ‘Pow3<68>’
// pow3.hpp:18:   instantiated from ‘Pow3<69>’
// pow3.hpp:18:   instantiated from ‘Pow3<70>’
// pow3.cpp:16:   instantiated from here

