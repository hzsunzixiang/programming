#include<iostream.h>
#include<stdlib.h>
#include"Genlist.h"
#include<string.h>
int main()
{
	GenList List;
	GenListNode *ls;
	GenListNode *temp;
	//ls=new GenListNode();
	char pp[30]="((4,5,6))";
	temp=List.CreateList(ls,pp);
	//List.ToFirst(temp);
	List.output(temp);
	return 1;
	
}
 