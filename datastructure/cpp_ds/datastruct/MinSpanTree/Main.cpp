#include <iostream.h>
#include<stdlib.h>
#include<process.h>
#include"MinSpanTree.h"
int main()
{
	
	//const int num=7;
	int num;
	cout<<"Enter the number of vertices:"<<endl;
	cin>>num;
	Graph<int,int> graghic(num);
	graghic.Kruskal();
	
	return 1;
}