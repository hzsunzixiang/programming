

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

	//T& operator*() const
	//{
	//	return *ptr;
	//}
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

//https://stackoverflow.com/questions/3106110/what-are-move-semantics
//How come the move constructor accepts the lvalue result as an argument? The scope of result is about to end, and it will be destroyed during stack unwinding. Nobody could possibly complain afterwards that result had changed somehow; when control flow is back at the caller, result does not exist anymore! For that reason, C++11 has a special rule that allows returning automatic objects from functions without having to write std::move. In fact, you should never use std::move to move automatic objects out of functions, as this inhibits the "named return value optimization" (NRVO).
//
//Never use std::move to move automatic objects out of functions.
unique_ptr<Point> NRVO()
{
	unique_ptr<Point> result(new Point3d);
	//unique_ptr2.cpp:145:52: error: taking address of temporary [-fpermissive]
	cout << "address of result in NRVO: " << &result << endl;
	return result;   // note the missing std::move
}

// 如果验证这个特性 先把取地址操作符的重载去掉
// 还有编译选项 -fno-elide-constructors 的使用
int main()
{

	// 返回的时候没有产生另外一个
	cout << "address of result in  main " << &(NRVO() )<< endl;


	//----------------------

	//// 如果 做了优化   省去两次构造
	//unique_ptr<Point> res = NRVO();
	//cout << "address of result in  main " << &res << endl;

	return 0;
}

