#include <iostream>

using namespace std;


int main()
{
	int x = 100;
	int y = 200;
	int &z = x;
	z = y;   // 这里相当于重新赋值 引用仍然 指向 x  对类也一样
	cout <<  "z: " << z <<endl;

	return 0;
}
