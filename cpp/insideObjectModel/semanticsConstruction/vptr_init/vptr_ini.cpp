

#include<cmath>
#include <iostream>
using namespace std;

class Point
{
	public:
		Point(double x = 0.0, double y = 0.0)
		{
			_x = x;
			_y = y;
			cout << "sizeof(*this) in Point\t" << sizeof(*this) << endl;
		}
		Point(const Point& o)
		{
			_x = o._x;
			_y = o._y;
		}
		virtual ~Point()
		{
		}
		virtual int size()
		{
			return sizeof(this);
		}
	protected:
		double _x,_y;
};
class Point3d: public virtual  Point

{
	public:
		Point3d(double x = 0.0, double y = 0.0, double z = 0.0):Point(x, y), _z(z) 
		{
			cout << "sizeof(*this) in Point3d\t" << sizeof(*this) << endl;
		}
		Point3d(const Point3d& rhs):Point(rhs),_z(rhs._z)
		{
		}
		int size()
		{
			return sizeof(*this);
		}
		
	protected:
		double _z;
};

class Vertex: public virtual  Point

{
	public:
		Vertex(double x = 0.0, double y = 0.0, double z = 0.0):Point(x, y), _z(z) 
		{
			cout << "sizeof(*this) in Vertex\t" << sizeof(*this) << endl;
		}
		Vertex(const Vertex& rhs):Point(rhs),_z(rhs._z)
		{
		}
		int size()
		{
			return sizeof(*this);
		}
		
	protected:
		double _z;
};

class Vertex3d: public Point3d, public Vertex
{
	public:
		Vertex3d(double x = 0.0, double y = 0.0, double z = 0.0):Point3d(x, y,z), Vertex(x,y,z) 
		{
			cout << "sizeof(*this) in Vertex3d\t" << sizeof(*this) << endl;
		}
		Vertex3d(const Vertex3d& rhs):Point3d(rhs),Vertex(rhs)
		{
		}
		int size()
		{
			return sizeof(*this);
		}
		
};


int main()
{
	// 逐层构造 把相应的vptr赋值给相应对象
	Vertex3d * vertex3d = new Vertex3d();

	return 0;
}

// StephenSun@debian-1:~/programming/cpp/insideObjectModel/semanticsConstruction/vptr_init$ ./vptr_ini 
// sizeof(*this) in Point  24
// sizeof(*this) in Point3d        40
// sizeof(*this) in Vertex 40
// sizeof(*this) in Vertex3d       56
