
//http://blog.csdn.net/yiranant/article/details/47344285
#include<cmath>
#include<cstdio>
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
	// 这样打印是错误的  必须使用printf
	// cout << "&Point3d::_x = " << &Point3d::_x << endl;  
	// cout << "&Point3d::_y = " << &Point3d::_y << endl;  
	// cout << "&Point3d::_z = " << &Point3d::_z << endl;  
	// cout << "sizeof(Point3d) = " << sizeof(Point3d) << endl; 

	// One way to do that is (I'm not sure it's portable) :

	// 	void TestClass::PrintMyFuncAddress(void)
	// 	{
	// 		void (TestClass::* ptrtofn)() = &TestClass::MyFunc;
	// 		cout << (void*&)ptrtofn<< endl;
	// 	}
	printf("&Point3d::_x = %d\n",  &Point3d::_x);
	printf("&Point3d::_y = %d\n",  &Point3d::_y);
	printf("&Point3d::_z = %d\n",  &Point3d::_z);
	return 0;
}

