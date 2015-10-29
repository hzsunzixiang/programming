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
#include <typeinfo>

void foo()
{
    std::cout << "foo() called" << std::endl;
}
     
typedef void FooT();  // FooT is a function type,
                      // the same type as that of function foo()

int main()
{
	//  call	_Z3foov   # 直接调用函数
    foo();           // direct call

    // print types of foo and FooT
    std::cout << "Types of foo:  " << typeid(foo).name()
              << '\n';
    std::cout << "Types of FooT: " << typeid(FooT).name()
              << '\n';

    FooT* pf = foo;  // implicit conversion (decay)
    FooT& rf = foo;  // no implicit conversion


	// 可见函数指针  和 函数引用 实现基本一样
	// movq	$_Z3foov, -24(%rbp)  # 存放pf
	// movq	$_Z3foov, -32(%rbp)  # 存放rf
	// movq	-24(%rbp), %rax
	// call	*%rax
	// movq	-24(%rbp), %rax
	// call	*%rax
	// movq	-32(%rbp), %rax
	// call	*%rax

    pf();            // indirect call through pointer
    (*pf)();         // equivalent to pf()
    rf();            // indirect call through reference

	// 但是下面两个输出并不一样
	// 编译期决定
	// movl	$_ZTIPFvvE, %edi
	// movl	$_ZTIFvvE, %edi
    // print type of pf
    std::cout << "Types of pf:   " << typeid(pf).name()
              << '\n';


    // print type of rf
    std::cout << "Types of rf:   " << typeid(rf).name()
              << '\n';
}
