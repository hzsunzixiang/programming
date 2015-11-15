#include <iostream.h>
#include<stdlib.h>
#include"Lqueue.h"
int main()
{
	char ch;
	do{
	Queue<int> queue;	 
    cout<<"******************************"<<endl;   
	cout<<"*     选择项目：             "<<endl;
	cout<<"*输入扑克牌的数目          按'1' "<<endl;
	cout<<"*查看每张牌被翻动的次数    按'2' "<<endl;
	cout<<"*查看最终结果              按'3' " <<endl;
	cout<<"*运行下一轮程序:           按'0' " <<endl;
	cout<<"******************************"<<endl;
	int i,s;
    do{  
		cout<<"请输入你的选择：";
		cout<<"1---> 输入牌数、2----查看翻动结果、3----查看最后结果、0-----运行下一轮："<<endl<<endl<<endl;
		cin>>i;  
	   switch(i)
	   { 
	      case 1:
			  s=queue.CreateQueue() ;//把纸牌按次序放进队列
			break;
		  case 2:
			   queue.Game(s);     //纸牌游戏，可以看到每张牌被翻的次数
			    break;
		   case 3:	 
			   queue.Game();//打印输出结果
			    break;
	   }		   
	 }while(i!=0);	
	cout<<"确定进入下一轮的运行吗?确定请按'y' 或者'Y',否则按其他键"<<endl;
	cin>>ch;
	}while(ch=='y'||ch=='Y');
	return 0;
}