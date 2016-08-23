// map::lower_bound/upper_bound
#include <iostream>
#include <map>
using namespace std;  

int main ()
{
	std::map<char,int> mymap;
	std::map<char,int>::iterator itlow,itup;

	mymap['a']=20;
	mymap['c']=40;
	mymap['e']=60;
	mymap['f']=80;
	mymap['h']=100;

	itlow=mymap.lower_bound ('b');  // itlow points 
	std::cout << itlow->first << " => " << itlow->second << '\n';
	itup=mymap.upper_bound ('b');   // itup points 
	std::cout << itup->first << " => " << itup->second << '\n';

	itlow=mymap.lower_bound ('c');  // itlow points
	std::cout << itlow->first << " => " << itlow->second << '\n';
	itup=mymap.upper_bound ('c');   // itup points 
	std::cout << itup->first << " => " << itup->second << '\n';


	return 0;
}
