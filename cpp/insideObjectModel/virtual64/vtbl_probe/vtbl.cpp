#include <iostream>
using namespace std;

class base_class
{
	public:
		base_class()
		{
			x = 100;
			cout << "This is  base_class's Constructor()" << endl;
		}
		virtual ~base_class()
		{
			x = -100;
			cout << "This is  base_class's Deconstructor()" << endl;
		}

		int normal_func()
		{
			cout << "This is  base_class's normal_func()" << endl;
			return 0;
		}
		virtual int virtual_fuc()
		{
			cout << "This is  base_class's virtual_fuc()" << endl;
			return 0;
		}
		int x;

};

class drived_class1 : public base_class
{
	public:
		drived_class1()
		{
			y = 200;
			cout << "This is  drived_class1's Constructor()" << endl;
		}
		~drived_class1()
		{
			y = -200;
			cout << "This is  drived_class1's Deconstructor()" << endl;
		}

		int normal_func()
		{
			cout << "This is  drived_class1's normal_func()" << endl;
			return 0;
		}
		virtual int virtual_fuc()
		{
			cout << "This is  drived_class1's virtual_fuc()" << endl;
			return 0;
		}
		int y;
};

class drived_class2 : public base_class
{
	public:
		drived_class2()
		{
			z = 300;
			cout << "This is  drived_class2's Constructor()" << endl;
		}
		~drived_class2()
		{
			z = -300;
			cout << "This is  drived_class2's Deconstructor()" << endl;
		}

		int normal_func()
		{
			cout << "This is  drived_class2's normal_func()" << endl;
			return 0;
		}
		virtual int virtual_fuc()
		{
			cout << "This is  drived_class2's virtual_fuc()" << endl;
			return 0;
		}
		int z;
};


int main()
{
	base_class * pbc = NULL;
	cout << "---------------------------------------------" << endl;
	base_class bc;
	cout << "---------------------------------------------" << endl;
	drived_class1 dc1;
	cout << "---------------------------------------------" << endl;
	drived_class2 dc2;
	cout << "---------------------------------------------" << endl;

	pbc = &bc;
	pbc->normal_func();
	pbc->virtual_fuc();

	cout << "---------------------------------------------" << endl;
	pbc = &dc1;
	pbc->normal_func();
	pbc->virtual_fuc();

	cout << "---------------------------------------------" << endl;
	pbc = &dc2;
	pbc->normal_func();
	pbc->virtual_fuc();
	cout << "---------------------------------------------" << endl;
	return 0;

}
