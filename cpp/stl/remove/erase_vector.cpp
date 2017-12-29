// erasing from vector
#include <iostream>
#include <vector>
#include <iostream>  
#include <iterator> 
using namespace std;

int main ()
{
	std::vector<int> myvector;

	// set some values (from 1 to 10)
	for (int i=1; i<=10; i++) myvector.push_back(i);


	copy(myvector.begin(), myvector.end(), ostream_iterator<int> (cout,","));
	cout << endl;

	// erase the 6th element
	std::vector<int>::iterator x = myvector.erase (myvector.begin()+5);

	std::cout << "after erase:\t" << *x << std::endl;;

	std::cout << "myvector contains:";
	for (unsigned i=0; i<myvector.size(); ++i)
		std::cout << ' ' << myvector[i];
	std::cout << '\n';

	// erase the first 3 elements:
	myvector.erase (myvector.begin(),myvector.begin()+3);

	std::cout << "myvector contains:";
	for (unsigned i=0; i<myvector.size(); ++i)
		std::cout << ' ' << myvector[i];
	std::cout << '\n';

	return 0;
}
