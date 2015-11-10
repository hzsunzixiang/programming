#include <iostream>
#include <stdint.h>

using namespace std;

//http://km.oa.com/group/15624/articles/show/202245?kmref=search&from_page=1&no=2


// 这个实验不是很成功
#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)

class Base
{
	public:
		int ib;
		char cb;
	public:
		Base() : ib(0), cb('B') { }
		virtual void f()
		{
			cout << "Base::f()" << endl;
		}
		virtual void Bf()
		{
			cout << "Base::Bf()" << endl;
		}
};



class Base1 : public Base
{
	public:
		int ib1;
		char cb1;
	public:
		Base1() : ib1(1), cb1('1') { }

		virtual void f()
		{	
			cout << "Base1::f()" << endl;
		}
		virtual void f1()
		{
			cout << "Base1::f1()" << endl;
		}
		virtual void Bf1()
		{
			cout << "Base1::Bf1()" << endl;
		}
};


class Base2 : public Base
{
	public:
		intptr_t ib2;
		char cb2;
	public:
		Base2() : ib2(2), cb2('2') { }
		virtual void f()
		{
			cout << "Base2::f()" << endl;
		}
		virtual void f2()
		{
			cout << "Base2::f2()" << endl;
		}
		virtual void Bf2()
		{
			cout << "Base2::Bf2()" << endl;
		}
};




class Derive : public Base1, public Base2
{
	public:
		intptr_t id;
		char cd;
	public:
		Derive() : id(3), cd('D') { }
		virtual void f()
		{
			cout << "Derive::f()" << endl;
		}
		virtual void f1()
		{
			cout << "Derive::f1()" << endl;
		}
		virtual void f2()
		{
			cout << "Derive::f2()" << endl;
		}
		virtual void Df()
		{
			cout << "Derive::Df()" << endl;
		}

};


typedef void(*PFun)(void);

int main(void)
{

	Derive d;
	Base1 b1;
	PFun pFun = NULL;
	cout << "第一个虚函数表 : " << endl;
	cout << "虚函数表地址 : " << (intptr_t*)(&d) << endl;
	cout << "虚函数表第一个函数地址 : " << ((intptr_t*)(*(intptr_t*)(&d)) + 0)  << endl;
	cout << "虚函数表第二个函数地址 : " << ((intptr_t*)(*(intptr_t*)(&d)) + 1) << endl;
	cout << "虚函数表第三个函数地址 : " << ((intptr_t*)(*(intptr_t*)(&d)) + 2) << endl;
	cout << "虚函数表第四个函数地址 : " << ((intptr_t*)(*(intptr_t*)(&d)) + 3) << endl;
	cout << "虚函数表第五个函数地址 : " << ((intptr_t*)(*(intptr_t*)(&d)) + 4) << endl;
	cout << "虚函数表第六个函数地址 : " << ((intptr_t*)(*(intptr_t*)(&d)) + 5) << endl;
	cout << "虚函数表结束标志 : " << *((intptr_t*)(*(intptr_t*)(&d)) + 6) << endl;


	// 第一二虚函数表的数据部分
	cout << "ib : " << *((int*)(&d) + 2)  << endl;
	cout << "cb : " <<(char)*((int*)(&d) + 3)  << endl;
	cout << "ib1 : " << *((int*)(&d) + 4)  << endl;
	cout << "cb1 : " << (char)*((int*)(&d) + 5)  << endl;



	// f Bf  f1 bf1 df 
	pFun = (PFun)*((intptr_t*)*(intptr_t*)(&d) + 0);
	pFun();
	pFun = (PFun)*((intptr_t*)*(intptr_t*)(&d) + 1);
	pFun();
	pFun = (PFun)*((intptr_t*)*(intptr_t*)(&d) + 2);
	pFun();
	pFun = (PFun)*((intptr_t*)*(intptr_t*)(&d) + 3);
	pFun();
	pFun = (PFun)*((intptr_t*)*(intptr_t*)(&d) + 4);
	pFun();
	pFun = (PFun)*((intptr_t*)*(intptr_t*)(&d) + 5);
	pFun();


	cout << "sizeof(Base1)\t" << sizeof(Base1) << endl;
	cout << "offsetof(Derive)\t" << offsetof(Derive, cb1) << endl;
	int n = sizeof(Base1);
	cout << "第二个虚函数表 : " << endl;
	// 注意这种只对64位起作用 , 按8 字节对齐， 所以
	cout << "虚函数表地址 : " << (intptr_t*)(&d) << endl;
	cout << "虚函数表第一个函数地址 : " << ((intptr_t*)*((intptr_t*)(&d) + 3) + 0)  << endl;
	cout << "虚函数表第二个函数地址 : " << ((intptr_t*)*((intptr_t*)(&d) + 3) + 1) << endl;
	cout << "虚函数表第三个函数地址 : " << ((intptr_t*)*((intptr_t*)(&d) + 3) + 2) << endl;
	cout << "虚函数表第四个函数地址 : " << ((intptr_t*)*((intptr_t*)(&d) + 3) + 3) << endl;
	cout << "虚函数表结束标志 :       " << *((intptr_t*)*((intptr_t*)(&d) + 3) + 4) << endl;

	// cout << "ib : " << *((int*)(&d) + 8)  << endl;
	// cout << "cb : " <<(char)*((int*)(&d) + 9)  << endl;
	// cout << "ib2 : " << *((int*)(&d) + 10)  << endl;
	// cout << "cb2 : " << *((int*)(&d) + 11)  << endl;

	pFun = (PFun)*((intptr_t*)*((intptr_t*)(&d) + 3) + 0);
	pFun();
	pFun = (PFun)*((intptr_t*)*((intptr_t*)(&d) + 3) + 1);
	pFun();
	pFun = (PFun)*((intptr_t*)*((intptr_t*)(&d) + 3) + 2);
	pFun();
	pFun = (PFun)*((intptr_t*)*((intptr_t*)(&d) + 3) + 3);
	pFun();

	// cout << "id : " << *((int*)(&d) + 12)  << endl;
	// cout << "cd : " <<*((int*)(&d) + 13)  << endl;
	return 0;
}
