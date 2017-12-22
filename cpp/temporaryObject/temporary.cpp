#include <vector>
#include <string>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <unistd.h>


class Foo
{
	public:
		Foo(int num):i(num)
		{
		}
	//private:
		int i;
};
class config
{
public:
	// temporary.cpp:24:10: warning: returning reference to temporary [-Wreturn-local-addr]

	static const Foo& getObject()
	{
		return 1; 
	}
};


int main()
{
	const Foo foo = config::getObject();
	return 0;
}
