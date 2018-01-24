
#include <iostream>
using namespace std;




template <typename T>
void foo()
{
	T x();
}

template <typename T>
class MyClass
{
	private:
		T x;
	public:
	//MyClass()
	MyClass():x()  // 在这里初始化 int 等基本类型也一样
	{
	}
	public:
	T getx()
	{
		return x;
	}
};

int main()
{
	MyClass<int> y;
	cout << y.getx() << endl; 

	int x = int();
	cout << x << endl; 
	return 0;
}
