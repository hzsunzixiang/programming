#include<cstdio>


class Foo
{
	public:
		Foo() 
		{
			printf("Foo constructor\n");
		}
		int val;
		Foo *pnext;
		~Foo()
		{ 
			printf("Foo deconstructor\n");
		}
};

class Foo2
{
	public:
		Foo2()
		{ 
			printf("Foo2 constructor\n");
		}
		~Foo2()
		{ 
			printf("Foo2 deconstructor\n");
		}
		int val;
		Foo2 *pnext;
};
class Bar
{
	//1. 在没有析构函数的情况下 为了调用Foo的析构函数 合成了Bar的构造函数
	//2.  在已经有析构函数的情况下
	//    编译器会扩张已经存在的deconstructor 先调用必要的 default deconstructor
	//3. 如果有多个class member objects 都要求constructor初始化操作 要求以member objects 在class中的生命次序反方向来调用各个 deconstructor

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
		Foo2 foo2;  // Bar::foo2 必须在此处初始化
		char *str;  // 将 str初始化是程序员的责任
};

int main()
{
	// 只要其中一个成员 有析构函数 就需要合成自己的析构函数
	Bar bar(10);
	//Foo foo;
}

//(gdb) disas
//Dump of assembler code for function main():
//	   0x00000000004006c6 <+0>:     push   %rbp
//	      0x00000000004006c7 <+1>:     mov    %rsp,%rbp
//	      0x00000000004006ca <+4>:     sub    $0x30,%rsp
//	   => 0x00000000004006ce <+8>:     lea    -0x30(%rbp),%rax
//	      0x00000000004006d2 <+12>:    mov    $0xa,%esi
//	      0x00000000004006d7 <+17>:    mov    %rax,%rdi
//	      0x00000000004006da <+20>:    callq  0x400752 <Bar::Bar(int)>  
//	      0x00000000004006df <+25>:    lea    -0x30(%rbp),%rax
//	      0x00000000004006e3 <+29>:    mov    %rax,%rdi
//	      0x00000000004006e6 <+32>:    callq  0x4007aa <Bar::~Bar()>   // 合成自己的析构函数
//	      0x00000000004006eb <+37>:    mov    $0x0,%eax
//	      0x00000000004006f0 <+42>:    leaveq 
//	      0x00000000004006f1 <+43>:    retq   
//	   End of assembler dump.
//


// 只有一个成员class

// (gdb) break *0x00000000004005eb
// Breakpoint 5 at 0x4005eb: file member_class.cpp, line 63.
// (gdb) c
// Continuing.
// Foo constructor
// 
// Breakpoint 3, 0x00000000004005e6 in main () at member_class.cpp:62
// 62              Bar bar(10);
// (gdb) disassemble 
// Dump of assembler code for function main():
//    0x00000000004005c6 <+0>:     push   %rbp
//    0x00000000004005c7 <+1>:     mov    %rsp,%rbp
//    0x00000000004005ca <+4>:     sub    $0x20,%rsp
//    0x00000000004005ce <+8>:     lea    -0x20(%rbp),%rax
//    0x00000000004005d2 <+12>:    mov    $0xa,%esi
//    0x00000000004005d7 <+17>:    mov    %rax,%rdi
//    0x00000000004005da <+20>:    callq  0x400622 <Bar::Bar(int)>
//    0x00000000004005df <+25>:    lea    -0x20(%rbp),%rax
//    0x00000000004005e3 <+29>:    mov    %rax,%rdi
// => 0x00000000004005e6 <+32>:    callq  0x400648 <Bar::~Bar()>
//    0x00000000004005eb <+37>:    mov    $0x0,%eax
//    0x00000000004005f0 <+42>:    leaveq 
//    0x00000000004005f1 <+43>:    retq   
// End of assembler dump.
// (gdb) si
// Bar::~Bar (this=0x7fffffffe380, __in_chrg=<optimized out>) at member_class.cpp:33
// 33      class Bar
// (gdb) disas
// Dump of assembler code for function Bar::~Bar():
// => 0x0000000000400648 <+0>:     push   %rbp
//    0x0000000000400649 <+1>:     mov    %rsp,%rbp
//    0x000000000040064c <+4>:     sub    $0x10,%rsp
//    0x0000000000400650 <+8>:     mov    %rdi,-0x8(%rbp)
//    0x0000000000400654 <+12>:    mov    -0x8(%rbp),%rax
//    0x0000000000400658 <+16>:    mov    %rax,%rdi
//    0x000000000040065b <+19>:    callq  0x40060a <Foo::~Foo()>
//    0x0000000000400660 <+24>:    leaveq 
//    0x0000000000400661 <+25>:    retq   
// End of assembler dump.
// 
