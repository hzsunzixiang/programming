#include <iostream>
using namespace std;

int non_const_c = 666666;
int *non_const_bp;
//const int const_a = 555555;
int const_a = 555555;
int main () 
{
	//print (const_i);
	cout << "-------------------global--------------------" << endl;
	// 如果 const_a 为 global 则报段错误
	non_const_bp = const_cast<int*>(&const_a);
	*non_const_bp = 777777; //not working why??
	cout<<"\nConst Cast: " << const_a << "  " << &const_a;
	cout<<"\nConst Cast: " << *non_const_bp << "  " << non_const_bp;
	cout<<"\nConst Cast: " << const_a<<"  "<<&const_a << endl;;

	return 0;
}
