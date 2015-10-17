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
// maximum of two values of any type
#include <iostream>
#include <cstring>
#include <string>

using namespace std;

template <typename T>
inline T const& max (T const& a, T const& b)
{
	cout << "inline T const& max (T const& a, T const& b)" << endl;
    return  a < b ? b : a;
}

// maximum of three values of any type
template <typename T>
inline T const& max (T const& a, T const& b, T const& c)
{
	cout << "inline T const& max (T const& a, T const& b, T const& c)" << endl;
	return ::max (::max(a,b), c);  // uses the template version even for ints
}                              // because the following declaration comes
                               // too late:
// maximum of two int values
inline int const& max (int const& a, int const& b) 
{
	cout << "inline int const& max (int const& a, int const& b)" << endl;
    return  a < b ? b : a;
}
// root@centos-1:~/programming/cpp/c++template/template/basics/max4# ./max4
// inline T const& max (T const& a, T const& b, T const& c)
// inline T const& max (T const& a, T const& b)
// inline T const& max (T const& a, T const& b)
//
int main ()
{
    ::max(7, 42, 68);     // OK

}
