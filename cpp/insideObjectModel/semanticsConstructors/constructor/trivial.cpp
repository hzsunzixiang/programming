
//#include <iostream>
//using namespace std;


class Foo
{
	public:
		// 	call	_ZN3FooC1Ev
		//Foo()
		//{
		//}
	    // 没有成员class 没有继承  没有虚函数 没有虚基类  
		// 此时没有合成 自己的构造函数
		// 除非自己定义
		int val;
		Foo *pnext;
};

void foo_bar()
{
	Foo bar;
	// 程序如果有需要  是程序员的责任
	if (bar.val || bar.pnext)
	{
	}
}

int main()
{
	Foo foo;
	//foo_bar();
}


// (gdb) disassemble 
// Dump of assembler code for function Foo::Foo():
// => 0x000000000040073e <+0>:     push   %rbp
//    0x000000000040073f <+1>:     mov    %rsp,%rbp
//    0x0000000000400742 <+4>:     mov    %rdi,-0x8(%rbp)
//    0x0000000000400746 <+8>:     pop    %rbp
//    0x0000000000400747 <+9>:     retq   
// End of assembler dump.

// _ZN3FooC2Ev:
// 	.size	_ZN3FooC2Ev, .-_ZN3FooC2Ev
// 	.weak	_ZN3FooC1Ev
// 	.set	_ZN3FooC1Ev,_ZN3FooC2Ev
// 	call	_ZN3FooC1Ev
