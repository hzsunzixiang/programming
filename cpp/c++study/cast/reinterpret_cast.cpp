

// if include <cstdint> ---- /usr/include/c++/4.9/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support is currently experimental, and must be enabled with the -std=c++11 or -std=gnu++11 compiler options.

// http://en.cppreference.com/w/cpp/language/reinterpret_cast


// Converts between types by reinterpreting the underlying bit pattern. 
#include <stdint.h>
#include <cassert>
#include <iostream>
int f() { return 42; }

// /* Types for `void *' pointers.  */
// #if __WORDSIZE == 64
// # ifndef __intptr_t_defined
// typedef long int		intptr_t;
// typedef unsigned long int	uintptr_t;
// # ifndef __intptr_t_defined
// typedef int			intptr_t;
// # endif
// typedef unsigned int		uintptr_t;
// #endif

int main()
{
	int i = 0x0107;

	// pointer to integer and back
	uintptr_t v1 = reinterpret_cast<uintptr_t>(&i); // static_cast is an error

	std::cout << "The value of &i is 0x" << std::hex << v1 << '\n';

	int* p1 = reinterpret_cast<int*>(v1);
	assert(p1 == &i);

	// pointer to function to another and back
	void(*fp1)() = reinterpret_cast<void(*)()>(f);
	fp1();   // undefined behavior

	int(*fp2)() = reinterpret_cast<int(*)()>(fp1);
	std::cout << std::dec << fp2() << '\n'; // safe

	// type aliasing through pointer
	char* p2 = reinterpret_cast<char*>(&i);
	//if(p2[0] == '\x7')
	if(p2[0] == 0x07)
		std::cout << "This system is little-endian\n";
	else
		std::cout << "This system is big-endian\n";

	// type aliasing through reference
	reinterpret_cast<unsigned int&>(i) = 42;
	std::cout << i << '\n';
}










