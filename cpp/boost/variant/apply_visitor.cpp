#include <boost/variant.hpp>
#include <string>
#include <iostream>

struct output : public boost::static_visitor<>
{
	void operator()(double d) const { std::cout << d << '\n'; }
	void operator()(char c) const { std::cout << c << '\n'; }
	// 这里多加一个倒不会报错 但是少一个会报错
	void operator()(int c) const { std::cout << c << '\n'; }

	//如果注释掉 error: no match for call to ‘(const output) (std::__cxx11::basic_string<char>&)’
	void operator()(std::string s) const { std::cout << s << '\n'; }
};

int main()
{
	boost::variant<double, char, std::string> v;
	v = 3.14;
	boost::apply_visitor(output{}, v);
	v = 'A';
	boost::apply_visitor(output{}, v);
	v = "Boost";
	boost::apply_visitor(output{}, v);
}
