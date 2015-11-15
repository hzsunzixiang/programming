#include <iostream.h>
#include<stdlib.h>
#include"stack.h"
int main()
{
	char ch;
	do{
	Stack<char> stack;	
	int flag;
    cout<<"******************************"<<endl;   
	cout<<"*selet an item                  "<<endl;
	cout<<"*input,enter'1'     "<<endl;
	cout<<"*inverse outputing      '2'     "<<endl;
	cout<<"*match or not           '3'     "<<endl;
	cout<<"*进入下一轮比较：          '0'     "<<endl;
	cout<<"******************************"<<endl;
	int i;
	do
	{  
		cout<<"please select an item：";
		cout<<"1---> input、2---inverse outputing、3、match or not、0--->quit、"<<endl;
		cin>>i;  
	   switch(i)
	   { 
	      case 1:
			  flag=stack.CreateStack();
			break;
		   case 2:
               stack.Output();
			   break;
		   case 3:
			   stack.Match(flag);
			   break;
		   case 0:
			   stack.MakeEmpty();
	   }	   
	   }while(i!=0);
	cout<<"continue enter 'y',or else enter 'n'"<<endl;;
	cin>>ch;
	}while(ch=='y');
			return 0;
	
}




