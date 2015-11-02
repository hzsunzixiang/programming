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

// 有这句定义可以取地址，不然不能取地址
int const Static_const::result;
// 把上面那句去掉， result 作为一个字面量使用，不分配内存
// 1，上面那句是定义，为其分配内存，不然只是一个声明，字面量
// 2.  需要取地址时，必须用那句来定义，
// 可以去掉编译一下 查看汇编
int main()
{
	Static_const e;
	cout << sizeof (e) << endl;
	//cout << &(e.result) << endl;
	cout << e.result << endl;
	&Static_const::result;
	cout << &(Static_const::result) << endl;

	return 0;
}

//	cout << &(e.result) << endl;

///root/programming/cpp/c++study/static_const_vs_enum/static_const.cpp:26: undefined reference to `Static_const::result'
//collect2: error: ld returned 1 exit status

