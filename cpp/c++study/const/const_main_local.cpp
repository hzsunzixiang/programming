#include <iostream>
using namespace std;

int main () 
{
	// 全局变量会报错
	// 局部变量没问题

	cout << "-------------------local--------------------" << endl;
	//const int const_local = 555555;
	int const_local = 555555;
	int *non_const_local = const_cast<int*>(&const_local);
	*non_const_local = 777777; //not working why??

	cout<<"\nConst Cast: " << const_local<< "  " << &const_local;
	cout<<"\nConst Cast: " << *non_const_local << "  " << non_const_local;
	cout<<"\nConst Cast: " << const_local<<"  " << &const_local << endl;;



	return 0;
}


// -28(%rbp) 中存放 const_local
// -24(%rbp) 中存放 non_const_local
//
//	movl	$555555, -28(%rbp)
//	leaq	-28(%rbp), %rax
//	movq	%rax, -24(%rbp)
//	movq	-24(%rbp), %rax
//	movl	$777777, (%rax)
