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
		virtual void v_func2()
		{
			cout << "This is dev_class's v_func2()" << endl;
		}
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

// 演示虚函数表指针地址
typedef void(*func_pointer)(void);
int main()
{
	// 每个类的虚函数表
	//虚表是属于类的，而不是属于某个具体的对象，一个类只需要一个虚表即可。同一个类的所有对象都使用同一个虚表。 
	//	为了指定对象的虚表，对象内部包含一个虚表的指针，来指向自己所使用的虚表。为了让每个包含虚表的类的对象都拥有一个虚表指针，编译器在类中添加了一个指针，*__vptr，用来指向虚表。这样，当类的对象在创建时便拥有了这个指针，且这个指针的值会自动被设置为指向类的虚表。

	//http://blog.csdn.net/lihao21/article/details/50688337
	// 每个类的虚表指针是同一个  每个对象的虚表指针的内容一样 指向同一个虚表
	base_class bc;
	base_class bc2;

	cout << "-------------base_class------------------------" << endl;
	cout << "base_class 的首地址：" << (intptr_t*)&bc << endl;
	cout << "base_class 的虚函数表首地址为：" << (intptr_t*)(*((intptr_t*)&bc)) << endl;
	//  此时取到的是 base_class::v_func1
	//  由于派生类没有覆盖 所以 派生类得到的也是这个地址
	cout << "base_class 的虚函数表首函数地址为：" << (intptr_t*)*(intptr_t*)(*((intptr_t*)&bc)) << endl;

	//  此时取到的是 base_class::v_func2
	// 由于派生类覆盖了 所以跟派生类获取的不一样
	cout << "base_class 的虚函数表首函数地址+1为：" << (intptr_t*)*((intptr_t*)(*((intptr_t*)&bc))+1) << endl;

	cout << "base_class 的虚函数表首函数地址+2为：" << (intptr_t*)*((intptr_t*)(*((intptr_t*)&bc))+2) << endl;

	cout << "-------------base_class------------------------" << endl;
	cout << "base_class 的虚函数表首地址为：" << (intptr_t*)&bc2 << endl;
	cout << "base_class 的虚函数表首地址为：" << (intptr_t*)(*((intptr_t*)&bc2)) << endl;
	cout << "base_class 的虚函数表首函数地址为：" << (intptr_t*)*(intptr_t*)(*((intptr_t*)&bc2)) << endl;

	cout << "base_class 的虚函数表首函数地址+1为：" << (intptr_t*)*((intptr_t*)(*((intptr_t*)&bc2))+1) << endl;
	cout << "base_class 的虚函数表首函数地址+2为：" << (intptr_t*)*((intptr_t*)(*((intptr_t*)&bc2))+2) << endl;

	dev_class dc;
	dev_class dc2;

	cout << "\n\n\n-------------dev_class------------------------" << endl;
	cout << "dev_class 的 首地址：" << (intptr_t*)&dc << endl;
	cout << "dev_class 的 的虚函数表首地址：" << (intptr_t*)*(intptr_t*)&dc << endl;
	//  此时取到的是 base_class::v_func1
	//  由于派生类没有覆盖 所以 派生类得到的也是这个地址
	cout << "dev_class 的 虚函数表首函数地址：" << (intptr_t*)*(intptr_t*)*(intptr_t*)&dc << endl;

	cout << "dev_class的虚函数表首函数地址+1为：" << (intptr_t*)*((intptr_t*)(*((intptr_t*)&dc))+1) << endl;
	cout << "dev_class的虚函数表首函数地址+2为：" << (intptr_t*)*((intptr_t*)(*((intptr_t*)&dc))+2) << endl;

	cout << "\n\n\n-------------dev_class------------------------" << endl;
	cout << "dev_class 的 首地址：" << (intptr_t*)&dc2 << endl;
	cout << "dev_class 的 的虚函数表首地址：" << (intptr_t*)*(intptr_t*)&dc2 << endl;
	//  此时取到的是 base_class::v_func1
	//  由于派生类没有覆盖 所以 派生类得到的也是这个地址
	cout << "dev_class 的 虚函数表首函数地址：" << (intptr_t*)*(intptr_t*)*(intptr_t*)&dc2 << endl;

	//  派生类覆盖 v_func2 
	cout << "dev_class 的 虚函数表首函数地址+1为：" << (intptr_t*)*((intptr_t*)(*((intptr_t*)&dc2))+1) << endl;

	//  此时取到的是 base_class::v_func3
	//  由于派生类没有覆盖 所以 派生类得到的也是这个地址
	cout << "dev_class 的 虚函数表首函数地址+2为：" << (intptr_t*)*((intptr_t*)(*((intptr_t*)&dc2))+2) << endl;
	return 0;
}

// -------------base_class------------------------
// base_class 的首地址：0x7fffa6b4c090
// base_class 的虚函数表首地址为：0x401410
// base_class 的虚函数表首函数地址为：0x400e7a
// base_class 的虚函数表首函数地址+1为：0x400ea4
// base_class 的虚函数表首函数地址+2为：0x400ece
// -------------base_class------------------------
// base_class 的虚函数表首地址为：0x7fffa6b4c080
// base_class 的虚函数表首地址为：0x401410
// base_class 的虚函数表首函数地址为：0x400e7a
// base_class 的虚函数表首函数地址+1为：0x400ea4
// base_class 的虚函数表首函数地址+2为：0x400ece
// 
// 
// 
// -------------dev_class------------------------
// dev_class 的 首地址：0x7fffa6b4c060
// dev_class 的 的虚函数表首地址：0x4013d0
// dev_class 的 虚函数表首函数地址：0x400e7a
// dev_class的虚函数表首函数地址+1为：0x400ef8
// dev_class的虚函数表首函数地址+2为：0x400ece
// 
// 
// 
// -------------dev_class------------------------
// dev_class 的 首地址：0x7fffa6b4c040
// dev_class 的 的虚函数表首地址：0x4013d0
// dev_class 的 虚函数表首函数地址：0x400e7a
// dev_class 的 虚函数表首函数地址+1为：0x400ef8
// dev_class 的 虚函数表首函数地址+2为：0x400ece

