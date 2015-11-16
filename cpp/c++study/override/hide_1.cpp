

// http://glgjing.github.io/blog/2014/12/27/c-plus-plus-zhong-zai-,-zhong-xie-,-zhong-ding-yi-qu-bie/
// 三 重定义（redefining）
// 概念：
// 
// 也叫隐藏，子类重新定义父类中的非虚函数，屏蔽了父类的同名函数
// 基本条件：
// 
//     被隐藏的函数之间作用域不相同
// 
// 注意：
// 
//     子类和父类的函数名称相同，但参数不同，此时不管父类函数是不是virtual函数，都将被隐藏。
//     子类和父类的函数名称相同，参数也相同，但是父类函数不是virtual函数，父类的函数将被隐藏。
//     子类和父类的函数名称相同，但`返回参数`不同，此时父类函数是virtual函数 那么直接报错, 除非返回的指针是协变的 。

#include <iostream>
using namespace std;
class A {
	public:
		void Func1(int a) {
			std::cout << "class A: Func1" << std::endl;
		}

		virtual void Func2(int a) {
			std::cout << "class A: Func2" << std::endl;
		}
};

class B : public A {
	public:
		// 将会重定义redefine(hide)父类的方法
		void Func1(int a) {
			std::cout << "class B: Func1" << std::endl;
		}

		// 将会重写(override)父类方法
		void Func2(int a) {
			std::cout << "class B: Func2-1" << std::endl;
		}

		// 将会重定义父类的方法
		void Func2(int a, int b) {
			std::cout << "class B: Func2-2" << std::endl;
		}
};


int main()
{
	A* aa = new A;
	A* ab = new B;
	B* bb = new B;

//	call	_ZN1A5Func1Ei
//	call	*%rax

	cout << "-------------------------------------" << endl;
	aa->Func1(1);
	aa->Func2(1);
	//aa->Func2(1, 1); /// error: no matching function for call to ‘A::Func2(int, int)’

//	call	_ZN1A5Func1Ei
//	call	*%rax


	cout << "-------------------------------------" << endl;
	ab->Func1(1);  // 静态绑定
	ab->Func2(1); // 动态绑定
	// ab->Func2(1, 1); // no matching function for call to ‘A::Func2(int, int)’

//	call	_ZN1B5Func1Ei
//	call	*%rax
//	call	_ZN1B5Func2Eii

	cout << "-------------------------------------" << endl;
	bb->Func1(1); // 静态绑定
	bb->Func2(1); // 动态绑定
	bb->Func2(1, 1); // 静态绑定 
	return 0;
}

