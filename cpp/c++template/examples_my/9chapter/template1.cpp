
#include <list>
#include <vector>
#include <iostream>
// bitset::to_string
#include <iostream>       // std::cout
#include <string>         // std::string
#include <bitset>         // std::bitset

using namespace std;
int bitTest()
{
	std::bitset<4> mybits;     // mybits: 0000
	mybits.set();              // mybits: 1111

	std::string mystring =
		mybits.to_string<char,std::string::traits_type,std::string::allocator_type>();

	std::cout << "mystring: " << mystring << '\n';

	return 0;
}
template <int N>
void printBitset (std::bitset<N> const &bs)
{
	std::cout << bs.template to_string<char,std::string::traits_type,std::string::allocator_type>() << endl;;

    // 下面这样错误
    // template1.cpp:27:28: error: expected primary-expression before ‘char’
    //   std::cout << bs.to_string<char,std::string::traits_type,std::string::allocator_type>() << endl;;
    //                             ^
    // template1.cpp:27:28: error: expected ‘;’ before ‘char’
    // 
	//std::cout << bs.to_string<char,std::string::traits_type,std::string::allocator_type>() << endl;;
}

int main()
{
	bitTest();
	return 0;
}
