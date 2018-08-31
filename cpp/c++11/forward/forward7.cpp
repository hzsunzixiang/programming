

#include<cmath>
#include <iostream>
#include <memory>

using namespace std;

class MutablePoint
{
	public:
		MutablePoint(double x = 0.0, double y = 0.0)
		{
			_x = x;
			_y = y;
			cout << "constructor MutablePoint" << endl;
		}
		MutablePoint(const MutablePoint& o)
		{
			cout << "copy constructor MutablePoint" << endl;
		}

		virtual ~MutablePoint()
		{
			cout << "desconstructor MutablePoint" << endl;
		}
		virtual int size()
		{
			return sizeof(this);
		}
	protected:
		double _x,_y;
};
class Point
{
	public:
		Point(double x = 0.0, double y = 0.0)
		{
			_x = x;
			_y = y;
			cout << "constructor Point" << endl;
		}
		Point(const MutablePoint& o)
		{
			cout << "copy constructor Point" << endl;
		}

		Point(const MutablePoint&& o)
		{
			cout << "move copy constructor Point" << endl;
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




typedef std::shared_ptr<const Point> PointRef;

// 如果 txIn 是左值  则 普通拷贝构造
// 如果 txIn 是右值  则 移动拷贝构造
// 
template <typename Tx> 
static inline PointRef MakeTransactionRef(Tx&& txIn) 
{ 
	return std::make_shared<const Point>(std::forward<Tx>(txIn)); 
}

// 结合 foward的源码
//template<class S>
//S&& forward_1(typename remove_reference<S>::type& a) noexcept
//{
//	//std::cout << "the type of a\t" << typeid(a).name() << '\n';
//	return static_cast<S&&>(a);
//}


// 这里试着理解 bitcoin 源码
// 这样就把 MutablePoint 中的对象 移动到了 Point中
int main() {
	//MutablePoint p;
	//MakeTransactionRef(p);
	// rvalue
	MakeTransactionRef(MutablePoint());

	return 0;
}

