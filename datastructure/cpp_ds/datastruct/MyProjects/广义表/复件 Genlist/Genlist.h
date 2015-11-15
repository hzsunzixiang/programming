#include<string.h>
#include<iostream.h>
#include<stdlib.h>
class GenList;	
class GenListNode {	   
friend class GenList;
private:
	int utype;
	GenListNode *tlink;
};
class GenList {                 
private:
    GenListNode* first;       
public:
    GenList ( ); 
    GenListNode *First ( );
};


GenList :: GenList( ) {
    first=new GenListNode;
    first->utype = 11110;  //first->value.ref = 1;  
    //first->tlink = NULL;
	cout<<first->utype<<"sadhasdf"<<endl;
	cout<<(first->tlink==NULL)<<endl;
	cout<<first->tlink<<endl;
	cout<<NULL<<endl;
	cout<<"youcuowuma"<<endl;
}
GenListNode *GenList::First(){
	cout<<"ILove you"<<endl;
    first->utype = 11110; 
	//cout<<first->utype<<"sadhasdf"<<endl;
	//first->tlink=NULL;                
	cout<<(first->tlink==NULL)<<endl;
	//first->tlink = NULL;
	{cout<<"OK!"<<endl;} 
	//first->tlink=NULL;
	return  NULL;
}
