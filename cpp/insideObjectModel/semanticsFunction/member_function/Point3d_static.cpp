#include<cstdio>
#include<cmath>
#include <typeinfo> 

class Point3d
{
	
	public:
		virtual double magnitude() const;
		virtual Point3d normalize() ;
		//静态成员函数可以作为callback
		//取地址，
		static int fun(int i){ return 10 + i;}
		int bar(int i){ return 10 + i;}
		// 静态成员函数 不需要经由 class object才被调用
		// 静态成员不可能做到
	    // 1. const volatile virtual  修饰 2. 访问 nostatic
		// 1. 这里不合法
		//static int constFun()const{ return 10;}
		// Point3d_static.cpp:17:24: error: static member function ‘static int Point3d::constFun()’ cannot have cv-qualifier
		// static int constFun()const{ return 10;}
		// 
		// 2. 这里不合法
		//static int accessMemData(){ return _x;}
		// Point3d_static.cpp: In static member function ‘static int Point3d::accessMemData()’:
		// Point3d_static.cpp:26:10: error: invalid use of member ‘Point3d::_x’ in static member function
		//    double _x;
		//           ^
		// Point3d_static.cpp:23:38: error: from this location
		//    static int accessMemData(){ return _x;}
		// 
		// 3. 这里不合法
		// virtual static int accessMemData(){ return 10;}
		// Point3d_static.cpp:33:36: error: member ‘accessMemData’ cannot be declared both virtual and static
		//virtual static int accessMemData(){ return 10;}

		
	private:
		double _x;
		double _y;
		double _z;
};

// virtual double magnitude() const;
// _ZNK7Point3d9magnitudeEv:
double Point3d::magnitude() const
{
	return sqrt(_x * _x + _y * _y + _z * _z);
}


// virtual Point3d normalize() ;
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

	// 通过对象 
	// call	_ZN7Point3d9normalizeEv
	obj.normalize();

	// 通过指针 
	// call	*%rax
	// ptr的位置 在编译时已经决定了 要访问的 虚函数表的位置(slot), 
	ptr->normalize();

	// 都是静态调用  无虚函数 调用方式一样
	
	//call	_ZN7Point3d3funEi
	ptr->fun(1);
	nullPtr->fun(1);
	Point3d::fun(1);
	
	printf("&fun: %p\n", &Point3d::fun);
	printf("&bar: %p\n", &Point3d::bar);  // Point3d_static.cpp:56:36: warning: format ‘%p’ expects argument of type ‘void*’, but argument 2 has type ‘int (Point3d::*)(int)’ [-Wformat=]
	printf("typeid fun: %s\n", typeid(Point3d::fun).name());
	//printf("typeid bar: %s\n", typeid(Point3d::bar).name()); // error: invalid use of non-static member function ‘int Point3d::bar(int)’ 

	return 0;
}

//	call	_ZN7Point3d9normalizeEv  // 对象调用直接是静态调用 区别于指针和引用调用
//	.loc 1 40 0
//	movq	-8(%rbp), %rax  // 获取虚函数指针
//	movq	(%rax), %rax    // 获取虚函数表
//	addq	$8, %rax        // 知道对应的虚函数位置 64位下 +8
//	movq	(%rax), %rax    // 取出相应的虚函数 
//	leaq	-80(%rbp), %rdx
//	movq	-8(%rbp), %rcx
//	movq	%rcx, %rsi
//	movq	%rdx, %rdi
//	call	*%rax           // 调用对应的虚函数
//
//
//
//
//
// 如果是非虚成员函数
//
// call	_ZN7Point3d9normalizeEv
// .loc 1 45 0
// leaq	-32(%rbp), %rax
// movq	-8(%rbp), %rdx
// movq	%rdx, %rsi
// movq	%rax, %rdi
// call	_ZN7Point3d9normalizeEv
// 
