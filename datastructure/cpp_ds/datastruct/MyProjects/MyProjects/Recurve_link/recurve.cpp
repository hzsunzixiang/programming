#include<iostream.h>
#include"RecurveList.h"
int main(int argc,char *argv[]){
	List test;
	int finished;
	cout<<"输入建表结束标志数据"；
		cin>>finished;
	test.NewList(finished);
	test.PrintList();
	cout<<"\nThe max is :"<<test.GetMax();
	cout<<"\nThe Num is :"<<test.GetNum();
	cout<<"\nThe Avg is :"<<test.GetAvg()<<'\n';
	printf("hello world !\n");
	return 0;
}
