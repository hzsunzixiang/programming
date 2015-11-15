#include <iostream.h>
#include<stdlib.h>
#include"stack.h"
int main()
{
	Stack<int> stack(10);	 
    cout<<"******************************"<<endl;   
	cout<<"*select an item        "<<endl;
	cout<<"*establish a stack,enter'1' "   <<endl;
	cout<<"*push a new member,enter '2'  "<<endl;
	cout<<"*pop a number enter '3'    "<<endl;
	cout<<"*quit,enter  '0'          "<<endl;
	cout<<"******************************"<<endl;
	int i;
	do
	{  
		cout<<"请输入你的选择：";
		cout<<"1---> establish、2----push、3----pop、4--->output、0--->quit、"<<endl;
		cin>>i;  
		try
	{
		char i;
		throw(i);
	}
	catch(char ex)
	{
		cout << "捕获到a = " << ex <<endl;
	}

	   switch(i)
	   { 
	      case 1:
			  	cout<<"create a stack"<<endl;
	            cout<<"please enter the number of the stack"<<endl;
				int j,s;
				cin>>s;
		        for(j=0;j<s;j++){
				   cout<<"there is "<<s<<"numbers"<<endl;
			       cout<<"this is the "<<j+1<<"th number"<<endl;
			       int m;
		           cin>>m;
			       stack.Push(m);
				}
			break;
		   case 2: 
			   cout<<"push a member into stack:"<<endl;
			   cout<<"please enter the number you want to push:"<<endl;
               int n;
			   cin>>n;
               stack.Push(n);
			   cout<<"OK";
			   break;
		   case 3:
			   cout<<"pop members";
			   cout<<"please enter the number of you want to pop";
				   int m;
			   cin>>m;
			   for(i=0;i<m;i++){
				   stack.Pop();
			   } 
			   cout<<"OK";
			    break;
		   case 4:
			   cout<<"the members in the stack"<<endl; 
               stack.Output();
			   break;
	   }
		   
	   }while(i!=0);
			return 0;
	
}




