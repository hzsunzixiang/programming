#include <iostream>
#include <stdint.h>
using namespace std;

class base_class1
{
	public:
		void normal_funcb1()
		{
			cout << "This is  normal_funcb1" << endl;
		}
		virtual void bc1_func1()
		{
			cout << "This is base_class1's v_func1()" << endl;
		}
	public:  
		//int x;
};

class base_class2
{
	public:
		void normal_funcb2()
		{
			cout << "This is  normal_funcb2" << endl;
		}
		virtual void bc2_func1()
		{
			cout << "This is bc2_func1's v_func1()" << endl;
		}
	public:
		//int y;
};

class dev_class : public base_class1, public base_class2
{
	public:
		virtual void dc_func1()
		{
			cout << "This is dc_func1's dc_func1()" << endl;
		}
	public:
		//int y;
};

int main()
{
	// 有成员变量时，虚函数指针偏移量是有变化的
	dev_class dc;
	cout << "dc 的虚函数表 bc1_vt 地址：" << (intptr_t*)&dc << endl;
	cout << "dc 的虚函数表 bc1_vt 第一个虚函数地址：" << (intptr_t*)*(intptr_t*)&dc + 0 << endl;
	cout << "dc 的虚函数表 bc1_vt 第二个虚函数地址：" << (intptr_t*)*(intptr_t*)&dc + 1 << endl;
	cout << "dc 的虚函数表 bc1_vt 结束标志：" << *((intptr_t*)*(intptr_t*)&dc + 2) << endl;
	cout << "--------------------------------------------------------------------" << endl;
	cout << "dc 的虚函数表 bc2_vt 地址：" << (intptr_t*)&dc + 1 << endl;
	cout << "dc 的虚函数表 bc2_vt 第一个虚函数首地址：：" << (intptr_t*)*((intptr_t*)&dc + 1) + 0 << endl;
	cout << "dc 的虚函数表 bc2_vt 结束标志：" << *((intptr_t*)*((intptr_t*)&dc+1) + 1) << endl;
	cout << "--------------------------------------------------------------------" << endl;
	// 通过函数指针调用函数，验证正确性
	typedef void(*func_pointer)(void);
	func_pointer fp = NULL;
	// bc1_vt
	fp = (func_pointer)*((intptr_t*)*(intptr_t*)&dc + 0);
	fp();
	fp = (func_pointer)*((intptr_t*)*(intptr_t*)&dc + 1);
	fp();
	// bc2_vt
	fp = (func_pointer)*(((intptr_t*)*((intptr_t*)&dc + 1) + 0));
	fp();
	return 0;
}


// This is base_class1's v_func1()
// This is dc_func1's dc_func1()  对于多重继承，子类跟第一个父类放在一起
// This is bc2_func1's v_func1()

