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
#include <vector>
#include "stack8.hpp"



// https://stackoverflow.com/questions/21784913/invalid-argument-in-template-template-parameter?rq=1
//This is becuase, despite having default arguments, std::vector has 2 template arguments (template < class T, class Alloc = allocator<T> >). The following code works just fine:
// 由于这里的模板已经把第二个参数写进去了 所以没有这种问题，
// 参看statck7

int main()
{
    try {
        Stack<int>   intStack;       // stack of ints
        Stack<float> floatStack;     // stack of floats

        // manipulate int stack
        intStack.push(42);
        intStack.push(7);

        // manipulate float stack
        floatStack.push(7.7);

        // assign stacks of different type
        floatStack = intStack;

        // print float stack
        std::cout << floatStack.top() << std::endl;
        floatStack.pop();
        std::cout << floatStack.top() << std::endl;
        floatStack.pop();
        std::cout << floatStack.top() << std::endl;
        floatStack.pop();
    }
    catch (std::exception const& ex) {
        std::cerr << "Exception: " << ex.what() << std::endl;
    }

    // stack for ints using a vector as an internal container
    Stack<int,std::vector> vStack;
    //...
    vStack.push(42);
    vStack.push(7);
    std::cout << vStack.top() << std::endl;
    vStack.pop();
}
