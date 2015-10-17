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
#include <cstring>
#include <string>

using namespace std;
// maximum of two values of any type (call-by-reference)
template <typename T>
inline T const& max (T const& a, T const& b)
{
	cout << "inline T const& max (T const& a, T const& b)" << endl;
    return  a < b  ?  b : a;
}

// maximum of two C-strings (call-by-value)
inline char const* max (char const* a, char const* b)
{ 
	cout << "inline char const* max (char const* a, char const* b)" << endl;
	// 这里返回一个局部变量 a 或者 b
    return  std::strcmp(a,b) < 0  ?  b : a;
}

// maximum of three values of any type (call-by-reference)
template <typename T>
inline T const& max (T const& a, T const& b, T const& c)
{
	cout << "inline T const& max (T const& a, T const& b, T const& c)" << endl;
	// 如果传值， 这里没有赋值， 所以 返回局部变量 a 或者b 
	return ::max (::max(a,b), c);  // error, if max(a,b) uses call-by-value
}
//  root@centos-1:~/programming/cpp/c++template/template/basics/max3a# ./max3a
//  inline T const& max (T const& a, T const& b, T const& c)
//  inline T const& max (T const& a, T const& b)
//  inline T const& max (T const& a, T const& b)
//  
//  inline T const& max (T const& a, T const& b, T const& c)
//  inline char const* max (char const* a, char const* b)
//  inline char const* max (char const* a, char const* b)

int main ()
{
    ::max(7, 42, 68);     // OK

	cout << endl;
    const char* s1 = "frederic";
    const char* s2 = "anica";
    const char* s3 = "lucas";
    ::max(s1, s2, s3);    // ERROR

}
