

#include<cmath>
class Point3d
{
	
	public:
		double magnitude() const;
		//Point3d normalize() const;
		Point3d normalize() ;
		int fun(){ return 10;}
		
	private:
		double _x;
		double _y;
		double _z;
};

// _ZNK7Point3d9magnitudeEv:
double Point3d::magnitude() const
{
	return sqrt(_x * _x + _y * _y + _z * _z);
}


// _ZNK7Point3d9normalizeEv:  // 有const的时候
//Point3d Point3d::normalize() const
//
//_ZN7Point3d9normalizeEv:
Point3d Point3d::normalize()
{
	double mag = magnitude();
	Point3d normal;
	normal._x = _x / mag;
	normal._y = _y / mag;
	normal._z = _z / mag;
	return normal;
}


int main()
{
	Point3d obj;
	Point3d *ptr = &obj;
	Point3d *nullPtr = 0;

	obj.normalize();

	ptr->normalize();

	// 编译通过，但是对于虚函数会崩溃
	// 对于非虚函数，如果不引用成员变量 这里不会崩溃
	nullPtr->fun();

	return 0;
}

