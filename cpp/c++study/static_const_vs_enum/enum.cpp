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

// primary template to compute 3 to the Nth
#include <iostream>
using namespace std;

// 和 static const 生成的代码完全一样
class Enum_class{
	public:
		int i;
		enum { result = 111111 ,};
};

int main()
{

	Enum_class e;
	cout << sizeof (e) << endl;
	cout << e.result << endl;
	// cout << &e.result << endl;  // error: lvalue required as unary ‘&’ operand 
	return 0;
}
