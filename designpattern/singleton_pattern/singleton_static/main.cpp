

#include <iostream>
using namespace std;


// 饿汉模式 --  
// 饿汉模式 是指单例实例在程序运行时被立即执行初始化:

//http://blog.yangyubo.com/2009/06/04/best-cpp-singleton-pattern/#id3 
// http://www.cnblogs.com/ccdev/archive/2012/12/19/2825355.html
// 返回指针 或者  实例
class SingletonStaticP
{
	private:
		static SingletonStaticP* m_instance;
		SingletonStaticP()
		{
			cout << "SingletonStaticP init" << endl;
		}
		~SingletonStaticP() 
		{
			cout << "SingletonStaticP destroy" << endl;
		}
	public:
		static SingletonStaticP* getInstance()
		{
			return m_instance;
		}
	public:
		void hello()
		{
			cout << "hello,world!" << endl;
		}
};

//外部初始化 before invoke main
SingletonStaticP* SingletonStaticP::m_instance = new SingletonStaticP;


class SingletonStaticC
{
	private:
		static SingletonStaticC m_instance;
		SingletonStaticC()
		{
			cout << "SingletonStaticC init" << endl;
		}
		~SingletonStaticC()
		{
			cout << "SingletonStaticC destroy" << endl;
		}
	public:
		static SingletonStaticC& getInstance()
		{
			return m_instance;
		}
	public:
		void hello()
		{
			cout << "hello,world!" << endl;
		}
};

//外部初始化 before invoke main
SingletonStaticC SingletonStaticC::m_instance;

int main()
{
	int i = 10;
	int j = 11; 
	int m = i + j;
	// StephenSun@debian:~/programming/designpattern/singleton_pattern/singleton_static$ ./main
	// 	SingletonStaticP init
	// 	SingletonStaticC init
	// 	SingletonStaticC destroy

	// 即使不调用下面的语句 也会初始化 实例

	//SingletonStaticP::getInstance()->hello(); // 调用这里才会 初始化局部静态变量

	//SingletonStaticC::getInstance().hello();


	return 0;
}



