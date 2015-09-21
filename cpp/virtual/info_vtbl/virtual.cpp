class BaseClass
{
	public:
		virtual void Test()
		{
		}
	public:
		int x;
};

class ChildClass : public BaseClass
{
	public:
		virtual void Test()
		//void Test()
		{
			int a = 1;
			int b = 2;
			y = a + b;
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
	pObject->Test();

	asm("int3");
	delete pObject;
	return 0;
}
