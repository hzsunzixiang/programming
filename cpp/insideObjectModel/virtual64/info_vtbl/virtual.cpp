


class BaseClass
{
	public:
		virtual void Test()
		{
		}
	public:
		int x;
	public:
		virtual ~BaseClass(){}
		//如果没有虚析构函数 32位下面没有报错
		//warning: deleting object of polymorphic class type ‘ChildClass’ which has non-virtual destructor might cause undefined behaviour [-Wdelete-non-virtual-dtor]
		 
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
	public:
		int y;
		int z;
	public:
		~ChildClass(){}
};

typedef int UnusedType, UsedType;

int main(int argc, char **argv)
{
	BaseClass *pObject0 = new BaseClass();
	ChildClass *pObject = new ChildClass();
	pObject0->Test();
	pObject->Test();

	//asm("int3");
	delete pObject;
	return 0;
}
