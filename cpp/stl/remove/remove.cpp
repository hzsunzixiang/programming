// remove algorithm example
#include <iostream>     // std::cout
#include <algorithm>    // std::remove

int main () {
	int myints[] = {10,20,30,30,20,10,10,20};      // 10 20 30 30 20 10 10 20

	// bounds of range:
	int* pbegin = myints;                          // ^
	int* pend = myints+sizeof(myints)/sizeof(int); // ^                       ^

	int* pend1 = std::remove (pbegin, pend, 20);         // 10 30 30 10 10 ?  ?  ?
												   // ^              ^
	std::cout << "range contains:";
	for (int* p=pbegin; p!=pend1; ++p)
		std::cout << ' ' << *p;
	std::cout << '\n';

	// pend1 之后的值不确定
	std::cout << "range contains:";
	for (int* p=pbegin; p!=pend; ++p)
		std::cout << ' ' << *p;
	std::cout << '\n';

	return 0;
}

