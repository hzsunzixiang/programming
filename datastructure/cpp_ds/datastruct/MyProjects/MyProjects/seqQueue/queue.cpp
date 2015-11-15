#include <iostream.h>
#include<stdlib.h>
#include"seqqueue.h"
int main()
{
	Queue<int> queue(10);	 
    cout<<"******************************"<<endl;   
	cout<<"*selet an item        "<<endl;
	cout<<"*establish a quue,enter'1' "   <<endl;
	cout<<"*Enqueue,enter '2'  "<<endl;
	cout<<"*Dequeue enter '3'    "<<endl;
	cout<<"*quit,enter  '0'          "<<endl;
	cout<<"******************************"<<endl;
	int i;
  do
	{  
		cout<<"ÇëÊäÈëÄãµÄÑ¡Ôñ£º";
		cout<<"1---> establish¡¢2----Enqueue¡¢3----Dequeue¡¢4--->output¡¢0--->quit¡¢"<<endl;
		cin>>i;  
	   switch(i)
	   { 
	      case 1:
			  	cout<<"create a queue"<<endl;
	            cout<<"please enter the number of the queue"<<endl;
				int j,s;
				cin>>s;
		        for(j=0;j<s;j++){
				   cout<<"there is "<<s<<" numbers"<<endl;
			       cout<<"this is the "<<j+1<<"th number"<<endl;
			       int m;
		           cin>>m;
			       queue.EnQueue(m);
				}
			break;
		   case 2: 
			   cout<<"push members into queue:"<<endl;
			   int n,l;
			   cout<<"How many  member you want to enter:"<<endl;
			   cin>>n;
			   for(i=0;i<n;i++){
               cout<<"please enter the "<<i+1 <<"th member you want to push:"<<endl;
               cin>>l;
			   if(queue.EnQueue(l)==0){
				   cout<<"Full!";
                   break;
	              }
			   }
			   if(i==n) cout<<"OK"<<endl;
			   else     cout<<"Not finish"<<endl;
			   break;
		   case 3:
			   cout<<"Dequeue"<<endl;
			   cout<<"How many  member you want to pop"<<endl;
				   int m;
			   cin>>m;
			   for(i=0;i<m;i++){
				   queue.DeQueue();
			   } 
			   cout<<"OK";
			    break;
		   case 4:
			   cout<<"the members in the stack"<<endl; 
               queue.Output();
			   break;
	   }		   
	 }while(i!=0);	
  
	return 0;
}