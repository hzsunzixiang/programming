

#include<stdio.h>


class A {
	public:
		void printGeneral()
		{
			printf("in A printGeneral\n");
			printHello();  // 虚函数，根据具体对象调用不同的函数 call	*%rax
		}
		virtual void printHello()
		{
			printf("in A hello\n");
		}
	public:
		
};

class B:public A {
	public:
		void printHello()
		{
			printf("in B hello\n");
		}
};

int main()
{
	//B * b1 = new B();
	A * b1 = new B();
	b1->printGeneral();   // 这里起始是  B类， 所以调用虚函数的时候 会调用B的 printHello  转换为this指针


	// 实质 需要参考虚函数表理解




	return 0;
}
