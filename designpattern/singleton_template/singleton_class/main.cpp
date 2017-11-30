
#include "z_singleton.h"
#include <iostream>
using namespace std;

// https://stackoverflow.com/questions/41328038/singleton-template-as-base-class-in-c
class AccessInterTaskParser : public ZSingleton<AccessInterTaskParser> {
private:
	friend class ZSingleton<AccessInterTaskParser>;
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
