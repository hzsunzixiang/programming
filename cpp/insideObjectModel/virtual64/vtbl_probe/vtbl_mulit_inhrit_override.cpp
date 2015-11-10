#include <iostream>

#include <stdint.h>

using namespace std;

class base_class1
{
	public:
		virtual void bc1_func1()
		{
			cout << "This is base_class1's bc1_func1()" << endl;
		}
		virtual void bc1_func2()
		{
			cout << "This is base_class1's bc1_func2()" << endl;
		}
};

class base_class2
{
	public:
		virtual void bc2_func1()
		{
			cout << "This is base_class2's bc2_func1()" << endl;
		}
		virtual void bc2_func2()
		{
			cout << "This is base_class2's bc2_func2()" << endl;
		}
};

class dev_class : public base_class1, public base_class2
{
	public:
		virtual void bc1_func1()
		{
			cout << "This is dev_class's bc1_func1()" << endl;
		}
		virtual void bc2_func1()
		{
			cout << "This is dev_class's bc2_func1()" << endl;
		}
		virtual void dc_func1()
		{
			cout << "This is dev_class's dc_func1()" << endl;
		}
};

int main()
{
	dev_class dc;
	cout << "dc 的虚函数表 bc1_vt 地址：" << (intptr_t*)&dc << endl;
	cout << "dc 的虚函数表 bc1_vt 第一个虚函数地址：" << (intptr_t*)*(intptr_t*)&dc+0 << endl;
	cout << "dc 的虚函数表 bc1_vt 第二个虚函数地址：" << (intptr_t*)*(intptr_t*)&dc+1 << endl;
	cout << "dc 的虚函数表 bc1_vt 第三个虚函数地址：" << (intptr_t*)*(intptr_t*)&dc+2 << endl;
	cout << "dc 的虚函数表 bc1_vt 第四个虚函数地址：" << (intptr_t*)*(intptr_t*)&dc+3 << endl;
	cout << "dc 的虚函数表 bc1_vt 结束标志：" << *((intptr_t*)*(intptr_t*)&dc+4) << endl;
	cout << "\n\n--------------------------------------------------------------------" << endl;
	cout << "dc 的虚函数表 bc2_vt 地址：" << (intptr_t*)&dc+1 << endl;
	cout << "dc 的虚函数表 bc2_vt 第一个虚函数首地址：：" << (intptr_t*)*((intptr_t*)&dc+1)+0 << endl;
	cout << "dc 的虚函数表 bc2_vt 第二个虚函数首地址：：" << (intptr_t*)*((intptr_t*)&dc+1)+1 << endl;
	cout << "dc 的虚函数表 bc2_vt 结束标志：" << *((intptr_t*)*((intptr_t*)&dc+1)+2) << endl;
	cout << "\n\n--------------------------------------------------------------------" << endl;
	// 通过函数指针调用函数，验证正确性
	typedef void(*func_pointer)(void);
	func_pointer fp = NULL;
	// bc1_vt
	fp = (func_pointer)*((intptr_t*)*(intptr_t*)&dc + 0);
	fp();
	fp = (func_pointer)*((intptr_t*)*(intptr_t*)&dc + 1);
	fp();
	fp = (func_pointer)*((intptr_t*)*(intptr_t*)&dc + 2);
	fp();
	fp = (func_pointer)*((intptr_t*)*(intptr_t*)&dc + 3);
	fp();
	// bc2_vt
	cout << "\n\n--------------------------------------------------------------------" << endl;
	fp = (func_pointer)*(((intptr_t*)*((intptr_t*)&dc+1) + 0));
	fp();
	fp = (func_pointer)*(((intptr_t*)*((intptr_t*)&dc+1) + 1));
	fp();
	return 0;
}
