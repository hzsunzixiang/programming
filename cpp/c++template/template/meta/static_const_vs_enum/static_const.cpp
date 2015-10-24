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
using namespace std;

// primary template to compute 3 to the Nth
class Static_const{
	public:
		int i; 
		static int const result = 111111;  // class 中的static int const 不能取地址
};

int main()
{
	Static_const e;
	cout << sizeof (e) << endl;
	cout << e.result << endl;
	return 0;
}

