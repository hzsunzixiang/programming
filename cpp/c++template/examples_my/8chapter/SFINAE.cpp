

#include <iostream>
using namespace std;

typedef char RT1;
typedef struct { char a[2]; } RT2;

//    template<typename C> static One test(int C::*);
// template<typename T> RT1 test(typename T::*)
template<typename T> RT1 test(typename T::X const*)
{
	RT1 x = 100;
	return x; 
}
template<typename T> RT2 test(...)
{
	RT2 x; 
	return x;
}



#define type_has_member_type_X(T)  (sizeof(test<T>(0)) == 1)


class MyClass {
	public:
		typedef int X;
};
int main()
{
	//bool classType = type_has_member_type_X(MyClass);
	//bool intType = type_has_member_type_X(int);
	RT1 res = test<MyClass>(0);
	bool classType = (sizeof(test<MyClass>(0)) == 1);
	bool intType = (sizeof(test<int>(0)) == 1);

	cout << "classType: " << classType  << "\tintType\t" << intType << endl; 
	cout << "res:\t" << res << endl;
	return 0;
}
