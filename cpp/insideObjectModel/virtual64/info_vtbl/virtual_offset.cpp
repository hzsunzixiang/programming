#include <stdio.h>




// invalid access to non-static data member ‘BaseClass::x’  of NULL object [-Winvalid-offsetof]

//http://stackoverflow.com/questions/3129916/what-is-wrong-with-this-use-of-offsetof

//    -Wno-invalid-offsetof (C++ and Objective-C++ only)
//
//    Suppress warnings from applying the ‘offsetof’ macro to a non-POD type.
//
//    According to the 1998 ISO C++ standard, applying ‘offsetof’ to a non-POD type is undefined. In existing C++ implementations, however, ‘offsetof’ typically gives meaningful results even when applied to certain kinds of non-POD types. (Such as a simple ‘struct’ that fails to be a POD type only by virtue of having a constructor.) This flag is for users who are aware that they are writing nonportable code and who have deliberately chosen to ignore the warning about it.
//
//    The restrictions on ‘offsetof’ may be relaxed in a future version of the C++ standard.

#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
#define calc3(TYPE, x, y, z) fprintf(stderr, "sizeof("#TYPE"):%lu, offsetof("#TYPE", x):%ld, offsetof("#TYPE", y):%ld, offsetof("#TYPE", z):%ld\n", \
			sizeof(TYPE), offsetof(TYPE, x), offsetof(TYPE, y), offsetof(TYPE, z));
class BaseClass
{
	public:
		virtual void Test()
		//void Test()
		{
		}
		void Test1()
		{
		}
	public:
		int x;
};

class ChildClass : public BaseClass
{
	public:
		//virtual void Test()
		void Test()
		{
			int a = 1;
			int b = 2;
			y = a + b;
		}
		//virtual void Test1()
		void Test1()
		{
		}
	public:
		int y;
		int z;
};

typedef int UnusedType, UsedType;

int main(int argc, char **argv)
{
	BaseClass *pObject0 = new BaseClass();
	ChildClass *pObject = new ChildClass();
	// 在32位下实验
	// BaseClass 中没有virtual关键字时
	// sizeof(ChildClass):12, offsetof(ChildClass, x):0, offsetof(ChildClass, y):4, offsetof(ChildClass, z):8
	// BaseClass 中有virtual关键字时
	// sizeof(ChildClass):16, offsetof(ChildClass, x):4, offsetof(ChildClass, y):8, offsetof(ChildClass, z):12


	// 64位下面, 虚函数 ,按8字节(指针长度)对齐
	// sizeof(ChildClass):24, offsetof(ChildClass, x):8, offsetof(ChildClass, y):12, offsetof(ChildClass, z):16
	// 64位， 非虚函数
	// sizeof(ChildClass):12, offsetof(ChildClass, x):0, offsetof(ChildClass, y):4, offsetof(ChildClass, z):8
	//

	calc3(ChildClass, x, y, z);

	pObject->Test();


	//asm("int3");
	//delete pObject;
	return 0;
}
