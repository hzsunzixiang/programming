#include <iostream>
#include <stdint.h>
using namespace std;

// http://www.perfect-is-shit.com/cpp-vtable.html
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
		int x;
		int y;
};
class dev_class : public base_class
{
	public:
		virtual void v_func4()
		{
			cout << "This is dev_class's v_func4()" << endl;
		}
		virtual void v_func5()
		{
			cout << "This is dev_class's v_func5()" << endl;
		}
	public:
		int y;
		int z;
};

typedef void(*func_pointer)(void);
int main()
{
	// 查看 dev_class 的虚函数表
	base_class bc;

	cout << "-------------base_class------------------------" << endl;
	cout << "base_class 的虚函数表首地址(对象本身的地址)为：" << (intptr_t*)&bc << endl;
	cout << "base_class 的 第一个函数首地址：" << (intptr_t*)*(intptr_t*)&bc+0 << endl;
	cout << "base_class 的 第二个函数首地址：" << (intptr_t*)*(intptr_t*)&bc+1 << endl;
	cout << "base_class 的 第三个函数首地址：" << (intptr_t*)*(intptr_t*)&bc+2 << endl;
	cout << "base_class 的虚函数表结束标志: " << (int64_t)*((intptr_t*)*(intptr_t*)&bc+3) << endl;
	// 通过函数指针调用函数，验证正确性
	func_pointer fp = NULL;
	for (int i = 0; i < 3; i++) {
		fp = (func_pointer)*((intptr_t*)*(intptr_t*)&bc+i);
		fp();
	}
	cout << "-------------直接使用指针调用------------------------" << endl;
	for (int i = 0; i < 3; i++) {
		((func_pointer)*((intptr_t*)*(intptr_t*)&bc+i))();
	}

	cout << "\n\n\n-------------dev_class------------------------" << endl;
	dev_class dc;
	cout << "dev_class 的虚函数表首地址为：" << (intptr_t*)&dc << endl;
	cout << "dev_class 的 第一个函数首地址：" << (intptr_t*)*(intptr_t*)&dc+0 << endl;
	cout << "dev_class 的 第二个函数首地址：" << (intptr_t*)*(intptr_t*)&dc+1 << endl;
	cout << "dev_class 的 第三个函数首地址：" << (intptr_t*)*(intptr_t*)&dc+2 << endl;
	cout << "dev_class 的 第四个函数首地址：" << (intptr_t*)*(intptr_t*)&dc+3 << endl;
	cout << "dev_class 的 第五个函数首地址：" << (intptr_t*)*(intptr_t*)&dc+4 << endl;
	cout << "dev_class 的虚函数表结束标志: " << *((intptr_t*)*(intptr_t*)&dc+5) << endl;
	// 通过函数指针调用函数，验证正确性
	for (int i=0; i<5; i++) {
		fp = (func_pointer)*((intptr_t*)*(intptr_t*)&dc+i);
		fp();
	}
	cout << "-------------直接使用指针调用------------------------" << endl;
	for (int i=0; i<5; i++) {
		((func_pointer)*((intptr_t*)*(intptr_t*)&dc+i))();
	}





	return 0;
}
