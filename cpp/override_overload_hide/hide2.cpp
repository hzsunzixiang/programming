#include <iostream>  
using namespace std;

class Base  
{  
	public:  
		virtual void f(float x)
		{ 
			cout << "Base::f(float) " << x << endl; 
		}  
		void g(float x)
		{ 
			cout << "Base::g(float) " << x << endl; 
		} 
		void h(float x)
		{
			cout << "Base::h(float) " << x << endl; 
		}  
		void j(int x)
		{
			cout << "Base::j(int) " << x << endl; 
		}  
		void k(int x)
		{
			cout << "Base::k(int) " << x << endl; 
		}  
};  

class Derived : public Base 
{  
	public:  
		virtual void f(float x)
		{
			cout << "Derived::f(float) " << x << endl; 
		}  

		void g(int x)
		{ 
			cout << "Derived::g(int) " << x << endl; 
		} 

		void h(float x)
		{
			cout << "Derived::h(float) " << x << endl; 
		} 
		void j(int *x)
		{
			cout << "Derived::j(int*) " << x << endl; 
		}  
		void k(int x, int y)
		{
			cout << "Derived::k(int,int) " << x << endl; 
		}  
		// hide2.cpp:56:7: error: no matching function for call to ‘Derived::k(int)’
		//  k(1);
		void test()
		{
			//k(1);
			k(1,2);
		}
};  
int main(void)  
{  

	Derived  d;  
	Base *pb = &d;  
	Derived *pd = &d; 


	pb->j(100);  // 直接按基类指针的类型来判断 调用基类的函数 无法调用到派生类 非虚函数
	pb->k(100);  // 调用基类的没问题


	//hide2.cpp:65:11: error: no matching function for call to ‘Derived::k(int)’
	//pd->k(100);  // 非虚函数 调用派生类  找不到相关函数 隐藏了基类的k函数 

	// hide2.cpp:57:11: error: invalid conversion from ‘int’ to ‘int*’ [-fpermissive]
	//   pd->j(100);
	//            ^
	// hide2.cpp:42:8: note: initializing argument 1 of ‘void Derived::j(int*)’
	//    void j(int *x)


	// 派生类  隐藏了基类函数 即时函数参数个数不同也一样
	// pd->j(100);   // error
	// 必须明确告知 才不会报错
	//pd->j((int*)100);
	pd->test();

	return 0;
} 
