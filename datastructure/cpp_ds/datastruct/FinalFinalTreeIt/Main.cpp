#include <stdio.h>
#include <iostream.h>
#include <iomanip.h>
#include<process.h>
#include<assert.h>
#include"IteratorTraverse.h"
int main()
{
	BinaryTree <int>  BTT;
	BTT.input();
	LevelOrder<int> Level(BTT);
	//Level.Traverse();
	PostOrder<int> Post(BTT);
	//Post.Traverse();
	InOrder<int> In(BTT);
	//In.Traverse();
	PreOrder<int> Pre(BTT);
	//Pre.Traverse();
    cout<<"******************************"<<endl;   
	cout<<"*selet an item        "<<endl;
	cout<<"*levelorder traverse,enter'1' "   <<endl;
	cout<<"*preorder traverse,enter '2'  "<<endl;
	cout<<"*inorder traverse enter '3'    "<<endl;
    cout<<"*postorder traverse enter '3'    "<<endl;	
	cout<<"*quit,enter  '0'          "<<endl;
	cout<<"******************************"<<endl;
	int i;	
	
	do
	{   cin>>i;  
		cout<<"ÇëÊäÈëÄãµÄÑ¡Ôñ£º";
		cout<<"1---> levelorder traverse¡¢2----preorder traverse¡¢3----inorder traverse¡¢4--->postorder traverse¡¢0--->quit¡¢"<<endl;

	   switch(i)
	   { 
	      case 1:	  	
               Level.Traverse();        
			   break;
		   case 2: 	   	
               Pre.Traverse();
			   break;
		   case 3:	  
               In.Traverse();
			    break;
		   case 4:   
               Post.Traverse();
			   break;
	   }		   
	   }while(i!=0);
	return 1;
}