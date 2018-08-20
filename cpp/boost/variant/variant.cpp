#include <boost/variant.hpp>
#include <string>

int main()
{
	boost::variant<double, char, std::string> v;
	v = 3.14;
	// if you tried to assign a value of type int to v, the resulting code would not compile. 
	//v = 3;
	v = 'A';
	v = "Boost";
}
