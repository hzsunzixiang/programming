class Foo
{
	public:
		int val;
		Foo *pnext;
};

class Bar: virtual public Foo
{
	//1. 即使有虚基类  也不会合成析构函数 
	//   这单和构造函数不一样
	public:
		char *str;  // 将 str初始化是程序员的责任
};


int main()
{
	Bar bar;
	return 0;
}
