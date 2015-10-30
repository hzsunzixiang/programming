#include "singleton_t.h"

#include <stdint.h>




class CCntlInfo 
{
public:
	CCntlInfo() : m_dwUin(0) {}

protected:
	uint32_t m_dwUin;
};



typedef CSingletonT<CCntlInfo, CDummyLock> CCntlInfoSingleton;
#define CNTL_INFO CCntlInfoSingleton::Instance()

int main()
{
	CNTL_INFO;

	return 0;
}
