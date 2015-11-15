#include <iostream.h>
#include<stdlib.h>
#include"stack.h"
int main()
{
	Stack<char> stack;	
	int flag;
    cout<<"******************************"<<endl;   
	cout<<"*selet an item                  "<<endl;
	cout<<"*establish a stack,enter'1'     "<<endl;
	cout<<"*inverse outputing      '2'     "<<endl;
	cout<<"*match or not           '3'     "<<endl;
	cout<<"*quit,enter             '0'     "<<endl;
	cout<<"******************************"<<endl;
	int i;
	do
	{  
		cout<<"please select an item��";
		cout<<"1---> establish、2---inverse outputing、3、match or not、0--->quit、"<<endl;
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

	   }	   
	   }while(i!=0);
			return 0;
	
}




