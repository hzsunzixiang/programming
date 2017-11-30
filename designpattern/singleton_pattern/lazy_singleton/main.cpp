

#include <iostream>
using namespace std;

// http://www.cnblogs.com/ccdev/archive/2012/12/19/2825355.html
// 一、懒汉模式：即第一次调用该类实例的时候才产生一个新的该类实例，并在以后仅返回此实例。
// 
// 需要用锁，来保证其线程安全性：原因：多个线程可能进入判断是否已经存在实例的if语句，从而non thread safety.
// 
// 使用double-check来保证thread safety.但是如果处理大量数据时，该锁才成为严重的性能瓶颈。
class Singleton
{
	private:
		static Singleton* m_instance;
		Singleton()
		{
			cout << "Singleton init" << endl;
		}
		~Singleton()
		{
			cout << "Singleton destroy" << endl;
		}
	public:
		static Singleton* getInstance();
	public:
		void hello()
		{
			cout << "hello,world!" << endl;
		}
};

Singleton* Singleton::getInstance()
{
	if(NULL == m_instance)
	{
		//Lock();//借用其它类来实现，如boost
		if(NULL == m_instance)
		{
			m_instance = new Singleton;
		}
		//UnLock();
	}
	return m_instance;
}
Singleton* Singleton::m_instance = NULL;
int main()
{
	int i = 10;
	int j = 11; 
	int m = i + j;
	Singleton::getInstance()->hello();

	return 0;
}

