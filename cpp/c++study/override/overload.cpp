


// 一 重载（overload）
// 概念：
// 
// 函数有同样的名称，但是参数列表不相同的情形，这样的同名不同参数的函数之间，互相称之为重载函数。
// 基本条件：
// 
//     函数名必须相同；
//     函数参数必须不相同，可以是参数类型或者参数个数不同；
//     函数返回值可以相同，也可以不相同；
// 
// 注意：
// 
//     只能通过不同的参数样式进行重载，例如：不同的参数类型，不同的参数个数，不同的参数顺序；
//     不能通过访问权限、返回类型、抛出的异常进行重载；
//     重载的函数应该在相同的作用域下；

#include <iostream>
using namespace std;
class A {
	public:
		void Func1(int arg1) {
			std::cout << "func 1" << std::endl;
		}

		// OK: 通过参数类型不同重载 Func1()
		void Func1(double arg1) {
			std::cout << "func 2" << std::endl;
		}

		// OK: 通过参数个数不同重载 Func1()
		void Func1(int arg1, int arg2) {
			std::cout << "func 3" << std::endl;
		}

		// OK: 重载函数返回值可以不同
		bool Func1(int arg1, double arg2) {
			std::cout << "func 4" << std::endl;
			return true;
		}

		// ERROR: 不能只通过返回值来进行重载
		/*bool Func1(int arg1) {
		  return true;
		  } */
};

int main()
{
	A a;
	a.Func1(1);
	a.Func1(1.0);
	a.Func1(1, 2);
	a.Func1(1, 2.0);
	return 0;
}

