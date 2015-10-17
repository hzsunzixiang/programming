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

// maximum of two values of any type
template <typename T>
inline T const& max (T const& a, T const& b)
{
	cout << "inline T const& max (T const& a, T const& b)" << endl;
    return  a < b  ?  b : a;
}

// maximum of two pointers
template <typename T>
inline T* const& max (T* const& a, T* const& b)
{
	cout << "inline T* const& max (T* const& a, T* const& b)" << endl;
    return  *a < *b  ?  b : a;
}

// maximum of two C-strings
inline char const* const& max (char const* const& a, char const* const& b)
{ 
	cout << "inline char const* const& max (char const* const& a, char const* const& b)" << endl;
    return  std::strcmp(a,b) < 0  ?  b : a;
}

int main ()
{
	//  inline T const& max (T const& a, T const& b)
	// 	inline T const& max (T const& a, T const& b)
	// 	inline T* const& max (T* const& a, T* const& b)
	// 	inline char const* const& max (char const* const& a, char const* const& b)

    int a=7;
    int b=42;
    ::max(a,b);      // max() for two values of type int

    std::string s="hey";
    std::string t="you";
    ::max(s,t);      // max() for two values of type std::string

    int* p1 = &b;
    int* p2 = &a;
    ::max(p1,p2);    // max() for two pointers

	// 如果没有 inline char const* const& max (char const* const& a, char const* const& b)
	// 指针模板会匹配到
    char const* s1 = "David";
    char const* s2 = "Nico";
    ::max(s1,s2);    // max() for two C-strings
}
