

#include <iostream>
using namespace std;

class CB
{
	public:
		void f(int)
		{
			cout << "CB::f(int)" << endl;
		}
		virtual void g(int)
		{
			cout << "CB::g(int)" << endl;
		}
		// 覆盖时，只有返回值不同的情况下，编译都不能通过
		// error: conflicting return type specified for ‘virtual int CD::h(int)’
		// 
		// 
		// error:   overriding ‘virtual void CB::h(int)’

		// virtual void h(int)
		// {
		// 	cout << "CB::h(int)" << endl;
		// }
		void m(int)
		{
			cout << "CB::m(int)" << endl;
		}

};

class CD : public CB
{
	public:
		void f(int,int)
		{
			cout << "CD::f(int,int)" << endl;
		}
		void g(int, int)
		{
			cout << "CD::g(int, int)" << endl;
		}
		// int h(int)
		// {
		// 	cout << "CD::h(int)" << endl;
		// }
};

int main(int argc, char* argv[])
{
	CB * cb = new CB;
	CB * cbd = new CD;
	CD * cd = new CD;

	cb->f(1);
	cbd->f(1);
	cd->CB::f(1);

	cout << "-------------------------------------" << endl;
	cb->g(1);
	cbd->g(1);

	// 覆盖的条件是参数和返回值一致
	// 如果把 CD中的g(int, int) 注释掉就可以通过了 ,不然会报错
	// call	*%rax
	// cd->g(1);  // error: no matching function for call to ‘CD::g(int)’

	cd->CB::g(1);


	// 如果没有隐藏，是可以正常调用父类非虚函数的
	cout << "-------------------------------------" << endl;
	cb->m(1);
	cbd->m(1);
	cd->m(1);

	cout << "-------------------------------------" << endl;
	// cb->h(1);
	// cbd->h(1);

	// cd->CB::h(1);

	// 评论： 没有virtual关键字，静态绑定，根据其类型来调用, 除非指明域作用符 CB::
	// 静态绑定的函数， 子类不查找父类中的候选函数
	// 动态绑定的函数，子类中如果有重名函数隐藏掉父类函数，那么直接用子类调用，不管是指针还是实例，都不能知道父类函数
	// 子类中如果没有重名函数隐藏父类函数，那么子类是可以查找父类的虚函数的

	// call	_ZN2CB1fEi
	// call	_ZN2CB1fEi
	// call	_ZN2CB1fEi

	// call	*%rax
	// call	*%rax
	// call	_ZN2CB1gEi

	return 0;
}
