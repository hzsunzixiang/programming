#include <stdio.h>
#include <iostream.h>
#include <iomanip.h>
#include "BinaryTree.h"
void main()
{
	BinaryTree bt(-1);
	int a;
	cout<<"*****the function *****"<<endl;
	cout<<"   1.creat                       "<<endl;
	cout<<"   2.the number of the nodes:    "<<endl;
	cout<<"   3.remove                      "<<endl;
	cout<<"   4.the depth "<<endl;
	cout<<"   5.the number of leafnodes     "<<endl;
	cout<<"   6.preorder traversal          "<<endl;
	cout<<"   7.inorder  traversal          "<<endl;
    cout<<"   8.postorder traversal         "<<endl;
	cout<<"   9.search the address of a node"<<endl;
	cout<<"   10.the total of all the node:"<<endl;
	cout<<"   0.quit"   <<endl;
    do
	{  
		cout<<"input your choice:"<<endl;
		cin>>a;
		switch(a)
		{
		case 1: bt.input();
			break;
		case 2: bt.size();
			break;
		case 3: bt.remove();
			break;
		case 4: bt.height();
			cout<<endl;
			break;
		case 5: bt.LeafNode();
			cout<<endl;
			break;
		case 6: bt.preorder();
			cout<<endl;
			break;
		case 7: bt.inorder();
			cout<<endl;
			break;
		case 8: bt.postorder();
			cout<<endl;
			break;
		case 9: bt.find();
			break;
		case 10: bt.Sum();
			break;
		case 0: cout<<"quit!"<<endl;
			break;
		default:cout<<"please enter a number between 0--9 "<<endl;
		}
	}while(a);
}


