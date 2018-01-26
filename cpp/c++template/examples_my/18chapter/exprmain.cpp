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
#include "exprops1.hpp"
#include "exprscalar.hpp"
#include "exprarray.hpp"
#include "exprops2.hpp"
#include <iostream>

template <typename T>
void print (T const& c)
{
    for (int i=0; i<8; ++i) {
        std::cout << c[i] << ' ';
    }
    std::cout << "..." << std::endl;
}


// 分析之后 会发现少了很多copy
int main()
{
    Array<double> x(1000), y(1000);

    // initialize arrays with some values
    for (int i=0; i<1000; ++i) {
        x[i] = i;
        y[i] = x[i]+x[i];
    }
    //...
    
    std::cout << "x: ";
    print(x);

    std::cout << "y: ";
    print(y);

    x = 1.2 * x;
    std::cout << "x = 1.2 * x: ";
    print(x);

    x = 1.2*x + x*y;
    std::cout << "1.2*x + x*y: ";
    print(x);

    x = y;
    std::cout << "after x = y: ";
    print(x);
}


// constructor
// constructor an array no calc
// constructor
// constructor an array no calc
// x: 0 1 2 3 4 5 6 7 ...
// y: 0 2 4 6 8 10 12 14 ...
// Rep constructor an array no calc
// operator= an array need calc diffrent
// deconstructor an array no calc
// x = 1.2 * x: 0 1.2 2.4 3.6 4.8 6 7.2 8.4 ...
// Rep constructor an array no calc    1.2*x
// Rep constructor an array no calc    x*y
// Rep constructor an array no calc    x = 1.2*x + x*y;
// operator= an array need calc diffrent
// deconstructor an array no calc
// deconstructor an array no calc
// deconstructor an array no calc
// 1.2*x + x*y: 0 3.84 12.48 25.92 44.16 67.2 95.04 127.68 ...
// operator= an array need calc
// after x = y: 0 2 4 6 8 10 12 14 ...
// deconstructor an array no calc
// deconstructor
// deconstructor an array no calc
// deconstructor

