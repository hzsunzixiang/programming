#include <iostream.h>
#include<stdlib.h>
#include"stack.h"
int main()
{
	Stack<char> stack(10),stack1(10);	 
    cout<<"******************************"<<endl;   
	cout<<"*selet an item        "<<endl;
	cout<<"*establish a stack,enter'1'  "<<endl;
	cout<<"*Output                 '2'  "<<endl;
	cout<<"*is or not recurve      '3'  "<<endl;
	cout<<"*quit,enter             '0'  "<<endl;
	cout<<"******************************"<<endl;
	int i;
	do
	{  
		cout<<"ÇëÊäÈëÄãµÄÑ¡Ôñ£º";
		cout<<"1---> establish¡¢2----Output¡¢3----is or not  recurve¡¢0--->quit¡¢"<<endl;
		cin>>i;  
	   switch(i)
	   { 
	      case 1:
			  stack.CreateStack();
			break;
		   case 2:
			   cout<<"the elements in the stack"<<endl; 
               stack.Output();
			   break;
		   case 3:
			   stack.Recurve();
			   break;
		   default:
			   cout<<"please enter a number between 0--3"<<endl;
	   }
	   }while(i!=0);
			return 0;
	
}




