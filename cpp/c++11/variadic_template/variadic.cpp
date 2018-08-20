//https://thispointer.com/c11-variadic-template-function-tutorial-examples/



#include <iostream>

// Function that accepts no parameter
// It is to break the recursion chain of vardiac template function
void log()
{
}

/*
 * Variadic Template Function that accepts variable number
 * of arguments of any type.
 */
template<typename T, typename ... Args>
void log(T first, Args ... args) {

	// Print the First Element
	std::cout<<first<<" , ";

	// Forward the remaining arguments
	log(args ...);
}


int main() {

	log(2, 3.4, "aaa", "bbbb");

	return 0;
}



// Temporary breakpoint 3, main () at variadic.cpp:30
// 30              log(2, 3.4, "aaa", "bbbb");
// (gdb) s
// log<int, double, char const*, char const*> (first=2, args#0=3.3999999999999999, args#1=0x555555554b7e "aaa",
//     args#2=0x555555554b79 "bbbb") at variadic.cpp:21
// 21              std::cout<<first<<" , ";
// 
