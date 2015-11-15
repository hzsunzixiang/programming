#include<iostream>
#include<stdlib.h>
#include"list.h"
#include<string>
using namespace std;
int main()
{
	int a=0;
    DblList<int > list(a);
	cout<<"******************************"<<endl;   
	cout<<"*please select your service"<<endl;
	cout<<"*establish   '1'  "<<endl;
	cout<<"*insert      '2'  "<<endl;
	cout<<"*remove      '3'  "<<endl;
	cout<<"*Output      '4'  "<<endl;
	cout<<"*MakeEmpty   '5'  "<<endl;
	cout<<"*find member '6'  "<<endl;
	cout<<"*find maximum'7'  "<<endl;
	cout<<"*quit        '0'  "<<endl;
	cout<<"******************************"<<endl;
	cout<<"请输入你的选择：";
	int i; 
	do{  
		cout<<"请输入你的选择："<<endl;
		cout<<"1---> establish、2----insert、3----remove、"<<endl<<"4--->output、5--MakeEmpty、6--find、7--find maximum、0--->quit、"<<endl;
		cin>>i;  
	   switch(i)
	   { 
	      case 1:
			  list.Createlist();
			  break;
		   case 2: 
			   list.Insert();
			   break;
		   case 3:
			   list.RemoveElement();
			   cout<<"OK"<<endl;
			    break;
		   case 4:
			   cout<<"Output!"<<endl;
               list.Output();
			   break;
		   case 5:
			   list.MakeEmpty();
			   break;
		   case 6:
			   cout<<"the elment you want to find:"<<endl;
			   list.FindElement();
			   break;
		   case 7:
			   list.MaxOfAll();
			   break;
		   default: cout<<"please input a number 0--7"<<endl;
	   }		   
	 }while(i!=0);	
	return 0;
}

   