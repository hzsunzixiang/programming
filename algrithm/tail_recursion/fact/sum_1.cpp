#include<iostream>
using namespace std;

// A NON-tail-recursive function. The function is not tail
// recursive because the value returned by sum(n-1) is used in
// sum(n) and call to sum(n-1) is not the last thing done by sum(n)
unsigned int sum(unsigned int n)
{
	if (n == 0) return 0;

	return n + sum(n-1);
}

// Driver program to test above function
int main()
{
	cout << sum(50000) << endl;
	return 0;
}

