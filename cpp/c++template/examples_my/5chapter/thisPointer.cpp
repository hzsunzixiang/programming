


// For class templates with base classes, using a name x by itself is not always equivalent to his->x, even though a
// member x is inherited. For example:

#include <iostream>
using namespace std;

void foo()   // 没有这个函数将会报错
{
	cout << "in extern foo"  << endl;
}

template <typename T>
class Base {
	public:
		void foo()
		{
			cout << "in class foo"  << endl;
		}
};
template <typename T>
class Derived : Base<T> {
	public:
		void bar() {
			foo(); // calls external exit() or error
		}
};
int main()
{
	// StephenSun@debian:~/programming/cpp/c++template/examples_my/5chapter$ ./thisPointer
	// in extern foo

	Derived<int> d;
	d.bar();
	return 0;
}
