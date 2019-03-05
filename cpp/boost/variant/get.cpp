#include <boost/variant.hpp>
#include <string>
#include <iostream>

int main()
{
	boost::variant<double, char, std::string> v;
	v = 3.14;
	std::cout << boost::get<double>(v) << '\n';
	v = 'A';
	std::cout << boost::get<char>(v) << '\n';
	v = "Boost";
	std::cout << boost::get<std::string>(v) << '\n';
	//Boost
	//terminate called after throwing an instance of 'boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<boost::bad_get> >'
	//what():  boost::bad_get: failed value get using boost::get
	//Aborted

	//std::cout << boost::get<double>(v) << '\n';
}
