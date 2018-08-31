

#include<cmath>
#include <iostream>
#include <memory>

using namespace std;


class Point
{
	public:
		Point(double x = 0.0, double y = 0.0)
		{
			_x = x;
			_y = y;
			cout << "constructor Point" << endl;
		}
		Point(const Point& o)
		{
			_x = o._x;
			_y = o._y;
			cout << "copy constructor Point" << endl;
		}
		virtual ~Point()
		{
			cout << "desconstructor Point" << endl;
		}
		virtual int size()
		{
			return sizeof(this);
		}
	protected:
		double _x,_y;
};
class Point3d: public Point
{
	public:

	Point3d(double x = 0.0, double y = 0.0, double z = 0.0):Point(x, y), _z(z) 
	{
		cout << "constructor Point3d" << endl;
	}
	Point3d(const Point3d& rhs):Point(rhs),_z(rhs._z)
	{
		cout << "copy constructor Point3d" << endl;
	}

	Point3d(const Point3d&& rhs):Point(rhs),_z(rhs._z)
	{
		cout << "move copy constructor Point3d" << endl;
	}
	virtual ~Point3d()
	{
		cout << "desconstructor Point3d" << endl;
	}
	int size()
	{
		return sizeof(*this);
	}

	protected:
	double _z;
};

class Test
{
	public:
		Test() 
		{
			cout << "constructor Test......" << endl;
		}
		Test(Point3d &p):x(p)
		{
			cout << "constructor Test......" << endl;
		}

		Test(Point3d &&p):x(std::move(p))
		{
			cout << "move constructor Test......" << endl;
		}

	public:
		Point3d x;
};

template<class S>
S&& forward_1(typename remove_reference<S>::type& a) noexcept
{
	//std::cout << "the type of a\t" << typeid(a).name() << '\n';
	return static_cast<S&&>(a);
}

// rvalue 解析为
// Point3d&& forward(Point3d& a) noexcept
// {
// 	  return static_cast<Point3d&&>(a);
// } 

// 此时返回的是一个右值引用 会调用Test的移动构造函数

	template<typename Arg> 
shared_ptr<Test> factory(Arg&& arg)
{ 
	//return shared_ptr<T>(new T(std::forward<Arg>(arg)));
	// 这里针对rvalue 就是 move copy constructor; 针对lvalue就是 copy constructor
	//std::cout << "the type of forward_1<Arg>(arg)\t" << typeid(forward_1<Arg>(arg)).name() << '\n';
	return shared_ptr<Test>(new Test(forward_1<Arg>(arg)));
} 

// factory's template argument Arg resolves to Point3d. Therefore, the compiler will now create the following function template instantiations: 

// shared_ptr<Test> factory(Point3d&& arg)
// { 
// 	  return shared_ptr<Test>(new A(std::forward<Point3d>(arg)));
// } 




// 这里演示rvalue情况
int main() {
	// rvalue
	factory<Point3d>(Point3d());

	return 0;
}

// 
// ericksun@192.168.56.101:~/programming/cpp/c++11/forward$ ./forward6
// constructor Point
// constructor Point3d
// copy constructor Point
// move copy constructor Point3d
// move constructor Test......
// desconstructor Point3d
// desconstructor Point
// desconstructor Point3d
// desconstructor Point




