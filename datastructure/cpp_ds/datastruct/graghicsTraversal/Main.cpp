#include <iostream.h>
#include<stdlib.h>
#include<process.h>
#include"graghics.h"
int main()
{

	//const int num=9;
	int num;
	cout<<"Enter the number of the vertices:"<<endl;
	cin>>num;
	Graph<int,int> graghic(num);
	graghic.DFS () ;
	graghic.BFS(0);

   return 1;
}