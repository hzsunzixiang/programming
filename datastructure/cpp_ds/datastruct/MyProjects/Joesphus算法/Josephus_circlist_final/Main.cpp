#include<iostream>
#include<stdlib.h>
#include"Circlist.h"
#include<string>
using namespace std;
void main()
{

	CircList<int> clist(1);
	int n,m;
	cout<<"Enter the Number of Contestant:";
	cin>>n;	
	cout<<"the number to count :"<<endl;
	cin>>m;
	for(int i=2;i<=n;i++){
			clist.Insert(i);
	}
	cout<<"the ID of everyone:"<<endl;
	clist.Output();
	clist.Josephus(n,m);
}
