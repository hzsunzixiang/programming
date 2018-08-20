#include <boost/variant.hpp>
#include <string>
#include <iostream>

class Point
{
	public:
		Point(double x = 0.0, double y = 0.0)
		{
			_x = x;
			_y = y;
			std::cout << "constructor Point" << std::endl;
		}
		Point(const Point& o)
		{
			_x = o._x;
			_y = o._y;
			std::cout << "copy constructor Point" << std::endl;
		}
		virtual ~Point()
		{
			std::cout << "desconstructor Point" << std::endl;
		}
		virtual int size()
		{
			return sizeof(this);
		}
	public:
		double _x,_y;
};

struct output : public boost::static_visitor<>
{
	void operator()(double d) const { std::cout << d << '\n'; }
	void operator()(char c) const { std::cout << c << '\n'; }

	//如果注释掉 error: no match for call to ‘(const output) (std::__cxx11::basic_string<char>&)’
	void operator()(std::string s) const { std::cout << s << '\n'; }
	//void operator()(Point& p) const { std::cout << p.size()<< '\n'; }
	void operator()(Point p) const { std::cout << p.size()<< '\n'; }
};

int main()
{
	boost::variant<double, char, std::string, Point> v;
	v = 3.14;
	boost::apply_visitor(output{}, v);
	v = 'A';
	boost::apply_visitor(output{}, v);
	v = "Boost";
	boost::apply_visitor(output{}, v);
	v = Point();
	boost::apply_visitor(output{}, v);
}
