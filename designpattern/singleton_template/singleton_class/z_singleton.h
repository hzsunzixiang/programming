#pragma once
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

