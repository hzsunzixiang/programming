#include <iostream>

void foo ( ) ;
void handle ( ) ;

int main ()
{
	try {
		foo ();
	} catch (int x) {
		std::cout << "caught " << x << "\n";
		handle ();
	}

	return 0;
}

void foo ( )
{
	std::cout<<"in foo\n"; 

	std::string data = "Hello World";

	std::cout << "data = " << data << "\n";

	throw 42;
}

void handle ( )
{
	std::cout << "in handler\n";
}
