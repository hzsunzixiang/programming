#include<iostream.h>
#include<time.h>
#include<stdlib.h>
#include "UFset.h"

int main()

{
	int p, q;
	int flag,num;
	cout<<"Please enter the number of the pairs  and the elements of the ufset:"<<endl;
	cin>>flag>>num;
	UFSet obj(num);	
	cout<<endl;
	for (int i=0; i<flag;i++) 
	{
		cout<<"Enter the pairs:"<<endl;
		cin>>p>>q;
		obj.Unite(p, q);
		if (i<flag) {
			cout<<"contine:"<<endl;
		}	
	}
	obj.Print();//按等价类来打印
	system("pause");
	return 0;
	
}
