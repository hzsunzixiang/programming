

#include<cmath>
class Point3d
{
	
	public:
		virtual double magnitude() const;
		virtual Point3d normalize() ;
		virtual int fun(){ return 10;}
		
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


Point3d Point3d::normalize()
{
	double mag = magnitude();
	Point3d normal;
	normal._x = _x / mag;
	normal._y = _y / mag;
	normal._z = _z / mag;
	return normal;
}

// (gdb) info locals 
// obj = {_vptr.Point3d = 0x4008b0 <vtable for Point3d+16>, _x = 0, _y = 2.0732654560068732e-317, _z = 2.0729492539935348e-317}
// ptr = 0x7fffffffe370
// nullPtr = 0x0
int main()
{
	Point3d obj;
	Point3d *ptr = &obj;
	Point3d *nullPtr = 0;

	// 通过对象 
	obj.normalize();

	// 通过指针 
	ptr->normalize();
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

	// 编译通过，但是会崩溃
	// 对于非虚函数，如果不引用成员变量 就不会崩溃
	//nullPtr->fun();

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
