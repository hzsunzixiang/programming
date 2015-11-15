#include <stdio.h>
#include <iostream.h>
#include <iomanip.h>
#include "queue.h"

void Yanghui(int n)
{
	Queue<int> q;q.MakeEmpty();
	q.EnQueue(1);q.EnQueue(1);
	int s=0;
	int char_gap=2;
	cout<<"队列应用:打印二项展开式的系数!"<<endl;
	for(int i=1;i<=n;i++)
	{
		cout<<endl;
		q.EnQueue(0);
		
		for(int j=1;j<=i+2;j++)
		{
			int t=q.DeQueue();
			q.EnQueue(s+t);
			s=t;
			if(j!=i+2){
				if(j==1)
					cout<<setw(char_gap*(n-i));
				cout<<s<<setw(4);}
		}
			cout<<endl;
	}
	cout<<endl;
}

void main()
{
	int m=10;
	Yanghui(m);
}