#include <stdio.h>

#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
#define calc3(TYPE, x, y, z) fprintf(stderr, "sizeof("#TYPE"):%lu, offsetof("#TYPE", x):%ld, offsetof("#TYPE", y):%ld, offsetof("#TYPE", z):%ld\n", \
			sizeof(TYPE), offsetof(TYPE, x), offsetof(TYPE, y), offsetof(TYPE, z));
class BaseClass
{
	public:
		virtual void Test()
		{
		}
		virtual void Test1()
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
		virtual void Test1()
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
	calc3(ChildClass, x, y, z);

	pObject->Test();

	//asm("int3");
	//delete pObject;
	return 0;
}
