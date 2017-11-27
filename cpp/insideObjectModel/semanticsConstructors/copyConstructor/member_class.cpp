
//#include <iostream>
//using namespace std;


class Foo
{
	public:
		Foo() { }
		Foo(Foo const &foo){}
		int val;
		Foo *pnext;
};

class Bar
{
	//1. 在没有拷贝构造函数的情况下 为了调用Foo的拷贝构造函数 合成了Bar的拷贝构造函数
	public:
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
		char *str;  // 将 str初始化是程序员的责任
};

int main()
{
	Bar bar(10);
	Bar bar1(bar);
}

//(gdb) disassemble 
//Dump of assembler code for function Bar::Bar(Bar const&):
//	   0x00000000004005e8 <+0>:     push   %rbp
//	      0x00000000004005e9 <+1>:     mov    %rsp,%rbp
//	   => 0x00000000004005ec <+4>:     sub    $0x10,%rsp
//	      0x00000000004005f0 <+8>:     mov    %rdi,-0x8(%rbp)
//	      0x00000000004005f4 <+12>:    mov    %rsi,-0x10(%rbp)
//	      0x00000000004005f8 <+16>:    mov    -0x10(%rbp),%rdx
//	      0x00000000004005fc <+20>:    mov    -0x8(%rbp),%rax
//	      0x0000000000400600 <+24>:    mov    %rdx,%rsi
//	      0x0000000000400603 <+27>:    mov    %rax,%rdi
//	      0x0000000000400606 <+30>:    callq  0x4005b4 <Foo::Foo(Foo const&)>
//	      0x000000000040060b <+35>:    mov    -0x10(%rbp),%rax
//	      0x000000000040060f <+39>:    mov    0x10(%rax),%rdx
//	      0x0000000000400613 <+43>:    mov    -0x8(%rbp),%rax
//	      0x0000000000400617 <+47>:    mov    %rdx,0x10(%rax)
//	      0x000000000040061b <+51>:    leaveq 
//	      0x000000000040061c <+52>:    retq   
//	   End of assembler dump.

