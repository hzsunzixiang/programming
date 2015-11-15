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
	char pp[50]="('a',(1,'b'),(2,3,4,5,6),6),'c'";
	char hstr1[21];
	temp=List.CreateList(ls,pp);
	cout<<temp;
	//List.ToFirst(&List,temp);
	//List.output(&List);
	return 1;
	
}
 