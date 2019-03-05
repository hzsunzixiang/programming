

#include<cmath>
#include <iostream>
#include <memory> // unique_ptr 

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

unique_ptr<Point> make_point3d()
{
	return unique_ptr<Point>(new Point3d());
}

int main()
{
	//Point3d * point3d= new Point3d();

	std::unique_ptr<Point> a(new Point3d());   // create Point3d 
	cout << "a.get()\t" << a.get() << endl;
	//use of deleted function ‘std::unique_ptr<_Tp, _Dp>::unique_ptr(const std::unique_ptr<_Tp, _Dp>&) [with _Tp = Point; _Dp = std::default_delete<Point>]’

	//std::unique_ptr<Point> b(a);              // move a into b

	std::unique_ptr<Point> b(std::move(a));              // move a into b

	cout << "b.get()\t" << b.get() << endl;
	cout << "a.get()\t" << a.get() << endl;

	std::unique_ptr<Point> c(make_point3d());  

	return 0;
}

