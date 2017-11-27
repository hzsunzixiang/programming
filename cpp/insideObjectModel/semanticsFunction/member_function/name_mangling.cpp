



//-- 类名
//-- 参数列表
//-- 是否virtual -- 虚函数不会加明显标志
//-- 是否是const
//
class Bar
{
	protected:
		int ival;
	public:
		//_ZN3Bar7bar_funEc
		//_ZN3Bar7bar_funEv
		//_ZNK3Bar7bar_funEv
		//_ZN3Bar7bar_funEd
		//_ZN3Bar7bar_funEi
		virtual int bar_fun(char i){ return ival;}
		int bar_fun(){ return ival;}
		int bar_fun()const { return ival;} // _ZNK3Bar7bar_funEv
		int bar_fun(int i){ return ival;}
		//int bar_fun(double i){ return ival;}
		//_ZN3Bar7bar_funEd
		static int bar_fun(double i){ return 100;} // 静态函数中不能调用成员变量 
};

class Foo : public Bar
{
	public: 
		// _ZN3Foo7bar_funEv
		int bar_fun(){ return ival;}
		int bar_fun()const { return ival;} // _ZNK3Bar7bar_funEv
		int bar_fun(int i){ return ival;}
		int bar_fun(double i){ return ival;}
};

int main()
{

	Bar bar;
	// call	_ZN3Bar7bar_funEv
	bar.bar_fun();
	// call	_ZN3Bar7bar_funEi
	bar.bar_fun(10);
	// call	_ZN3Bar7bar_funEd
	bar.bar_fun(10.0);
	Bar const bar_const(bar);

	// 如果不定义 常量函数  则报错
	// name_mangling.cpp:52:20: error: passing ‘const Bar’ as ‘this’ argument of ‘int Bar::bar_fun()’ discards qualifiers [-fpermissive]
  //bar_const.bar_fun();
	// call	_ZNK3Bar7bar_funEv
	bar_const.bar_fun();


	// call	_ZN3Bar7bar_funEd
	Bar::bar_fun(100.0);  // call	_ZN3Bar7bar_funEd

	//call	_ZN3Bar7bar_funEv
	//call	_ZN3Bar7bar_funEi
	//call	_ZN3Bar7bar_funEd
	//call	_ZNK3Bar7bar_funEv
	//call	_ZN3Bar7bar_funEd
	//call	_ZN3Foo7bar_funEv

	Foo foo;
	// call	_ZN3Foo7bar_funEv
	foo.bar_fun();
	
	return 0;
}

