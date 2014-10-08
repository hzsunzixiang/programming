//#order_cmdy_base_fun_v2.cpp: In function 'const std::string& NumberToString(uint32_t)':
//#order_cmdy_base_fun_v2.cpp:1428: warning: returning reference to temporary


#include<iostream>
#include<sstream>
#include<stdint.h>
#include<string>
using namespace std;

/**
  convert a num to string
 */
//const string &NumberToString ( uint32_t number )
const string NumberToString ( uint32_t number )
{
		ostringstream ss;
		ss << number;
		return ss.str();
}

string s;
int main()
{

    string s1;
	uint32_t number=1000;
	s1 = NumberToString(number);
	cout<<"s1\t"<<s1<<endl;
    return 0;
}
