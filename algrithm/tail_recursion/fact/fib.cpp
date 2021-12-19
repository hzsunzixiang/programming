#include<iostream>
#include<cstdint>
using namespace std;

uint64_t tail_fib(uint64_t n, uint64_t result, uint64_t next);

uint64_t tail_fib(uint64_t n, uint64_t result, uint64_t next)
{
	if(n==0) 
		return result;
	tail_fib(n-1, next, result + next);
}

uint64_t fib(uint64_t n)
{
	return tail_fib(n, 0, 1);
}



// Driver program to test above function
int main()
{
	cout << fib(100) << endl;
	return 0;
}
