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
		int x;
		int y;
};
class dev_class : public base_class
{
	public:
		virtual void v_func1()
		{
			cout << "This is dev_class's v_func1()" << endl;
		}
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

int main()
{
	// 查看 dev_class 的虚函数表
	dev_class dc;
	cout << "dev_class 的虚函数表首地址为：" << (int*)&dc << endl;
	cout << "dev_class 的 第一个函数首地址：" << (int*)*(int*)&dc+0 << endl;
	cout << "dev_class 的 第二个函数首地址：" << (int*)*(int*)&dc+1 << endl;
	cout << "dev_class 的 第三个函数首地址：" << (int*)*(int*)&dc+2 << endl;
	cout << "dev_class 的 第四个函数首地址：" << (int*)*(int*)&dc+3 << endl;
	cout << "dev_class 的 第五个函数首地址：" << (int*)*(int*)&dc+4 << endl;
	cout << "dev_class 的虚函数表结束标志: " << *((int*)*(int*)&dc+5) << endl;
	// 通过函数指针调用函数，验证正确性
	typedef void(*func_pointer)(void);
	func_pointer fp = NULL;
	for (int i=0; i<5; i++) {
		fp = (func_pointer)*((int*)*(int*)&dc+i);
		fp();
	}
	return 0;
}
