
//#include <iostream>
//using namespace std;


class Foo
{
	public:
		//Foo()
		//{
		//}
	    // 有虚函数 编译器合成 
		virtual void test(){};
		int val;
		Foo *pnext;
};

int main()
{
	Foo foo;
	// 有虚函数的时候 合成一个拷贝构造函数
	// Dump of assembler code for function Foo::Foo(Foo const&):
	Foo foo1(foo);
}

// 编译器合成的构造函数 和拷贝构造函数 分别如下  gdb查看 直接看汇编 不直观
// (gdb) disassemble 
// Dump of assembler code for function Foo::Foo():
// => 0x000000000040063e <+0>:     push   %rbp
//    0x000000000040063f <+1>:     mov    %rsp,%rbp
//    0x0000000000400642 <+4>:     mov    %rdi,-0x8(%rbp)
//    0x0000000000400646 <+8>:     mov    -0x8(%rbp),%rax
//    0x000000000040064a <+12>:    movq   $0x400730,(%rax)
//    0x0000000000400651 <+19>:    pop    %rbp
//    0x0000000000400652 <+20>:    retq   
// End of assembler dump.

// _ZN3FooC2Ev:
// .LFB3:
// 	.loc 1 6 0
// 	.cfi_startproc
// 	pushq	%rbp
// 	.cfi_def_cfa_offset 16
// 	.cfi_offset 6, -16
// 	movq	%rsp, %rbp
// 	.cfi_def_cfa_register 6
// 	movq	%rdi, -8(%rbp)

// (gdb) disassemble 
// Dump of assembler code for function Foo::Foo(Foo const&):
// => 0x0000000000400654 <+0>:     push   %rbp
//    0x0000000000400655 <+1>:     mov    %rsp,%rbp
//    0x0000000000400658 <+4>:     mov    %rdi,-0x8(%rbp)
//    0x000000000040065c <+8>:     mov    %rsi,-0x10(%rbp)
//    0x0000000000400660 <+12>:    mov    -0x8(%rbp),%rax
//    0x0000000000400664 <+16>:    movq   $0x400730,(%rax)
//    0x000000000040066b <+23>:    mov    -0x10(%rbp),%rax
//    0x000000000040066f <+27>:    mov    0x8(%rax),%edx
//    0x0000000000400672 <+30>:    mov    -0x8(%rbp),%rax
//    0x0000000000400676 <+34>:    mov    %edx,0x8(%rax)
//    0x0000000000400679 <+37>:    mov    -0x10(%rbp),%rax
//    0x000000000040067d <+41>:    mov    0x10(%rax),%rdx
//    0x0000000000400681 <+45>:    mov    -0x8(%rbp),%rax
//    0x0000000000400685 <+49>:    mov    %rdx,0x10(%rax)
//    0x0000000000400689 <+53>:    pop    %rbp
//    0x000000000040068a <+54>:    retq   
// End of assembler dump.

