#include <iostream.h>
#include<stdlib.h>
#include<string.h>
#include"stack.h"
int main()
{
	const int max=100;
	char i;
	do{
		Stack<char> stack(max);
		char *ele,m;
		ele=new char[max];	
	
		int k=0;
		cout<<"Please enter a string(end with #) :"<<endl;
		cin>>m;
		do{
		ele[k]=m;
		cin>>m;	
		k++;
		}while(m!='#');
		ele[k]='\0'; 
		cout<<endl;
		stack.Recurve(ele);
		cout<<endl;
		cout<<"是否还要进行测试:按'y'进行测试,按其他键退出: "<<endl;
		cin>>i;
		delete []ele;
	}while(i=='y');
	return 0;
}




