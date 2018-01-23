/* The following code example is taken from the book
 * "C++ Templates - The Complete Guide"
 * by David Vandevoorde and Nicolai M. Josuttis, Addison-Wesley, 2002
 *
 * (C) Copyright David Vandevoorde and Nicolai M. Josuttis 2002.
 * Permission to copy, use, modify, sell and distribute this software
 * is granted provided this copyright notice appears in all copies.
 * This software is provided "as is" without express or implied
 * warranty, and with no claim as to its suitability for any purpose.
 */
#include <iostream>
#include <vector>
using namespace std;

// print elements of an STL container
template <typename T>
void printcoll (T const& coll)
{
	// 错误
    //T::const_iterator pos;  // iterator to iterate over coll
    typename T::const_iterator pos;  // iterator to iterate over coll
    typename T::const_iterator end(coll.end());  // end position

    for (pos=coll.begin(); pos!=end; ++pos) {
        std::cout << *pos << ' ';
    }
    std::cout << std::endl;
}

int main()
{
	vector<int> x;
	x.push_back(1);
	x.push_back(1);
	x.push_back(1);
	x.push_back(1);
	x.push_back(1);
	printcoll(x);
	return 0;
}

