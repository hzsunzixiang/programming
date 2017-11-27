
class Foo
{
	public:
		virtual void test() {}
		int val;
		Foo *pnext;
};

class Bar: public Foo
{
	//1. 在没有拷贝构造函数的情况下 Bar的构造函数
	public:
		char *str;  // 将 str初始化是程序员的责任
};


int main()
{
	// Foo 仍然没有拷贝构造函数 的生成
	// 如果有虚函数 的话 会有
	Foo foo;
	Foo foo1(foo);

	Bar bar;
	Bar bar1(bar);
	return 0;
}

//(gdb) disassemble 
//Dump of assembler code for function Foo::Foo(Foo const&):
//	   0x00000000004006dc <+0>:     push   %rbp
//	   => 0x00000000004006dd <+1>:     mov    %rsp,%rbp
//	      0x00000000004006e0 <+4>:     mov    %rdi,-0x8(%rbp)
//	      0x00000000004006e4 <+8>:     mov    %rsi,-0x10(%rbp)
//	      0x00000000004006e8 <+12>:    mov    -0x8(%rbp),%rax
//	      0x00000000004006ec <+16>:    movq   $0x4008c0,(%rax)    // 设定Foo的
//	      0x00000000004006f3 <+23>:    mov    -0x10(%rbp),%rax
//	      0x00000000004006f7 <+27>:    mov    0x8(%rax),%edx
//	      0x00000000004006fa <+30>:    mov    -0x8(%rbp),%rax
//	      0x00000000004006fe <+34>:    mov    %edx,0x8(%rax)
//	      0x0000000000400701 <+37>:    mov    -0x10(%rbp),%rax
//	      0x0000000000400705 <+41>:    mov    0x10(%rax),%rdx
//	      0x0000000000400709 <+45>:    mov    -0x8(%rbp),%rax
//	      0x000000000040070d <+49>:    mov    %rdx,0x10(%rax)
//	      0x0000000000400711 <+53>:    pop    %rbp
//	      0x0000000000400712 <+54>:    retq   
//	   End of assembler dump.

//Dump of assembler code for function Bar::Bar(Bar const&):
//	   0x0000000000400752 <+0>:     push   %rbp
//	   => 0x0000000000400753 <+1>:     mov    %rsp,%rbp
//	      0x0000000000400756 <+4>:     sub    $0x10,%rsp
//	      0x000000000040075a <+8>:     mov    %rdi,-0x8(%rbp)
//	      0x000000000040075e <+12>:    mov    %rsi,-0x10(%rbp)
//	      0x0000000000400762 <+16>:    mov    -0x10(%rbp),%rax
//	      0x0000000000400766 <+20>:    mov    (%rax),%rax
//	      0x0000000000400769 <+23>:    sub    $0x18,%rax
//	      0x000000000040076d <+27>:    mov    (%rax),%rax
//	      0x0000000000400770 <+30>:    mov    %rax,%rdx
//	      0x0000000000400773 <+33>:    mov    -0x10(%rbp),%rax
//	      0x0000000000400777 <+37>:    add    %rax,%rdx
//	      0x000000000040077a <+40>:    mov    -0x8(%rbp),%rax
//	      0x000000000040077e <+44>:    add    $0x10,%rax
//	      0x0000000000400782 <+48>:    mov    %rdx,%rsi
//	      0x0000000000400785 <+51>:    mov    %rax,%rdi
//	      0x0000000000400788 <+54>:    callq  0x4006dc <Foo::Foo(Foo const&)>
//	      0x000000000040078d <+59>:    mov    $0x400878,%edx   // 其中一个是virtual base 一个是 virtual function
//	      0x0000000000400792 <+64>:    mov    -0x8(%rbp),%rax
//	      0x0000000000400796 <+68>:    mov    %rdx,(%rax)
//	      0x0000000000400799 <+71>:    mov    $0x10,%edx
//	      0x000000000040079e <+76>:    mov    -0x8(%rbp),%rax
//	      0x00000000004007a2 <+80>:    add    %rdx,%rax
//	      0x00000000004007a5 <+83>:    mov    $0x400890,%edx   // 其中一个是virtual base 一个是 virtual function
//	      0x00000000004007aa <+88>:    mov    %rdx,(%rax)
//	      0x00000000004007ad <+91>:    mov    -0x10(%rbp),%rax
//	      0x00000000004007b1 <+95>:    mov    0x8(%rax),%rdx
//	      0x00000000004007b5 <+99>:    mov    -0x8(%rbp),%rax
//	      0x00000000004007b9 <+103>:   mov    %rdx,0x8(%rax)
//	      0x00000000004007bd <+107>:   leaveq 
//	      0x00000000004007be <+108>:   retq   
//	   End of assembler dump.
//


