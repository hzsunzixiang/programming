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
		virtual void l(int x)
		{
			cout << "Base::l(int) " << x << endl; 
		}  
		virtual void m(int x)
		{
			cout << "Base::m(int) " << x << endl; 
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
			Base::k(1);   // 可以显式调用基类函数 来调用隐藏的函数
			//k(1,2);
		}
		void l(int x)
		{
			cout << "Derived::l(int) " << x << endl; 
		}  
        // hide3.cpp:73:7: error: conflicting return type specified for ‘virtual int Derived::m(int)’
        //    int m(int x)
        //        ^
        // hide3.cpp:31:16: error:   overriding ‘virtual void Base::m(int)’
        //    virtual void m(int x)
        //                 ^
        // hide3.cpp: In member function ‘virtual int Derived::m(int)’:
        // hide3.cpp:76:3: warning: no return statement in function returning non-void [-Wreturn-type]

		// 函数名，参数，返回类型三个条件
		// 在这里返回值不一样 这里报错
		// 在返回只不一样 其他(函数名 参数相同)的情况下 报错
		// int m(int x)
		// {
		// 	cout << "Derived::m(int) " << x << endl; 
		// }  

		// 函数参数不一样 直接隐藏 不报错  除非调用 m(1) 找不到合适函数
		void m(int x, int y)
		{
			cout << "Derived::m(int) " << x << endl; 
		}  
};  
int main(void)  
{  

	Derived  d;  
	Base *pb = &d;  
	Derived *pd = &d; 
	pb->l(1);
	pd->l(1);

	//pb->m(1);
	//pd->m(1);
	pd->test();

	return 0;
} 
