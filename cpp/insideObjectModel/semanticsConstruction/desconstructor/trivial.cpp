
//#include <iostream>
//using namespace std;


class Foo
{
	public:
		Foo() { }
	    // 没有成员class 没有继承.  虚函数和虚基类也不会合成析构函数
		int val;
		Foo *pnext;

		// 此时没有合成 自己的析构函数
		// 除非自己定义
		~Foo() { }
		// 构造和析构时独立的 没有构造函数一样可以有析构函数
		// .set	_ZN3FooD1Ev,_ZN3FooD2Ev
		// call	_ZN3FooD1Ev
};

int main()
{
	Foo foo;
	return 0;
}

// 只有析构函数 没有构造函数的时候
// (gdb) disas
// Dump of assembler code for function main():
//    0x0000000000400576 <+0>:     push   %rbp
//    0x0000000000400577 <+1>:     mov    %rsp,%rbp
//    0x000000000040057a <+4>:     sub    $0x10,%rsp
//    0x000000000040057e <+8>:     lea    -0x10(%rbp),%rax
// => 0x0000000000400582 <+12>:    mov    %rax,%rdi
//    0x0000000000400585 <+15>:    callq  0x400592 <Foo::~Foo()>
//    0x000000000040058a <+20>:    mov    $0x0,%eax
//    0x000000000040058f <+25>:    leaveq 
//    0x0000000000400590 <+26>:    retq   
// End of assembler dump.
// 

// 同时有构造和析构函数
// (gdb) disas
// Dump of assembler code for function main():
//    0x0000000000400576 <+0>:     push   %rbp
//    0x0000000000400577 <+1>:     mov    %rsp,%rbp
//    0x000000000040057a <+4>:     push   %rbx
//    0x000000000040057b <+5>:     sub    $0x18,%rsp
// => 0x000000000040057f <+9>:     lea    -0x20(%rbp),%rax
//    0x0000000000400583 <+13>:    mov    %rax,%rdi
//    0x0000000000400586 <+16>:    callq  0x4005a6 <Foo::Foo()>
//    0x000000000040058b <+21>:    mov    $0x0,%ebx
//    0x0000000000400590 <+26>:    lea    -0x20(%rbp),%rax
//    0x0000000000400594 <+30>:    mov    %rax,%rdi
//    0x0000000000400597 <+33>:    callq  0x4005b0 <Foo::~Foo()>
//    0x000000000040059c <+38>:    mov    %ebx,%eax
//    0x000000000040059e <+40>:    add    $0x18,%rsp
//    0x00000000004005a2 <+44>:    pop    %rbx
//    0x00000000004005a3 <+45>:    pop    %rbp
//    0x00000000004005a4 <+46>:    retq   
// End of assembler dump.

