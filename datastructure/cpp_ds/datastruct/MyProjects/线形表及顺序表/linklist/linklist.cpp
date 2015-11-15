#include<iostream>
#include<stdlib.h>
#include"list.h"
#include<string>
using namespace std;
int main()
{
    List<int> list(0) ;
	cout<<"******************************"<<endl;   
	cout<<"*please select your service"<<endl;
	cout<<"*establis '1'              "<<endl;
	cout<<"*insert '2'                "<<endl;
	cout<<"*remove '3'                "<<endl;
	cout<<"*Output '4'                "<<endl;
	cout<<"*quit '0'                   "<<endl;
	cout<<"******************************"<<endl;
	cout<<"ÇëÊäÈëÄãµÄÑ¡Ôñ£º";
	int i; 
	do{  
		cout<<"ÇëÊäÈëÄãµÄÑ¡Ôñ£º";
		cout<<"1---> establish¡¢2----insert¡¢3----remove¡¢4--->output¡¢0--->quit¡¢"<<endl;
		cin>>i;  
	   switch(i)
	   { 
	      case 1:
			list.Createlist();
			break;
		   case 2: 
			   cout<<"insert!"<<endl;
			   cout<<"How many member you want to put"<<endl;
			   int n;
			   cin>>n;
			   for(i=0;i<n;i++){
				   int s;
				   cout<<"please input number you want to insert: "<<endl;
				   cin>>s;
				   cout<<"the location you want to insert:"; 
				   int loc;
				   cin>>loc;
				   if(list.Insert(s,loc-1)==0) {
					   cout<<"²åÈëÊ§°Ü£¡"<<endl;
					   continue;
				   }

			       cout<<"succeed!"<<endl;  
			   }
				   break;
		   case 3:
			   cout<<"Romove"<<endl;
			   cout<<"How many members  you want to remove"<<endl;
			   int num;
			   cin>>num;
			   for( i=0;i<num;i++){
				   int loc;
				   cin>>loc;
				   cout<<"please input the location you want to remove"<<endl;
				   list.Remove(loc);
			   }
			   cout<<"OK"<<endl;
			    break;
		   case 4:
			   cout<<"Insert";
               list.Output();
			   break;
		   default: cout<<"please input a number 0--4"<<endl;
	   }		   
	 }while(i!=0);	
	return 0;
}

   
