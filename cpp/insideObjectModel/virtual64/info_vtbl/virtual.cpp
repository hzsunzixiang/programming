
#include <iostream>
using namespace std;

class BaseClass
{
	public:
		virtual void Test()
		{
		}
	public:
		int x;
	public:
		BaseClass()
		{
			cout << "constructor BaseClass" << endl;
		}
		//virtual ~BaseClass()
		virtual ~BaseClass()
		{
			cout << "~BaseClass" << endl;
		}
		//如果没有虚析构函数 32位下面没有报错
		//warning: deleting object of polymorphic class type ‘ChildClass’ which has non-virtual destructor might cause undefined behaviour [-Wdelete-non-virtual-dtor]
		// 为了当用一个基类的指针删除一个派生类的对象时，派生类的析构函数会被调用。
		// 这里必须设为 虚析构函数
		 
};

class ChildClass : public BaseClass
{
	public:
		//virtual void Test()
		void Test()
		{
			int a = 1;
			int b = 2;
			y = a + b;
		}
		virtual void Test1()
		{
		}
	public:
		int y;
		int z;
	public:
		ChildClass()
		{
			cout << "constructor ChildClass" << endl;
		}
		~ChildClass()
		{
			cout << "~ChildClass" << endl;
		}
};

typedef int UnusedType, UsedType;

int main(int argc, char **argv)
{
	BaseClass *pObject0 = new BaseClass();
	ChildClass *pObject = new ChildClass();
	BaseClass *pObject1 = new ChildClass();
	pObject0->Test();
	pObject->Test();

	//pObject1->Test1(); // 基类没有定义的函数 此时以基类指针是无法获取 派生类函数的
	//virtual.cpp:67:12: error: ‘class BaseClass’ has no member named ‘Test1’
    //		  pObject1->Test1();

	//asm("int3");
	// 为了当用一个基类的指针删除一个派生类的对象时，派生类的析构函数会被调用。 
	delete pObject1;
	return 0;
}
