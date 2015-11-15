#include <iostream.h>
#include<stdlib.h>
#include"Lqueue.h"
int main()
{  //注意：3和4 不能同时按下： 如果按了3，队列就空了，不能按4了，
	//2是一个多余选项，用来查看队列中内容
	Queue<int> queue,queue1;	 
    cout<<"******************************"<<endl;   
	cout<<"*selet an item        "<<endl;
	cout<<"*input the number of the card ,enter'1' "   <<endl;
	cout<<"*output enter           '4'  "<<endl;
	cout<<"*quit,enter             '0'          "<<endl;
	cout<<"******************************"<<endl;
	int i;
    do{  
		cout<<"input your choice：";
		cout<<"1---> input、2----output、3--->Decard、4--->Decard2、0--->quit、"<<endl;
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
			   queue1.Result();
			   break;
	   }		   
	 }while(i!=0);	
	return 0;
}

/*如选择1
    输入13
	然后选择3
	结果为
	location       card
1                1
3                2
5                3
7                4
9                5
11                6
13                7
4                8
8                9
12                10
6                11
2                12
10                13
*/
/*如选择1
    输入13
	然后选择4
	结果为
location         card
1                 1
2                 12
3                 2
4                 8
5                 3
6                 11
7                 4
8                 9
9                 5
10                 13
11                 6
12                 10
13                 7
	*/