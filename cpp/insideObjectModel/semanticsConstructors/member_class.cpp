
//#include <iostream>
//using namespace std;


class Foo
{
	public:
		Foo() { }
		int val;
		Foo *pnext;
};

class Foo2
{
	public:
		Foo2() { }
		int val;
		Foo2 *pnext;
};
class Bar
{
	//1. 在没有构造函数的情况下 为了调用Foo的构造函数 合成了Bar的构造函数
	//2.  在已经有构造函数的情况下
	//    编译器会扩张已经存在的constructor 在其中安插一些代码使得 user code在被执行之前，先调用必要的 default constructor
		//(gdb) disassemble 
		//Dump of assembler code for function Bar::Bar(int):
		//	=> 0x00000000004005ea <+0>:     push   %rbp
		// .......
		// 0x0000000000400600 <+22>:    callq  0x4005ac <Foo::Foo()>
		// 0x0000000000400610 <+38>:    callq  0x4005b6 <Foo2::Foo2()>`
		////3. 如果有多个class member objects 都要求constructor初始化操作 要求以member objects 在class中的生命次序来调用各个 constructor

	public:
		// Bar()
		// {
		// }
		Bar(int x)
		{
			foo.val = x;
		}
		Bar(int x, int y)
		{
			foo.val = x + y;
		}
	public:
		Foo foo;  // Bar::foo 必须在此处初始化
		Foo2 foo2;  // Bar::foo 必须在此处初始化
		char *str;  // 将 str初始化是程序员的责任
};

void foo_bar()
{
	Bar bar(1);
	// 程序如果有需要  是程序员的责任
	if (bar.str)
	{
	}
}

int main()
{
	//call	_ZN3BarC1Ev
	//.set	_ZN3BarC1Ev,_ZN3BarC2Ev
	// 如果定义了 带参数的 编译器就不会再合成不带参数的 调用无参构造 将报错
	//   error: no matching function for call to ‘Bar::Bar()’
	//Bar bar;
	Bar bar(10);
}

// gdb 用si跟进  调用Foo::Foo()
// Dump of assembler code for function Bar::Bar():
// => 0x00000000004005b2 <+0>:     push   %rbp
//    0x00000000004005b3 <+1>:     mov    %rsp,%rbp
//    0x00000000004005b6 <+4>:     sub    $0x10,%rsp
//    0x00000000004005ba <+8>:     mov    %rdi,-0x8(%rbp)
//    0x00000000004005be <+12>:    mov    -0x8(%rbp),%rax
//    0x00000000004005c2 <+16>:    mov    %rax,%rdi
//    0x00000000004005c5 <+19>:    callq  0x4005a8 <Foo::Foo()>
//    0x00000000004005ca <+24>:    leaveq 
//    0x00000000004005cb <+25>:    retq   

//(gdb) disassemble 
//Dump of assembler code for function Bar::Bar(int):
//	=> 0x00000000004005ea <+0>:     push   %rbp
//	      0x00000000004005eb <+1>:     mov    %rsp,%rbp
//	      0x00000000004005ee <+4>:     sub    $0x10,%rsp
//	      0x00000000004005f2 <+8>:     mov    %rdi,-0x8(%rbp)
//	      0x00000000004005f6 <+12>:    mov    %esi,-0xc(%rbp)
//	      0x00000000004005f9 <+15>:    mov    -0x8(%rbp),%rax
//	      0x00000000004005fd <+19>:    mov    %rax,%rdi
//	      0x0000000000400600 <+22>:    callq  0x4005ac <Foo::Foo()>
//	      0x0000000000400605 <+27>:    mov    -0x8(%rbp),%rax
//	      0x0000000000400609 <+31>:    add    $0x10,%rax
//	      0x000000000040060d <+35>:    mov    %rax,%rdi
//	      0x0000000000400610 <+38>:    callq  0x4005b6 <Foo2::Foo2()>
//	      0x0000000000400615 <+43>:    mov    -0x8(%rbp),%rax
//	      0x0000000000400619 <+47>:    mov    -0xc(%rbp),%edx
//	      0x000000000040061c <+50>:    mov    %edx,(%rax)
//	      0x000000000040061e <+52>:    leaveq 
//	      0x000000000040061f <+53>:    retq   

