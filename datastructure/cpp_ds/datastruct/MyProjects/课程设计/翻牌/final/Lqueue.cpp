#include <iostream.h>
#include<stdlib.h>
#include"Lqueue.h"
int main()
{
	Queue<int> queue;	 
    cout<<"******************************"<<endl;   
	cout<<"*selet an item        "<<endl;
	cout<<"*enter the number  of the card:enter'1'"   <<endl;
	cout<<"*output                        enter'4'"<<endl;
	cout<<"*quit,                         enter'0'"<<endl;
	cout<<"******************************"<<endl;
	int i,s;
    do{  
		cout<<"ÇëÊäÈëÄãµÄÑ¡Ôñ£º";
		cout<<"1---> enter the number¡¢2----game(int)¡¢3----game()¡¢4--->output¡¢0--->quit¡¢"<<endl<<endl<<endl;
		cin>>i;  
	   switch(i)
	   { 
	      case 1:
			  s=queue.CreateQueue() ;
			break;
		  case 2:
			   queue.Game(s);
			    break;
		   case 3:
			   cout<<"the result:"<<endl;
			   queue.Game();
			    break;
		   case 4:
			   cout<<"the members in the queue"<<endl; 
               queue.Output();
			   break;
	   }		   
	 }while(i!=0);	
  
	return 0;
}