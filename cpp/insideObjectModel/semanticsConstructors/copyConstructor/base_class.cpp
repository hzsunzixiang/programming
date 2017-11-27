
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
		int val2;
		Foo2 *pnext2;
};

class Foo3
{
	public:
		Foo3() { }
		int val;
		Foo3 *pnext;
};
class Bar: public Foo, public Foo2
{
	//1. 在没有构造函数的情况下 为了调用Foo的构造函数 合成了Bar的构造函数
	//2.  在已经有构造函数的情况下
	//    编译器会扩张已经存在的constructor 在其中安插一些代码使得 user code在被执行之前，先调用必要的 default constructor
	//3. 如果同时 有 class member objects  则再所有base class constructor 调用之后 调用 相应的default constructor
	public:
		Bar(int x)
		{
			val = x;
		}
		Bar(int x, int y)
		{
			val = x + y;
		}
		Foo3 foo;
		char *str;  // 将 str初始化是程序员的责任
};

int main()
{
	Bar bar(10);
}


// Dump of assembler code for function Bar::Bar(int):
// => 0x00000000004005a0 <+0>:     push   %rbp
//    0x00000000004005a1 <+1>:     mov    %rsp,%rbp
//    0x00000000004005a4 <+4>:     sub    $0x10,%rsp
//    0x00000000004005a8 <+8>:     mov    %rdi,-0x8(%rbp)
//    0x00000000004005ac <+12>:    mov    %esi,-0xc(%rbp)
//    0x00000000004005af <+15>:    mov    -0x8(%rbp),%rax
//    0x00000000004005b3 <+19>:    mov    %rax,%rdi
//    0x00000000004005b6 <+22>:    callq  0x400596 <Foo::Foo()>
//    0x00000000004005bb <+27>:    mov    -0x8(%rbp),%rax
//    0x00000000004005bf <+31>:    mov    -0xc(%rbp),%edx
//    0x00000000004005c2 <+34>:    mov    %edx,(%rax)
//    0x00000000004005c4 <+36>:    leaveq 
//    0x00000000004005c5 <+37>:    retq   
// End of assembler dump.



// 继承Foo和Foo2 加成成员Foo3
//(gdb) disassemble 
//Dump of assembler code for function Bar::Bar(int):
//=> 0x00000000004005b4 <+0>:     push   %rbp
//   0x00000000004005b5 <+1>:     mov    %rsp,%rbp
//   0x00000000004005b8 <+4>:     sub    $0x10,%rsp
//   0x00000000004005bc <+8>:     mov    %rdi,-0x8(%rbp)
//   0x00000000004005c0 <+12>:    mov    %esi,-0xc(%rbp)
//   0x00000000004005c3 <+15>:    mov    -0x8(%rbp),%rax
//   0x00000000004005c7 <+19>:    mov    %rax,%rdi
//   0x00000000004005ca <+22>:    callq  0x400596 <Foo::Foo()>
//   0x00000000004005cf <+27>:    mov    -0x8(%rbp),%rax
//   0x00000000004005d3 <+31>:    add    $0x10,%rax
//   0x00000000004005d7 <+35>:    mov    %rax,%rdi
//   0x00000000004005da <+38>:    callq  0x4005a0 <Foo2::Foo2()>
//   0x00000000004005df <+43>:    mov    -0x8(%rbp),%rax
//   0x00000000004005e3 <+47>:    add    $0x20,%rax
//   0x00000000004005e7 <+51>:    mov    %rax,%rdi
//   0x00000000004005ea <+54>:    callq  0x4005aa <Foo3::Foo3()>
//   0x00000000004005ef <+59>:    mov    -0x8(%rbp),%rax
//   0x00000000004005f3 <+63>:    mov    -0xc(%rbp),%edx
//   0x00000000004005f6 <+66>:    mov    %edx,(%rax)
//   0x00000000004005f8 <+68>:    leaveq 
//   0x00000000004005f9 <+69>:    retq   
//End of assembler dump.

