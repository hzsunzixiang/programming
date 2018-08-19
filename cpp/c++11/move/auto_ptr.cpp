

#include<cmath>
#include <iostream>
#include <memory> // auto_ptr

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
			cout << "desconstrucotr Point" << endl;
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
		virtual ~Point3d()
		{
			cout << "desconstrucotr Point3d" << endl;
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
		virtual ~Vertex()
		{
			cout << "desconstrucotr Vertex" << endl;
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
		virtual ~Vertex3d()
		{
			cout << "desconstrucotr Vertex3d" << endl;
		}
		int size()
		{
			return sizeof(*this);
		}
		
};

int test_fun()
{
	int *i = new int;
	auto_ptr<int> x(i);
	auto_ptr<int> y;

	y = x;

	cout << x.get() << endl; // Print NULL
	cout << y.get() << "\ti\t" << i << endl; // Print non-NULL address i

	return 0;
}
auto_ptr<Point> make_vertex()
{
	return auto_ptr<Point>(new Vertex3d());
}

int main()
{
	//test_fun();
	// 逐层构造 把相应的vptr赋值给相应对象
	Vertex3d * vertex3d = new Vertex3d();

	std::auto_ptr<Point> a(new Vertex3d());   // create Vertex3d 
	std::auto_ptr<Point> b(a);              // move a into b

	//Segmentation fault
	//int sizea = a->size();           // undefined behavior

	Point * pointa = a.get();           // undefined behavior

	cout << "pointa\t" << pointa << endl;


	int sizeb = b->size();           // normal 
	cout << "size\t" << sizeb << endl;

	//auto_ptr.cpp:96:7: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]



	auto_ptr<Point> c(make_vertex());      // move temporary into c
	int sizec = c->size();   // perfectly safe
	int sizev = make_vertex()->size();   // perfectly safe



	return 0;
}

