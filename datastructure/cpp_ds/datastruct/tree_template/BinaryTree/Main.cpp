#include <stdio.h>
#include <iostream.h>
#include <iomanip.h>
#include "BinaryTree.h"
int main()
{
	BinaryTree <int>  binaryTree;
	binaryTree.input();
	BinaryTree <int> BT(binaryTree);
    //BT(binaryTree);
	cout<<BT;
	return 1;
}
