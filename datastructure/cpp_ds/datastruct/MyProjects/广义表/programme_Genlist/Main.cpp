#include<iostream.h>
#include<stdlib.h>
#include"Genlist.h"
#include<string.h>
int main()
{
	GenList List;
	GenListNode *ls;
	GenListNode *temp;
	char pp[30]="(1,2,'a',(3,'b'))";
	temp=List.CreateList(ls,pp);
	List.ToFirst(temp);
	List.output(temp);
	return 1;
	
}
 