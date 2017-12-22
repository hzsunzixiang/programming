//const char *interAddr = AccessConfigManager::getInstance().getInternalAddr().c_str();
//struct in_addr sin_addr;
//if ((sin_addr.s_addr = inet_addr(interAddr)) == INADDR_NONE)
//{
//  ZERROR("inet_addr error... interAddr:%s", interAddr);
//}
#include <vector>
#include <string>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <unistd.h>

std::vector<std::string> vecGlobal;

class config
{
public:
	static const std::string getInternalAddr()
	{
		if (!vecGlobal.empty())
		{
			return vecGlobal[0];
		}
		else
		{
			return "";
		}
	}
};


int main()
{
	vecGlobal.push_back("127.0.0.1");
	for (;;)
	{
		const char *interAddr = config::getInternalAddr().c_str();
		struct in_addr sin_addr;
		if ((sin_addr.s_addr = inet_addr(interAddr)) == INADDR_NONE)
		{
			printf("inet_addr error... interAddr:%s\n", interAddr);
		}
		//sleep(0.1);
	}
	return 0;
}
