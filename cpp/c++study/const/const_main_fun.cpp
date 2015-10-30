


#include <iostream>
using namespace std;



void ConstCaseFun(int const * data)
{
	int * tmp = const_cast<int *>(data);	
	*tmp = 111111;
}

int non_const_c = 666666;
int *non_const_bp;
const int const_a = 555555;

// 全局变量 const  coredump  局部变量不会 
int main () 
{
	const int const_a_local = 77777;
	cout << "const_a_local\t" << const_a_local << endl;

	// ConstCaseFun(&const_a); // Segmentation fault (core dumped)
	ConstCaseFun(&non_const_c); 
	ConstCaseFun(&const_a_local); 
	

	cout << "non_const_c\t" << non_const_c << endl;
	cout << "const_a_local\t" << const_a_local << endl;
	return 0;
}
