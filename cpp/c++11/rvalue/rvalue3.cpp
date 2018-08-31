

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

//https://stackoverflow.com/questions/3106110/what-are-move-semantics
// Note that in both factory functions, the return type is a value, not an rvalue reference. Rvalue references are still references, and as always, you should never return a reference to an automatic object; the caller would end up with a dangling reference if you tricked the compiler into accepting your code, like this:
unique_ptr<Point>&& flawed_attempt()   // DO NOT DO THIS!
{
	unique_ptr<Point> very_bad_idea(new Point3d);
	return std::move(very_bad_idea);   // WRONG!
}
//Never return automatic objects by rvalue reference. Moving is exclusively performed by the move constructor, not by std::move, and not by merely binding an rvalue to an rvalue reference.

// 如果验证这个特性 先把取地址操作符的重载去掉
// 还有编译选项 -fno-elide-constructors 的使用
int return_ref()
{

	unique_ptr<Point> res = flawed_attempt();
	//flawed_attempt();
	//Segmentation fault
	//cout << (*res).size() << endl;

	return 0;
}

void foo(Point3d &&)
{
	return;

}
// https://isocpp.org/blog/2012/11/universal-references-in-c11-scott-meyers
int main()
{

	Point3d p1;
	Point3d && p2 = static_cast<Point3d&&>(p1);
	//Point3d && p2 = std::move(p1);  // here, "&&" means rvalue reference

	return 0;
}





