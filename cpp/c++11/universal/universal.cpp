

#include<cmath>
#include<vector>
#include <iostream>

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
		Point3d(double x = 0.0, double y = 0.0, double z = 0.0)
			:Point(x, y), _z(z) 
		{
			cout << "constructor Point3d" << endl;
		}
		Point3d(const Point3d& rhs)
			:Point(rhs),_z(rhs._z)
		{
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


void f(Point3d&& param) // no type deduction; // param is an rvalue reference
{
}

// var1
template<typename T>
void ft(T&& param) // param is a universal reference
{

}

template<typename T>
void ft1(std::vector<T>&& param) // param is an rvalue reference
{

}

//Even the simple presence of a const qualifier is enough to disqualify a reference from
//being universal:
template<typename T>
void fc(const T&& param) // param is an rvalue reference
{
}

// https://isocpp.org/blog/2012/11/universal-references-in-c11-scott-meyers
int main()
{

	Point3d p1;
	Point3d && p2 = static_cast<Point3d&&>(p1);

	// error: cannot bind ‘Point3d’ lvalue to ‘Point3d&&’
	// f(p2);

	// success
	ft(p1); // lvalue passed to f; param's type is  Widget& (i.e., an lvalue reference)
    f(std::move(p1)); // rvalue passed to f; param's type is  Widget&& (i.e., an rvalue reference)

	//  cannot bind ‘std::vector<Point3d>’ lvalue to ‘std::vector<Point3d>&&’
	std::vector<Point3d> v;
	//ft1(v); // error! can't bind lvalue to // rvalue reference
	// success
	ft1(std::move(v)); 

	// cannot bind ‘Point3d’ lvalue to ‘const Point3d&&’
	//fc(p1);

	// success
	fc(std::move(p1));
	return 0;
}





