#include <iostream.h>
#include<stdlib.h>
#include"stack.h"
int main()
{
	Stack<int> stack(3);	 
    cout<<"******************************"<<endl;   
	cout<<"*selet an item        "<<endl;
	cout<<"*establish a stack,enter'1' "   <<endl;
	cout<<"*push a new member,enter '2'  "<<endl;
	cout<<"*pop a number enter '3'    "<<endl;
	cout<<"*quit,enter  '0'          "<<endl;
	cout<<"******************************"<<endl;
	int i;
	do
	{  
		cout<<"ÇëÊäÈëÄãµÄÑ¡Ôñ£º";
		cout<<"1---> establish¡¢2----push¡¢3----pop¡¢4--->output¡¢0--->quit¡¢"<<endl;
		cin>>i;  
	   switch(i)
	   { 
	      case 1:
			  	cout<<"create a stack"<<endl;
	            cout<<"please enter the number of the stack"<<endl;
				int j,s;
				cin>>s;
		        for(j=0;j<s;j++){
				   cout<<"there is "<<s<<" numbers"<<endl;
			       cout<<"this is the "<<j+1<<"th number"<<endl;
			       int m;
		           cin>>m;
			       stack.Push(m);
				}
			break;
		   case 2: 
			   cout<<"push members into stack:"<<endl;
			   int n,l;
			   cout<<"How many  members you want to push:"<<endl;
			   cin>>n;
			   for(i=0;i<n;i++){
               cout<<"please enter the "<<i+1 <<"th member you want to push:"<<endl;
               cin>>l;
			   //if(stack.IsFull()){
				  // cout<<"Full!"<<endl;
				  // cout<<"2 times of the origin:"<<endl;  
				   //stack.Stackfull();
				   stack.Push(l); 
	              //}
			   } 
			   
			   //if(i==n) cout<<"OK"<<endl;
			  // else     cout<<"Not finish"<<endl;
			   break;
		   case 3:
			   cout<<"pop members"<<endl;
			   cout<<"How many  member you want to pop"<<endl;
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




