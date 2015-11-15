#include<iostream.h>
#include<stdlib.h>
#include"Genlist.h"
#include<string.h>
int main()
{
	GenList List;
	GenListNode *ls;
	GenListNode *temp;
	ls=new GenListNode();
	char pp[30]="('b',(8,'f'),(5,5,5,5,8),5)";
	char hstr1[21];
	//cout<<List.sever( p, hstr1 )<<endl;
	//for(int i=0;i<strlen(hstr1);i++){
		//cout<<hstr1[i];}
	//cout<<endl;
	//for( i=0;i<strlen(p);i++){
	//	cout<<p[i];}
	//List.CreateList(ls,pp);
	//cout<<"function value"<<List.CreateList(ls,pp)<<"OK"<<endl ;
	//cout<<ls->tlink;
	//ls.Info                                                                                                                         
	//cout<<ls->nodetype(ls)<<endl;
	//ls->nodetype(ls);
//	cout<<endl<<endl<<endl<<endl;
	//List.output(ls);
//	List.first=ls;
	temp=List.CreateList(ls,pp);
	List.returnFirst(temp);
	//List.Head();
	List.output(temp);
	//List.First();
  

	return 1;
	
}
 