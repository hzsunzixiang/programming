

#include <iostream>
using namespace std;

class CB
{
	public:
		void f(int)
		{
			cout << "CB::f(int)" << endl;
		}
		void g(int)
		{
			cout << "CB::g(int)" << endl;
		}

};

class CD : public CB
{
	public:
		void f(int,int)
		{
			cout << "CD::f(int,int)" << endl;
		}
		void test()
		{
			//f(1);  // hide.cpp:25:7: error: no matching function for call to ‘CD::f(int)’
		}
		void g(int)
		{
			cout << "CD::g(int)" << endl;
		}
};

int main(int argc, char* argv[])
{
	CB * cb = new CB;
	CB * cbd = new CD;
	CD * cd = new CD;

	cb->f(1);

	cbd->f(1);

	// 这里报错
	//cd->f(1);  // hide.cpp:37:9: error: no matching function for call to ‘CD::f(int)’
	cd->CB::f(1);

	cout << "-------------------------------------" << endl;
	// 不是虚函数，不会动态绑定 
	cb->g(1);
	cbd->g(1);
	cd->g(1);
	cd->CB::g(1);


	// 评论： 没有virtual关键字，静态绑定，根据其类型来调用, 除非指明域作用符 CB::
	// 静态绑定的函数， 子类不查找父类中的候选函数
	//call	_ZN2CB1fEi
	//call	_ZN2CB1fEi

	//call	_ZN2CB1gEi
	//call	_ZN2CB1gEi
	//call	_ZN2CD1gEi



	return 0;
}
