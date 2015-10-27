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
#include <string>
#include <cstdlib>
#include "stack4.hpp"

int main()
{
    try {
        Stack<int,200>         int200Stack;     // stack of up to 20 ints
        Stack<int,40>         int40Stack;     // stack of up to 40 ints
        Stack<std::string,40> stringStack;    // stack of up to 40 strings

        // manipulate stack of up to 20 ints
        int200Stack.push(7);
        std::cout << int200Stack.top() << std::endl;
        int200Stack.pop();

        // manipulate stack of up to 40 strings
        stringStack.push("hello");
        std::cout << stringStack.top() << std::endl; 
        stringStack.pop();
        stringStack.pop();
    }
    catch (std::exception const& ex) {
        std::cerr << "Exception: " << ex.what() << std::endl;
        return EXIT_FAILURE;  // exit program with ERROR status
    }
}
