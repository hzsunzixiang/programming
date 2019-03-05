

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

		// 这里利用了一个规则  http://thbecker.net/articles/rvalue_references/section_08.html
		//Here, the following apply:
		//1. When foo is called on an lvalue of type A, then T resolves to A& and hence, by the reference collapsing rules above, the argument type effectively becomes A&.
		//2. When foo is called on an rvalue of type A, then T resolves to A, and hence the argument type becomes A&&.

		// 传参是rvalue的时候 调用一次普通构造函数
		//Foo(unique_ptr<Point> &&member): member{member} {}


		// 传参是rvalue的时候 调用一次移动构造函数
		//Foo(unique_ptr<Point> &&member): member{std::move(member)} {}

		// 传参是rvalue的时候 也是调用一次移动构造函数
		//传参是lvale的时候 多调用一次拷贝构造函数

		// 所以这个 构造函数 能自动区分 是lvalue 还是 rvalue, 如果是rlvlue 不必再copy
		//TODO: 这个函数并不是模板函数为何能区分 lvalue 和 rvalue ?
		// TODO TODO 还有个问题没解决
		// rvalue 此时调用  移动拷贝构造函数
		//Foo(unique_ptr<Point> member): member{std::move(member)} {}

		//Foo(unique_ptr<Point> member){}

		// 不管是否初始化， member都是要构造起来的，区别在于是构造函数还是拷贝或者移动构造
		template<typename T>
			Foo(T&& member): member{std::forward<T>(member)} {}

		//template<typename T>
		//	Foo(T&& member) {}
};


int main()
{
	//unique_ptr<Point> test(new Point3d());
	//Foo  f(test);

	// 如果有移动构造函数 只调用一次移动构造
	Foo f(unique_ptr<Point>(new Point3d()));
	return 0;
}





