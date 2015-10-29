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

    FooT* pf = foo;  // implicit conversion (decay)


	// movq	$_Z3foov, -8(%rbp)
	// movq	-8(%rbp), %rax
	// call	*%rax
	// movq	-8(%rbp), %rax
	// call	*%rax
	// movq	-8(%rbp), %rax
	// call	*%rax
	// movq	-8(%rbp), %rax
	// call	*%rax
	// movq	-8(%rbp), %rax
	// call	*%rax
	// movq	-8(%rbp), %rax
	// call	*%rax

	// 在汇编层面上是一样的
    pf();            // indirect call through pointer
    (*pf)();         // equivalent to pf()
    (**pf)();         // equivalent to pf()
    (***pf)();         // equivalent to pf()
    (****pf)();         // equivalent to pf()
    (*****pf)();         // equivalent to pf()
}
