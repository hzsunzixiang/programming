#include <iostream.h>
#include<stdlib.h>
#include"Lqueue.h"
int main()
{
	Queue<int> queue;	 
    cout<<"******************************"<<endl;   
	cout<<"*selet an item        "<<endl;
	cout<<"*establish a quue,enter'1' "   <<endl;
	cout<<"*output enter           '4'  "<<endl;
	cout<<"*quit,enter             '0'          "<<endl;
	cout<<"******************************"<<endl;
	int i;
    do{  
		cout<<"ÇëÊäÈëÄãµÄÑ¡Ôñ£º";
		cout<<"1---> establish¡¢2----game(int)¡¢3----game()¡¢4--->output¡¢0--->quit¡¢"<<endl;
		cin>>i;  
	   switch(i)
	   { 
	      case 1:
			  	cout<<"create a queue"<<endl;
	            cout<<"please enter the number of the card:"<<endl;
				int s,j,Flag ;
				Flag=1;
				cin>>s;
		        for(j=1;j<=s;j++){
			       queue.EnQueue(j,Flag);
				}
				cout<<"OKey"<<endl;
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