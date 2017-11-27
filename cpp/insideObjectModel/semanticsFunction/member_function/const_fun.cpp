
#include<iostream>
using namespace std;


class Bar
{
	protected:
		int ival;
	public:
		// 注释掉  这个  非常量对象 可以调用 常量函数
		int bar_fun(){
			cout << " non const" <<endl;
			return ival;
		}
		int bar_fun()const { 
			cout << " const" <<endl;
			return ival;
		} // _ZNK3Bar7bar_funEv
};


int main()
{

	Bar bar;
	bar.bar_fun();

	// 如果不定义常量函数
	//const_fun.cpp:22:20: error: passing ‘const Bar’ as ‘this’ argument of ‘int Bar::bar_fun()’ discards qualifiers [-fpermissive]
	//bar_const.bar_fun();
	Bar const bar_const(bar);
	bar_const.bar_fun();

	// 非常量对象 可以调用 常量函数
	bar.bar_fun();

	return 0;
}

