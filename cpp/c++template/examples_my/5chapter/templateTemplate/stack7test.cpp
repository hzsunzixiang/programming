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
// gcc 4.9.2不支持 必须加选项-std=c++11
// CFLAGS=-Wall -g -std=c++11 -W -Wall -pedantic
#include <iostream>
#include <string>
#include <cstdlib>
#include <vector>
#include "stack7.hpp"



// https://stackoverflow.com/questions/21784913/invalid-argument-in-template-template-parameter?rq=1
// 刚开始编译不过的原因
//This is becuase, despite having default arguments, std::vector has 2 template arguments (template < class T, class Alloc = allocator<T> >). The following code works just fine:

//#include <vector>
//
//template <typename T, template <typename> class Cont>
//class Stack {
//	    //...
//	  private:
//		      Cont<T> s_;
//};
//
//template <typename T>
//using my_vector = std::vector<T>;
//
//
//int main(){
//	    Stack<int,my_vector> aStack1;
//
//}

// Template Template Argument Matching
// If you try to use the new version of Stack, you get an error message saying that the default valuset d::deque is not
// compatible with the template template parameter CONT. The problem is that a template template argument must be
// a template with parameters that exactly match the parameters of the template template parameter it substitutes.
// Default template arguments of template template arguments are not considered, so that a match cannot be achieved
// by leaving out arguments that have default values.
// The problem in this example is that the std::deque template of the standard library has more than one parameter:
// The second parameter (which describes a so-called allocator) has a default value, but this is not considered when
// matching std::deque to the CONT parameter.

template <typename T>
using my_vector = std::vector<T>;

int main()
{
    try {


        Stack<int, my_vector>   intStack;       // stack of ints
        Stack<float, my_vector> floatStack;     // stack of floats

        //// manipulate int stack
        intStack.push(42);
        intStack.push(7);

        std::cout << intStack.top() << std::endl;

        //// manipulate float stack
        floatStack.push(7.7);

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
    Stack<int, my_vector> vStack;
    //...
    vStack.push(42);
    vStack.push(7);
    std::cout << vStack.top() << std::endl;
    vStack.pop();
}
