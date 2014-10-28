// constructing maps
#include <iostream>
#include <map>
bool predicate(const std::pair<int,std::string>& x)
{
		return x.first > 2;
}

int main(void) 
{

		std::map<int, std::string> aMap;

		aMap[2] = "two";
		aMap[3] = "three";
		aMap[4] = "four";
		aMap[5] = "five";
		aMap[6] = "six";

		std::map<int, std::string>::iterator it;
		for (it=aMap.begin(); it!=aMap.end(); ++it)
			std::cout << it->first << " => " << it->second << '\n';
		//      does not work, an error
		//  std::remove_if(aMap.begin(), aMap.end(), predicate);

		std::cout<<std::endl<<std::endl<<std::endl;

		std::map<int, std::string>::iterator iter = aMap.begin();
		std::map<int, std::string>::iterator endIter = aMap.end();

		for(; iter != endIter; ++iter)
		{
				if(predicate(*iter))
				{
						aMap.erase(iter);
				}
		}

		for (it=aMap.begin(); it!=aMap.end(); ++it)
			std::cout << it->first << " => " << it->second << '\n';


		return 0;
}
