
#include<cstdio>

// 重大发现：如果第一个基类是虚函数 则 第二个基类 必须是虚函数, 否则会coredump
class Foo
{
	public:
		Foo() 
		{
			printf("Foo constructor\n");
		}
		int val;
		Foo *pnext1;
	    //call	*%rax
		//call	_ZN4Foo2D2Ev
		///virtual ~Foo()
		virtual ~Foo()
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
		//~Foo2()
		virtual ~Foo2()
		{ 
			printf("Foo2 deconstructor\n");
		}
		//int val2;
		Foo2 *pnext2;   // 如果析构函数 非虚的 这里会coredump  
};
class Foo3
{
	public:
		Foo3()
		{ 
			printf("Foo3 constructor\n");
		}
		~Foo3()
		{ 
			printf("Foo3 deconstructor\n");
		}
		int val3;
		Foo3 *pnext3;
};

//class Bar: public Foo2, public Foo
class Bar: public Foo, public Foo2
{
	//1. 在没有析构函数的情况下 为了调用Foo的析构函数 合成了Bar的析构函数
	//2.  在已经有析构函数的情况下
	//    编译器会扩张已经存在的deconstructor 先调用必要的 default deconstructor
	//3. 如果同时 有 多个基类 所有base class deconstructor 调用之后 调用 相应的default deconstructor
	public:
		Bar(int x)
		{
			val = x;
		}
		Bar(int x, int y)
		{
			val = x + y;
		}
		//Foo3 foo;
		char *str;  // 将 str初始化是程序员的责任
};

int main()
{
	//Foo * bar = new Bar(10);
	//delete bar;

// 重大发现：如果第一个基类是虚函数 则 第二个基类 必须是虚函数, 否则会coredump
// 基类本身 内涵 基类指针
// 第一个基类是虚函数 那么派生类是虚函数 但是  释放的时候却不是正常释放
	Foo2 * bar1 = new Bar(10);
	delete bar1;
}

// 如果不加虚析构函数 不能用基类指针正确的释放 派生类对象

// 如果是非虚函数
//0x00000000004007a8 <+50>:    mov    %rbx,%rdi
//0x00000000004007ab <+53>:    callq  0x4007f6 <Foo::~Foo()>
// 如果是虚函数
//0x000000000040086b <+69>:    callq  *%rax

