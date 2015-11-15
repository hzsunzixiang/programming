#include<iostream.h>
#include <assert.h>
#include"Shortest.h"
int main()
{
	int sz;
	cout<<"Enter the number of the vertices:"<<endl;
	cin>>sz;
	Graph Sgraph(sz);
	Sgraph.ShortestPath(sz,0);
	cout<<"the vertice 0  to vertice num ; Enter num:"<<endl;
	int num;
	cin>>num;
	Sgraph.Output(num);
	return 1;
}