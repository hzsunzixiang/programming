#include <iostream>
#include <stdint.h>
using namespace std;

class base_class
{
	public:
		virtual void v_func1()
		{
			cout << "This is base_class's v_func1()" << endl;
		}
		virtual void v_func2()
		{
			cout << "This is base_class's v_func2()" << endl;
		}
		virtual void v_func3()
		{
			cout << "This is base_class's v_func3()" << endl;
		}
	public:
		int a;
		int b;
};

int main()
{
	// 查看 base_class 的虚函数表
	base_class bc;

	// /* Types for `void *' pointers.  */
	// #if __WORDSIZE == 64
	// # ifndef __intptr_t_defined
	// typedef long int		intptr_t;
	// #else
	// # ifndef __intptr_t_defined
	// typedef int			intptr_t;
	// #endif
	cout << "base_class 的虚函数表首地址为：" << (intptr_t*)&bc << endl; // 虚函数表地址存在对象的前4 或 8个字节
	cout << "base_class 的 第一个函数首地址：" << (intptr_t*)*(intptr_t*)&bc+0 << endl; 
	cout << "base_class 的 第二个函数首地址：" << (intptr_t*)*(intptr_t*)&bc+1 << endl;
	cout << "base_class 的 第三个函数首地址：" << (intptr_t*)*(intptr_t*)&bc+2 << endl;

	cout << "base_class 的 第一个函数：" << *((intptr_t*)*(intptr_t*)&bc+0) << endl; 
	cout << "base_class 的 第二个函数：" << *((intptr_t*)*(intptr_t*)&bc+1) << endl;
	cout << "base_class 的 第三个函数：" << *((intptr_t*)*(intptr_t*)&bc+2) << endl;

	// 通过函数指针调用函数，验证正确性
	typedef void(*func_pointer)(void);
	func_pointer fp = NULL;
	fp = (func_pointer)*((intptr_t*)*(intptr_t*)&bc+0); // v_func1()
	fp();
	fp = (func_pointer)*((intptr_t*)*(intptr_t*)&bc+1); // v_func2()
	fp();
	fp = (func_pointer)*((intptr_t*)*(intptr_t*)&bc+2); // v_func3()
	fp();

	cout << "---------------------------------------------" << endl;

	// 用指针直接调用
	((func_pointer)*((intptr_t*)*(intptr_t*)&bc+0))(); // v_func1()
	((func_pointer)*((intptr_t*)*(intptr_t*)&bc+1))(); // v_func2()
	((func_pointer)*((intptr_t*)*(intptr_t*)&bc+2))(); // v_func3()


	return 0;
}
