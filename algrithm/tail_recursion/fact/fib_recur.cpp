#include<iostream>
#include<cstdint>
using namespace std;




uint64_t Fibonacci(int n)
{
	if ( n == 0 )
		return 0;
	else if ( n == 1 )
		return 1;
	else
		return ( Fibonacci(n-1) + Fibonacci(n-2) );
} 

int main()
{
	// 无法计算
	//cout << Fibonacci(100) << endl;
	// 
	cout << Fibonacci(48) << endl;
	return 0;
}