//Dump of assembler code for function Foo::Foo(Foo const&):
//	=> 0x00000000004006d4 <+0>:     push   %rbp
//	      0x00000000004006d5 <+1>:     mov    %rsp,%rbp
//	      0x00000000004006d8 <+4>:     mov    %rdi,-0x8(%rbp)
//	      0x00000000004006dc <+8>:     mov    %rsi,-0x10(%rbp)
//	      0x00000000004006e0 <+12>:    mov    -0x8(%rbp),%rax
//	      0x00000000004006e4 <+16>:    movq   $0x400840,(%rax)  // vptr
//	      0x00000000004006eb <+23>:    mov    -0x10(%rbp),%rax
//	      0x00000000004006ef <+27>:    mov    0x8(%rax),%edx
//	      0x00000000004006f2 <+30>:    mov    -0x8(%rbp),%rax
//	      0x00000000004006f6 <+34>:    mov    %edx,0x8(%rax)
//	      0x00000000004006f9 <+37>:    mov    -0x10(%rbp),%rax
//	      0x00000000004006fd <+41>:    mov    0x10(%rax),%rdx
//	      0x0000000000400701 <+45>:    mov    -0x8(%rbp),%rax
//	      0x0000000000400705 <+49>:    mov    %rdx,0x10(%rax)
//	      0x0000000000400709 <+53>:    pop    %rbp
//	      0x000000000040070a <+54>:    retq   
//	   End of assembler dump.
//
//Dump of assembler code for function Bar::Bar(Bar const&):
//	=> 0x0000000000400732 <+0>:     push   %rbp
//	      0x0000000000400733 <+1>:     mov    %rsp,%rbp
//	      0x0000000000400736 <+4>:     sub    $0x10,%rsp
//	      0x000000000040073a <+8>:     mov    %rdi,-0x8(%rbp)
//	      0x000000000040073e <+12>:    mov    %rsi,-0x10(%rbp)
//	      0x0000000000400742 <+16>:    mov    -0x10(%rbp),%rdx
//	      0x0000000000400746 <+20>:    mov    -0x8(%rbp),%rax
//	      0x000000000040074a <+24>:    mov    %rdx,%rsi
//	      0x000000000040074d <+27>:    mov    %rax,%rdi
//	      0x0000000000400750 <+30>:    callq  0x4006d4 <Foo::Foo(Foo const&)>
//	      0x0000000000400755 <+35>:    mov    -0x8(%rbp),%rax
//	      0x0000000000400759 <+39>:    movq   $0x400820,(%rax)   // vptr
//	      0x0000000000400760 <+46>:    mov    -0x10(%rbp),%rax
//	      0x0000000000400764 <+50>:    mov    0x18(%rax),%rdx
//	      0x0000000000400768 <+54>:    mov    -0x8(%rbp),%rax
//	      0x000000000040076c <+58>:    mov    %rdx,0x18(%rax)
//	      0x0000000000400770 <+62>:    leaveq 
//	      0x0000000000400771 <+63>:    retq   
//		   End of assembler dump.
//		   (gdb) 
//
