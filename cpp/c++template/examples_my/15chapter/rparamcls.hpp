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
#include "rparam.hpp"

class MyClass1 {
  public:
    MyClass1 () {
    }
    MyClass1 (MyClass1 const&) {
        std::cout << "MyClass1 copy constructor called\n";
    }
};

class MyClass2 {
  public:
    MyClass2 () {
    }
    MyClass2 (MyClass2 const&) {
        std::cout << "MyClass2 copy constructor called\n";
    }
};

// 下面上一个特化
// pass MyClass2 objects with RParam<> by value
// 对于RParam<> 的MyClass2参数 已传值的方式进行传递
template<>
class RParam<MyClass2> {
  public:
    typedef MyClass2 Type;
};

// template<typename T>
// class RParam {
//   public:
//     typedef typename IfThenElse<IsClassT<T>::No, T, T const&>::ResultT Type;
// };
