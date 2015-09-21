#include <iostream>
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
	cout << "base_class 的虚函数表首地址为：" << (int*)&bc << endl; // 虚函数表地址存在对象的前四个字节
	cout << "base_class 的 第一个函数首地址：" << (int*)*(int*)&bc+0 << endl; // 指针运算看不懂？没关系，一会解释给你听
	cout << "base_class 的 第二个函数首地址：" << (int*)*(int*)&bc+1 << endl;
	cout << "base_class 的 第三个函数首地址：" << (int*)*(int*)&bc+2 << endl;
	// 通过函数指针调用函数，验证正确性
	typedef void(*func_pointer)(void);
	func_pointer fp = NULL;
	fp = (func_pointer)*((int*)*(int*)&bc+0); // v_func1()
	fp();
	fp = (func_pointer)*((int*)*(int*)&bc+1); // v_func2()
	fp();
	fp = (func_pointer)*((int*)*(int*)&bc+2); // v_func3()
	fp();
	return 0;
}
