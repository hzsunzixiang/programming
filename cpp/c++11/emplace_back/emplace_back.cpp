

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
			cout << "copy constructor Point" << endl;
		}

		Point(const Point&& o)
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
	public:
		double _x,_y;
};


int main()
{

	std::vector<Point> test;

	// 两次普通构造两次析构
	/**
	Point p1(1,2);
	test.push_back(p1);
	**/

	// 一次拷贝构造，一次移动构造
	//test.push_back(Point());

	//也是 一次拷贝构造，一次移动构造
	// 调用 移动copy 构造函数
	//test.emplace_back(Point());

	// 只有一次拷贝构造
	test.emplace_back(1);

	//test.emplace_back(1,2);

	// 语法错误
	//test.push_back(1,2);

	cout << test[0]._x << "\t" << test[0]._y << endl;


	return 0;
}





