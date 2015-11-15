#include <iostream.h>
#include<stdlib.h>
#include"Lqueue.h"
int main()
{
	Queue<int> queue,queue1;	 
    cout<<"******************************"<<endl;   
	cout<<"*selet an item        "<<endl;
	cout<<"*establish a quue,enter'1' "   <<endl;
	cout<<"*output enter           '4'  "<<endl;
	cout<<"*quit,enter             '0'          "<<endl;
	cout<<"******************************"<<endl;
	int i;
    do{  
		cout<<"ÇëÊäÈëÄãµÄÑ¡Ôñ£º";
		cout<<"1---> establish¡¢2----output¡¢3--->Decard¡¢4¡¢DeCard(queue)¡¢5¡¢Result¡¢0--->quit¡¢"<<endl;
		cin>>i;  
	   switch(i)
	   { 
	      case 1:
			  queue.CreatQueue();
			break;
		   case 2:
			   cout<<"the members in the queue"<<endl; 
               queue.Output();
			   break;
		   case 3:
			   queue.DeCard();
			   break;
		   case 4:
			  queue.DeCard(queue1);
			   break;
		   case 5:
			   queue1.Result();
			   break;
	   }		   
	 }while(i!=0);	
	return 0;
}