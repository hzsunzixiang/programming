
// Class Foo
//    size=16 align=8
//    base size=16 base align=8
// Foo (0x0x2baa874e4000) 0
// 
// Vtable for Bar
// Bar::_ZTV3Bar: 3u entries
// 0     16u
// 8     (int (*)(...))0
// 16    (int (*)(...))(& _ZTI3Bar)    //  编译器合成的虚构造函数 同时导致vptr被插入 
// 
// VTT for Bar
// Bar::_ZTT3Bar: 1u entries
// 0     ((& Bar::_ZTV3Bar) + 24u)
// 
// Class Bar
//    size=32 align=8
//    base size=16 base align=8
// Bar (0x0x2baa87399270) 0
//     vptridx=0u vptr=((& Bar::_ZTV3Bar) + 24u)
//   Foo (0x0x2baa874e4060) 16 virtual
//       vbaseoffset=-24    // 有个offset
// 
class Foo
{
	public:
		int val;
		Foo *pnext;
};

class Bar: virtual public Foo
{
	//1. 在没有构造函数的情况下 为了调用Foo的构造函数 合成了Bar的构造函数
	//2.  在已经有构造函数的情况下
	//    编译器会扩张已经存在的constructor 在其中安插一些代码使得 user code在被执行之前，先调用必要的 default constructor
	//3. 如果同时 有 class member objects  则再所有base class constructor 调用之后 调用 相应的default constructor
	public:
		char *str;  // 将 str初始化是程序员的责任
};


int main()
{
	Bar bar;
	return 0;
}

//虚基类继承 看汇编 做了更多的事情  编译器合成的构造函数
//(gdb) disassemble 
//Dump of assembler code for function Bar::Bar():
//	=> 0x000000000040068c <+0>:     push   %rbp
//	      0x000000000040068d <+1>:     mov    %rsp,%rbp
//	      0x0000000000400690 <+4>:     sub    $0x10,%rsp
//	      0x0000000000400694 <+8>:     mov    %rdi,-0x8(%rbp)
//	      0x0000000000400698 <+12>:    mov    -0x8(%rbp),%rax
//	      0x000000000040069c <+16>:    add    $0x10,%rax
//	      0x00000000004006a0 <+20>:    mov    %rax,%rdi
//	      0x00000000004006a3 <+23>:    callq  0x400682 <Foo::Foo()>
//	      0x00000000004006a8 <+28>:    mov    $0x400768,%edx    // 即使 内部没有虚函数 也会合成一个虚构造函数 导致 有vptr产生
//	      0x00000000004006ad <+33>:    mov    -0x8(%rbp),%rax
//	      0x00000000004006b1 <+37>:    mov    %rdx,(%rax)
//	      0x00000000004006b4 <+40>:    leaveq 
//	      0x00000000004006b5 <+41>:    retq   
//	   End of assembler dump.


