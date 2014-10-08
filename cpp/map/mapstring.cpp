#include <iostream>
#include <sstream>
#include <map>
#include <string>
#include <cstdint>
using namespace std;
#define STOCK_NUM "stringStock"
#define QUOTA_NUM "stringQuota"


int main ()
{
		std::map<string,string> mymap;
		std::map<string,string> yourmap;

		// first insert function version (single parameter):

		uint32_t test= 10001;
		std::stringstream oss;
		oss<<test;
		string xx = oss.str();
		cout << xx <<endl;
		
		mymap.insert ( std::pair<string,string>(STOCK_NUM,xx) );
		mymap.insert ( std::pair<string,string>(QUOTA_NUM,xx) );

	//	ret = mymap.insert ( std::pair<char,int>('z',500) );
	//	if (ret.second==false) {
	//			std::cout << "element 'z' already existed";
	//			std::cout << " with a value of " << ret.first->second << '\n';
	//	}

	//	// second insert function version (with hint position):
		std::map<string,string>::iterator it = mymap.begin();
	//	mymap.insert (it, std::pair<char,int>('b',300));  // max efficiency inserting
	//	mymap.insert (it, std::pair<char,int>('c',400));  // no max efficiency inserting

	//	// third insert function version (range insertion):
	//	std::map<char,int> anothermap;
	//	anothermap.insert(mymap.begin(),mymap.find('c'));

		// showing contents:
		std::cout << "mymap contains:\n";
		for (it=mymap.begin(); it!=mymap.end(); ++it)
				std::cout << it->first << " => " << it->second << '\n';

		//yourmap.insert(mymap.begin(), mymap.end());
		std::copy(mymap.begin(), mymap.end(), std::inserter(yourmap, yourmap.end()) );
		std::cout << "yourmap contains:\n";
		for (it=mymap.begin(); it!=mymap.end(); ++it)
				std::cout << it->first << " => " << it->second << '\n';
	//	std::pair<std::map<char,int>::iterator,bool> ret;



	//	std::cout << "anothermap contains:\n";
	//	for (it=anothermap.begin(); it!=anothermap.end(); ++it)
	//			std::cout << it->first << " => " << it->second << '\n';

		return 0;
}
