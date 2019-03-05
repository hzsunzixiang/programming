

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

template<typename T>
class unique_ptr
{
	T* ptr;

	public:

	T* operator->() const
	{
		return ptr;
	}

	T& operator*() const
	{
		return *ptr;
	}
	explicit unique_ptr(T* p = nullptr)
	{
		cout << "unique_ptr constructor " << endl;
		ptr = p;
	}

	~unique_ptr()
	{
		cout << "deconstructor unique_ptr" << endl;
		delete ptr;
	}
	unique_ptr(unique_ptr& source)   // note the lvalue reference
	{
		cout << "unique_ptr normal copy constructor " << endl;
		ptr = source.ptr;
		source.ptr = nullptr;
	}
	unique_ptr(unique_ptr&& source)   // note the rvalue reference
	{
		cout << "unique_ptr move copy constructor " << endl;
		ptr = source.ptr;
		source.ptr = nullptr;
	}
	// 和下面的拷贝构造冲突
	unique_ptr& operator=(unique_ptr&& source)   // note the rvalue reference
	{
		cout << "unique_ptr move  assignment 1" << endl;
		if (this != &source)    // beware of self-assignment
		{
			delete ptr;         // release the old resource

			ptr = source.ptr;   // acquire the new resource
			source.ptr = nullptr;
		}
		return *this;
	}

	//// 这里需要普通的拷贝构造
	//unique_ptr& operator=(unique_ptr source)   // note the missing reference
	//{
	//	cout << "unique_ptr assignment 2" << endl;
	//	std::swap(ptr, source.ptr);
	//	return *this;
	//}
	T*     get() const throw()
	{
		return ptr;
	}

};

unique_ptr<Point> make_point3d()
{
	return unique_ptr<Point>(new Point3d());
}

class Foo
{
	unique_ptr<Point> member;

	public:

	Foo(unique_ptr<Point>&& parameter)
		: member(parameter)   // error
	{}
};

class Foo2
{
	unique_ptr<Point> member;

	public:

	// 这样也不行
	Foo2(unique_ptr<Point>&& parameter)
		: member(std::move(parameter))   // error
	{}
};

int main()
{
	unique_ptr<Point> a(new Point3d());
	//unique_ptr4.cpp:143:18: error: cannot bind ‘unique_ptr<Point>’ lvalue to ‘unique_ptr<Point>&&’
	//    Foo f = Foo(a);
    //Foo f = Foo(a);

	// OK 
    Foo f = Foo(std::move(a));

    Foo2 f2 = Foo2(std::move(a));
	cout << "after" << endl;
	return 0;
}





