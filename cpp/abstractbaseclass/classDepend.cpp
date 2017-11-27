

#include<stdio.h>

// 这里可以构造一个无限循环
//
// 必须声明一个带虚函数的基类才能达到目的，不然在A中不可以直接调用 b->printB()

// 一直到coredump为止
class B;

// Bx 在这里仅仅是一个接口
class Bx {
	public:
		virtual void printB()=0;
		
};
class A {
	public:
		void printA()
		{
			printf("in A\n");
			b->printB();    //  如果只是前向声明B,达不到目的  因为到这里 还看不到B的定义
		}
	public:
		Bx * b;
		
};

class B:public Bx {
	public:
		void printB()
		{
			printf("in B\n");
			a->printA();  // 对 B也一样 需要看到A的定义
		}
	public:
		A* a;
};

int main()
{
 	A * a1 = new A();
	B * b1 = new B();
	b1->a = a1;
	a1->b = b1;
	b1->printB();

	return 0;
}
