#include<iostream>
#include<stdlib.h>
#include"list.h"
#include<string>
using namespace std;
int main()
{
    DblList<int> list(0) ;
	cout<<"******************************"<<endl;   
	cout<<"*please select your service"<<endl;
	cout<<"*establish   '1'  "<<endl;
	cout<<"*insert      '2'  "<<endl;
	cout<<"*remove      '3'  "<<endl;
	cout<<"*Output      '4'  "<<endl;
	//cout<<"*inverse     '5'  "<<endl;
	//cout<<"*find maximum'6'  "<<endl;
	//cout<<"*find member '7'  "<<endl;
	//cout<<"Combine      '8'  "<<endl;    
	cout<<"*quit        '0'  "<<endl;
	cout<<"******************************"<<endl;
	cout<<"ÇëÊäÈëÄãµÄÑ¡Ôñ£º";
	int i; 
	do{  
		cout<<"ÇëÊäÈëÄãµÄÑ¡Ôñ£º"<<endl;
		cout<<"1---> establish¡¢2----insert¡¢3----remove¡¢"<<endl<<"4--->output¡¢5--inverse¡¢6--max¡¢7--find¡¢8--Combine¡¢0--->quit¡¢"<<endl;
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
				   cout<<"please input the location you want to remove"<<endl;
				   cin>>loc;
				   cout<<list.Length()<<endl;
				   if(list.Length()==0){
					   cout<<"list empty,"<<endl;
					   continue;  
				   }
				   if(list.Remove(loc)==NULL){
					   cout<<"list empty or there is not the memeber,failing!"<<endl;
					   continue;
				   }
			   }
			   cout<<"OK"<<endl;
			    break;
		   /*case 4:
			   cout<<"Output!"<<endl;
               list.Output();
			   break;
		   case 5:
			   cout<<"inverse!"<<endl;
			   list.Inverse();
			   break;
		   case 6:
			   cout<<"find max"<<endl;
			   cout<<"the max is "<<list.Max()<<endl;
			   break;
		   case 7:
			   cout<<"the order you want to find:"<<endl;
			   int k;
			   cin>>k;
			   cout<<"the adress of the "<<k<<"th number is"<<list.Find(k)<<endl;
			   break;
		   case 8:
			    cout<<"creat a list:"<<endl;
	            list1.Createlist();
				cout<<"Combine!"<<endl;
	            list.Combine(list1);
				break;*/
		   default: cout<<"please input a number 0--7"<<endl;
	   }		   
	 }while(i!=0);	
	return 0;
}

   
