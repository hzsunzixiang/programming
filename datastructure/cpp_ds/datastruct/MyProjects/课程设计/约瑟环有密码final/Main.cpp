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
		  cout<<"你输入的密码，及每个人的编号为："<<endl;
		  clist.Output();
		  cout<<"请输入初始数据：m>0"<<endl;
		  cin>>m;
		  clist.Josephus(n,m);
		  cout<<"如果进入下一轮，请按'y'或'Y'"<<endl;
		  cin>>ch;		  
	  }while(ch=='y'||ch=='Y');
}
