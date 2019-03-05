

#include<cmath>
#include<vector>
#include<string>
#include <iostream>

using namespace std;
int main()
{
	// 不知如何实现 TODO
	char *tmp = (char*)malloc(1024*1024); 
	//string x("hell,world, this is china");
	string x(tmp);
	string y(x);
	string z(std::move(x));
	return 0;
}





