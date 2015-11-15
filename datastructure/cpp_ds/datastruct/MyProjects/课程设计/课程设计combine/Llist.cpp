#include<iostream.h>
#include<stdlib.h>
#include"list.h"
#include<string>
using namespace std;
int main()
{
    List list(0) ;
	List list1(0),list2(0);
	cout<<"******************************"<<endl;   
	cout<<"*please select your service"<<endl;
	cout<<"*establish   '1'  "<<endl;
	cout<<"*output      '2'  "<<endl;
	cout<<"*combine      '3'  "<<endl;
	cout<<"*sort      '4'  "<<endl;  
	cout<<"*quit        '0'  "<<endl;
	cout<<"******************************"<<endl;
	cout<<"请输入你的选择：";
	int i; 
	do{  
		cout<<"请输入你的选择："<<endl;
		cout<<"1---> establish、2----output、3----combine、"<<"4--->sort、0--->quit、"<<endl;
		cin>>i;  
	   switch(i)
	   { 
	      case 1:
			list.Createlist();
			break;
		   case 2:
			   cout<<"Output!"<<endl;
               list.Output();
			   break;
		   case 3:
			    cout<<"creat a list:"<<endl;
	            list1.Createlist();
				cout<<"Combine!"<<endl;
	            list.Combine(list1);
				break;
		   case 4:
			   list.sort(list2);
			   list2.Output();
			   break;
		   default: cout<<"please input a number 0--7"<<endl;
	   }		   
	 }while(i!=0);	
	return 0;
}

   
