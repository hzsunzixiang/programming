
#include <iostream>
using namespace std;


class Foo
{
	public:
		Foo() 
		{
			cout << "Foo Constructor " << endl;
		}
		~Foo() 
		{
			cout << "Foo Deconstructor " << endl;
		}
	    Foo(Foo const& foo)
		{
			cout << "Foo copy constructor " << endl;
		}
		int val;
		Foo *pnext;
};

Foo bar()
{
	Foo foo;
	foo.val = 100;
	return foo;
}
// 关闭返回值优化-fno-elide-constructors
int main()
{
	// 不管有没有拷贝构造函数 都会 有返回值优化 而且 没有拷贝构造函数 编译器 合成一个
	// 优化时只调用一次
	Foo foo(bar());
	return 0;
}

// 不做优化时
// StephenSun@debian-1:~/programming/cpp/insideObjectModel/semanticsConstructors/copyConstructor$ ./nrv 
// Foo Constructor            1
// Foo copy constructor       2   拷贝之后 一个临时变量 tmp
// Foo Deconstructor          11  释放 bar中的foo
// Foo copy constructor       3   构造main中的foo
// Foo Deconstructor          21  释放tmp
// Foo Deconstructor          31  释放 main中的foo
