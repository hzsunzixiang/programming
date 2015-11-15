#include <iostream.h>
#include<stdlib.h>
#include"Lqueue.h"
int main()
{
	Queue<int> queue;	 
    cout<<"******************************"<<endl;   
	cout<<"*     选择选项：       "<<endl;
	cout<<"*输入牌的数目，    请按'1' "<<endl;
	cout<<"*打印结果          请按'2' "<<endl;
	cout<<"*退出              请按'0' "<<endl;
	cout<<"******************************"<<endl;
	int i,s;
    do{  
		cout<<"请输入你的选择：";
		cout<<"1---> 输入牌的数目、2----打印结果、0--->退出、"<<endl;
		cin>>i;  
	   switch(i)
	   { 
	      case 1:
			  s=queue.CreateQueue();
			break;
		  case 2:
			   queue.Game(s);
			   break;
	   }		   
	 }while(i!=0);	
	return 0;
}