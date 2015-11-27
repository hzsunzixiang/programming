

#include<stdio.h>


class A {
	public:
		void printGeneral()
		{
			printf("in A printGeneral\n");
			printHello();  // 虚函数，根据具体对象调用不通的函数 call	*%rax
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
	B * b1 = new B();
	b1->printGeneral();

	return 0;
}
