
//#include <iostream>
//using namespace std;


class Foo
{
	public:
		// 	call	_ZN3FooC1Ev
		Foo() { }
	    //// 没有成员class 没有继承  没有虚函数 没有虚基类  
		// 此时没有合成 自己的copy构造函数
		// 除非自己定义
	    // call	_ZN3FooC1ERKS_
	    Foo(Foo const& foo) {}
		// (gdb) disas
		// Dump of assembler code for function Foo::Foo(Foo const&):
		//    0x00000000004005ae <+0>:     push   %rbp
		// => 0x00000000004005af <+1>:     mov    %rsp,%rbp
		//    0x00000000004005b2 <+4>:     mov    %rdi,-0x8(%rbp)
		//    0x00000000004005b6 <+8>:     mov    %rsi,-0x10(%rbp)
		//    0x00000000004005ba <+12>:    pop    %rbp
		//    0x00000000004005bb <+13>:    retq   
		

        // trivial.cpp:17:17: error: invalid constructor; you probably meant ‘Foo (const Foo&)’
	    // Foo(Foo foo) {}

		int val;
		Foo *pnext;
};

// 要么都不提供 要么都提供?
// 提供构造函数 但是不提供 拷贝构造 也不报错
// 提供了拷贝构造函数 但是不提供 构造函数 报错
// 
// StephenSun@debian-1:~/programming/cpp/insideObjectModel/semanticsConstructors/copyConstructor$ make 
// g++ -Wall -g --save-temps -fdump-class-hierarchy   trivial.cpp -lm -o trivial
// trivial.cpp: In function ‘int main()’:
// trivial.cpp:23:6: error: no matching function for call to ‘Foo::Foo()’
//   Foo foo;
//       ^
// trivial.cpp:23:6: note: candidate is:
// trivial.cpp:16:6: note: Foo::Foo(const Foo&)
//       Foo(Foo const& foo) {}
//       ^
// trivial.cpp:16:6: note:   candidate expects 1 argument, 0 provided
int main()
{
	Foo foo;
	// 提供了拷贝构造函数 但是不提供 构造函数 报错
	Foo foo1(foo);
}

