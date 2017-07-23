#include <algorithm>
#include <iostream>
#include <iterator>
#include <random>
#include <vector>

using namespace std;
int cppfunciton()
{
	// seed the RNG
	std::random_device rd;
	std::mt19937 mt(rd());

	std::vector<int> elements { 1, 2, 3, 4, 5, 6, 7, 8, 9 };

	std::cout << "Before: ";
	std::copy(elements.cbegin(), elements.cend(),
			std::ostream_iterator<int>(std::cout, " "));

	auto currentIndexCounter = elements.size()-1;
	cout<<endl;

	for (auto iter = elements.rbegin(); iter != elements.rend();
			++iter, --currentIndexCounter)
	{
		// get int distribution with new range
		std::uniform_int_distribution<> dis(0, currentIndexCounter);
		const int randomIndex = dis(mt);


		cout << "currentIndexCounter:\t" << currentIndexCounter << "\trandomIndex:\t" << randomIndex <<endl;
		if (*iter != elements.at(randomIndex))
		{
			std::swap(elements.at(randomIndex), *iter);
		}
	}

	std::cout << "\nAfter: ";
	std::copy(elements.cbegin(), elements.cend(),
			std::ostream_iterator<int>(std::cout, " "));
	std::cout<<std::endl;
	return 0;
}


int main()
{
	cppfunciton();
	return 0;
}
