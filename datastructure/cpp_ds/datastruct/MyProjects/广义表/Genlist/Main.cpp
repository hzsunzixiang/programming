#include<iostream.h>
#include<stdlib.h>
#include"Genlist.h"
#include<string.h>
int main()
{
	GenList List;
	GenListNode *ls;
	ls=new GenListNode();
	char pp[30]="(('b'),(('b')'c'))";
	char hstr1[21];
	//cout<<List.sever( p, hstr1 )<<endl;
	//for(int i=0;i<strlen(hstr1);i++){
		//cout<<hstr1[i];}
	//cout<<endl;
	//for( i=0;i<strlen(p);i++){
	//	cout<<p[i];}
	List.CreateList(ls,pp);
	//cout<<List.CreateList(ls,pp)<<endl ;
	//cout<<ls->tlink;
	//ls.Info                                                                                                                         
	//cout<<ls->nodetype(ls)<<endl;
	//ls->nodetype(ls);
//	cout<<endl<<endl<<endl<<endl;
	//List.output(ls);
//	List.first=ls;
	//List.returnFirst(ls);
	//List.Head();
	List.output(ls);
	List.First();

	return 1;
	
}
 