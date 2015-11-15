#include<stdlib.h>
#include<string.h>
#include<iostream.h>
class GenList;	
class GenListNode{	   
friend class GenList;
public:
	GenListNode();
private:
	int utype;
	GenListNode *tlink;
};
class GenList {                 
private:
    GenListNode* first;       
public:
    GenList ( ); 
    void First ( );
};
GenListNode::GenListNode():tlink(NULL){}
GenList :: GenList( ) {
    first=new GenListNode;
    first->utype = 11110; 
}
void  GenList::First(){
    int b=(first->utype ==11110); 
	cout<<b;
}
int main()
{
	GenList List;
	List.First();
	return 1;
	
}