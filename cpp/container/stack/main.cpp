

#include <iostream>
#include <stack>
#include <cstdio>

using namespace std;



int main()
{
	stack<int> s;
	for(int i=0; i<5; i++)
	{
		s.push(i+100);
	}
	printf("size:%ld\n", s.size());
	while(!s.empty())
	{
		printf("%d\n", s.top());
		s.pop();
	}
	printf("size:%ld\n", s.size());
	return 0;
}
