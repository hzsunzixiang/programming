
#include "z_singleton.h"
#include <iostream>
using namespace std;

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
	AccessInterTaskParser::getInstance();
	return 0;
}
