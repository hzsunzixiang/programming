
//http://blog.csdn.net/yiranant/article/details/47344285
#include<cmath>
#include <iostream>
using namespace std;
class Point3d {  
	public:  
		virtual ~Point3d();  
	public:  
		static Point3d origin;  
		float _x, _y, _z;  
};  
int main()
{
	cout << "&Point3d::_x = " << &Point3d::_x << endl;  
	cout << "&Point3d::_y = " << &Point3d::_y << endl;  
	cout << "&Point3d::_z = " << &Point3d::_z << endl;  
	cout << "sizeof(Point3d) = " << sizeof(Point3d) << endl; 
	return 0;
}

