

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
			cout << "normal copy constructor Point" << endl;
		}

		Point(const Point&& o)
		{
			_x = o._x;
			_y = o._y;
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
	public:
		double _x,_y;
};



// 这种形式不调用任何构造函数
Point&& f(Point&& param) 
{
	return std::move(param);
}

// 调用一次移动拷贝构造函数
Point f2(Point&& param) 
{
	// 因为返回右值， 所以调用移动拷贝构造函数
	return std::move(param);
}


// 这样是有问题的，相当于返回了一个局部引用
Point&& f3() 
{
	Point param(1, 9);
	return std::move(param);
}

// 这样正不正常 取决于 移动拷贝构造的结构?
// 屏蔽了RVO 不要这样做
Point f4() 
{
	Point param(1, 9);
	return std::move(param);
}

Point f5() 
{
	Point param(1, 9);
	return param;
}

//Point&& f1(Point&& param) 
//{
//	// cannot bind ‘Point’ lvalue to ‘Point&&’
//	return (param);
//}

int main()
{

	//Point p1;

    //f(std::move(p1)); 
	//
    //f2(std::move(p1)); 

	/* 演示返回局部引用的情况 此时是有问题的
	Point&& tmp = f3();
	Point p2;
	cout <<  tmp._x << "\t" << tmp._y << endl;
	*/

	//Point&& tmp = f4();
	//cout <<  tmp._x << "\t" << tmp._y << endl;

	// 这里其实已经是最优化的 
	// RVO  只调用一次构造和析构函数
	Point tmp = f5();
	cout <<  tmp._x << "\t" << tmp._y << endl;

	return 0;
}





