#include<iostream>
#include<stdlib.h>
#include"Circlist.h"
#include<string>
using namespace std;
void main()
{	
	char ch;
	CircList<int> clist;
	  do{ 
		  clist.MakeEmpty();
		  int n,m;
		  n=clist.Createlist();
		  clist.Output();
		  cout<<"the number to count:"<<endl;
		  cin>>m;
		  clist.Josephus(n,m);
		  cout<<"如果进入下一轮，请按'y'或'Y'"<<endl;
		  cin>>ch;		  
	  }while(ch=='y'||ch=='Y');
}
