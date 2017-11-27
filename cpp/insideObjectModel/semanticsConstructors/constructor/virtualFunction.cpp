
// Vtable for Foo
// Foo::_ZTV3Foo: 3u entries
// 0     (int (*)(...))0
// 8     (int (*)(...))(& _ZTI3Foo)
// 16    (int (*)(...))Foo::flip
// 
// Class Foo
//    size=24 align=8
//    base size=24 base align=8
// Foo (0x0x2b04fa990000) 0
//     vptr=((& Foo::_ZTV3Foo) + 16u)
class Foo
{
	public:
		//Foo() { }
        // 有虚函数的情况  编译器也会构造一个 
		// 1. 一个virtual function table会被编译器产生出来 内放 class的virtual function 地址
		// 2. 在每一个class object中 一个额外的vptr会被滨一起合成出来 内含相关的class vtbl的地址
		virtual void flip(){};
		int val;
		Foo *pnext;
};


int main()
{
	Foo foo;
	return 0;
}

// 有虚函数的情况  编译器也会构造一个
// (gdb) disass
// Dump of assembler code for function Foo::Foo():
// => 0x0000000000400622 <+0>:     push   %rbp
//    0x0000000000400623 <+1>:     mov    %rsp,%rbp
//    0x0000000000400626 <+4>:     mov    %rdi,-0x8(%rbp)
//    0x000000000040062a <+8>:     mov    -0x8(%rbp),%rax
//    0x000000000040062e <+12>:    movq   $0x4006f0,(%rax)     //  vptr 放入
//    0x0000000000400635 <+19>:    pop    %rbp
//    0x0000000000400636 <+20>:    retq   
// End of assembler dump.
// 


// 没有虚函数的情况  必须自己定义构造函数
// (gdb) disas
// Dump of assembler code for function Foo::Foo():
// => 0x0000000000400592 <+0>:     push   %rbp
//    0x0000000000400593 <+1>:     mov    %rsp,%rbp
//    0x0000000000400596 <+4>:     mov    %rdi,-0x8(%rbp)
//    0x000000000040059a <+8>:     pop    %rbp
//    0x000000000040059b <+9>:     retq   
// End of assembler dump.

