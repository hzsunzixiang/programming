#include<iostream.h>
#include <assert.h>
#include"graphLink.h"
//最后把内存释放掉
int main()
{
	const int num=9;
	Graph<char,int> graghic(num);
	cout<<endl<<endl<<endl;
	graghic.OutPutEach();///输出每个链表的值
    graghic.BFS(0);
	return 1;
}
