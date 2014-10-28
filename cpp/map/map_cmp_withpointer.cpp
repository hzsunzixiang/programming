// constructing maps
#include <iostream>
#include <map>
#include <stdint.h>
#include <unistd.h>


struct cacheContent{
		int count;
		time_t holdTime;
		std::string shopName;
};

void printCache(const cacheContent * const cache)
{
	std::cout << "count:\t" << cache->count << "\t";
	std::cout << "holdTime:\t" << cache->holdTime << "\t" ;
	std::cout << "shopName:\t" << cache->shopName << "\t";
}

bool predicate(const std::pair<int,cacheContent *>& x)
{
		time_t now = time(NULL);
		if( (now - x.second->holdTime > 1800) && x.second->count < 50 )
				return true;
		else if(x.second->count < 50)
		        return true;
		else
   				return false;
}
int main ()
{

		//bool(*fn_pt)(char,char) = fncomp;
		//std::map<char,int,bool(*)(char,char)> fifth (fn_pt); // function pointer as Compare
		//std::map<uint32_t, cacheContent *> cacheShopName(); // function pointer as Compare
		std::map<uint32_t, cacheContent *> cacheShopName; // function pointer as Compare


		std::string shopName = "aaaa";
        for(uint32_t i=0; i<100; ++i)
		{
				cacheContent *cache = new cacheContent();
				cache -> count = i+10;
				cache -> holdTime = time(NULL);
				cache -> shopName = shopName;

				cacheShopName.insert(std::make_pair(i, cache));
                //sleep(1);
		}

		cacheContent *cache = new cacheContent();
				cache -> count = 10999;
				cache -> holdTime = time(NULL);
				cache -> shopName = "bbb";
		cacheShopName.insert(std::make_pair(50, cache));
		//cacheShopName[50] = cache;

		std::map<uint32_t, cacheContent *>::iterator it;
		for (it = cacheShopName.begin(); it != cacheShopName.end(); ++it)
        {
				std::cout << it->first << " => " << "\t";
                printCache(it->second) ;
				std::cout << std::endl ;
				//std::cout << it->first << " => " << it->second << '\n';
        }
		for(it = cacheShopName.begin(); it != cacheShopName.end(); ++it)
		{
				if(predicate(*it))
				{
						cacheShopName.erase(it);
						delete it->second;
				}
		}

		std::cout << "after filter" << "\n\n\n\n";
		for (it = cacheShopName.begin(); it != cacheShopName.end(); ++it)
        {
				std::cout << it->first << " => " << "\t";
                printCache(it->second) ;
				std::cout << std::endl ;
				//std::cout << it->first << " => " << it->second << '\n';
        }
		it = cacheShopName.find(50);
		if(it == cacheShopName.end())
		{
				std::cout<< "not find 50"<<"\n";
		}
		else
		{
				std::cout<< "find 50"<<"\n";
		}
		it = cacheShopName.find(500);
		if(it == cacheShopName.end())
		{
				std::cout<< "not find 500"<<"\n";
		}
		else
		{
				std::cout<< "find 500"<<"\n";
		}

		//std::map<int, std::string>::iterator it;
		//for (it=aMap.begin(); it!=aMap.end(); ++it)
		//		std::cout << it->first << " => " << it->second << '\n';
		////      does not work, an error
		////  std::remove_if(aMap.begin(), aMap.end(), predicate);

		//std::cout<<std::endl<<std::endl<<std::endl;

		//std::map<int, std::string>::iterator iter = aMap.begin();
		//std::map<int, std::string>::iterator endIter = aMap.end();


		//for (it=aMap.begin(); it!=aMap.end(); ++it)
		//		std::cout << it->first << " => " << it->second << '\n';


		return 0;
}

