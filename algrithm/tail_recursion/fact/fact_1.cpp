#include<iostream>
using namespace std;

// A NON-tail-recursive function. The function is not tail
// recursive because the value returned by fact(n-1) is used in
// fact(n) and call to fact(n-1) is not the last thing done by fact(n)
unsigned int fact(unsigned int n)
{
	if (n == 0) return 1;

	return n*fact(n-1);
}

// Driver program to test above function
int main()
{
	cout << fact(5);
	return 0;
}

