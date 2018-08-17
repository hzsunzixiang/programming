

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
		cout << "copy constructor Point3d" << endl;
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
	public:
		unique_ptr<Point> member;

		// 传参是rvalue的时候 调用一次普通构造函数
		//Foo(unique_ptr<Point> &&member): member{member} {}


		// 传参是rvalue的时候 调用一次移动构造函数
		//Foo(unique_ptr<Point> &&member): member{std::move(member)} {}

		// 传参是rvalue的时候 也是调用一次移动构造函数
		//传参是lvale的时候 多调用一次拷贝构造函数

		// 所以这个 构造函数 能自动区分 是lvalue 还是 rvalue, 如果是rlvlue 不必再copy
		Foo(unique_ptr<Point> member): member{std::move(member)} {}


};


int main()
{
	unique_ptr<Point> test(new Point3d());
	Foo  f(test);

	// 如果有移动构造函数 只调用一次移动构造
	//Foo f(unique_ptr<Point>(new Point3d()));
	return 0;
}





