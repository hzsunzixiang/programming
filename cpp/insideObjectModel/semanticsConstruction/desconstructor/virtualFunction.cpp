class Foo
{
	public:
		//Foo() { }
        // 即使有虚函数的情况 编译器也不会构造析构函数 
		// 这点跟构造函数不一样
		virtual void flip(){};
		int val;
		Foo *pnext;
};


int main()
{
	Foo foo;
	return 0;
}
