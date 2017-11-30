
#include <iostream>
using namespace std;

class ZNonCopyable {
protected:
	ZNonCopyable()
	{
		cout << "ZNonCopyable init" << endl;
	}
	~ZNonCopyable()
	{
		cout << "ZNonCopyable destroy" << endl;
	}

private:
	ZNonCopyable(const ZNonCopyable &rhs);
	ZNonCopyable& operator=(const ZNonCopyable &rhs);
};

// 这种方式更好一些 自动销毁变量

template <typename T>
class ZSingleton: private ZNonCopyable {
protected:
	ZSingleton() 
	{
		cout << "ZSingleton init" << endl;
	}
	~ZSingleton() 
	{
		cout << "ZSingleton destroy" << endl;
	}

public:
	static T& getInstance() {
		static T m_instance;
		return m_instance;
	}
};

// ZSingleton<AccessInterTaskParser> 
// 这里会实例化一个类 并继承它  继承是为了调用接口 getInstance
// 参数传父类 是为了 静态局部变量初始化
class AccessInterTaskParser : public ZSingleton<AccessInterTaskParser> {
private:
		// 如果不用友员  需要用public 否则  基类 不能访问 父类的 构造函数 以构造 T
        //  static T m_instance;  

		//main_note.cpp: In instantiation of ‘static T& ZSingleton<T>::getInstance() [with T = AccessInterTaskParser]’:
		//main_note.cpp:68:25:   required from here
		//main_note.cpp:52:2: error: ‘AccessInterTaskParser::AccessInterTaskParser()’ is private
		//  AccessInterTaskParser()

	friend class ZSingleton<AccessInterTaskParser>;
	// 因为 构造函数是私有的 
	// 其基类要调用构造函数 以生成实例 所以需要是友员
	AccessInterTaskParser()
	{
		cout << "AccessInterTaskParser init" << endl;
	}
	int m_iPrivate;

public:
	~AccessInterTaskParser()
	{
		cout << "AccessInterTaskParser destroy" << endl;
	}
};

int main()
{
	int i = 0;
	AccessInterTaskParser::getInstance();  // 只有这一行才会触发实例化 在main运行前 实例化
	return 0;
}
