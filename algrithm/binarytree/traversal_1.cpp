#include <stdio.h>
#include <stdlib.h>
#include <stack>
#include <iostream>
//#include <conio.h>
using namespace std;

struct node {
	int data;
	struct node *left;
	struct node *right;
};

typedef struct node tree;

tree *root = NULL;

tree* newnode(int data) {

	tree *newdata = NULL;
	newdata = (tree *)malloc(sizeof(tree));

	newdata->data = data;
	newdata->left = NULL;
	newdata->right = NULL;

	return(newdata);
}

void preorder(tree *root) {

	if(root == NULL) {return;}

	printf("%d ",root->data);
	preorder(root->left);
	preorder(root->right);
}
void preOrder2(tree *root)     //非递归前序遍历 
{
	stack<tree*> s;
	tree *p = root;
	while(p != NULL || !s.empty())
	{
		while(p != NULL)
		{
			cout << p->data << " ";
			s.push(p);
			p=p->left;
		}
		if(!s.empty())
		{
			p=s.top();
			s.pop();
			p=p->right;
		}
	}
}
void inorder(tree *root) {

	if(root == NULL) {return;}

	inorder(root->left);
	printf("%d ",root->data);
	inorder(root->right);
}
void inOrder2(tree *root)      //非递归中序遍历
{
	stack<tree*> s;
	tree *p = root;
	while(p != NULL || !s.empty())
	{
		while(p!= NULL)
		{
			s.push(p);
			p=p->left;
		}
		if(!s.empty())
		{
			p=s.top();
			cout << p->data << " ";
			s.pop();
			p=p->right;
		}
	}    
} 

void postorder(tree *root) {

	if(root == NULL) {return;}

	postorder(root->left);
	postorder(root->right);
	printf("%d ",root->data);
}

void postOrder2(tree *root)     //非递归后序遍历
{
	stack<tree*> s;
	tree *cur;                      //当前结点 
	tree *pre = NULL;                 //前一次访问的结点 
	s.push(root);
	while(!s.empty())
	{
		cur=s.top();
		if(( cur->left== NULL && cur->right==NULL) ||
				(pre != NULL && (pre == cur->left|| pre==cur->right)))
		{
			cout << cur->data << " ";  //如果当前结点没有孩子结点或者孩子节点都已被访问过 
			s.pop();
			pre = cur; 
		}
		else
		{
			if(cur->right != NULL)
				s.push(cur->right);
			if(cur->left != NULL)    
				s.push(cur->left);
		}
	}    
}

int main() {
	root = newnode(10);
	root->left = newnode(20);
	root->right = newnode(30);
	root->left->left = newnode(40);
	root->left->right = newnode(50);
	printf("Preorder traversal of binary tree is : ");
	preorder(root);
	printf("\nPreorder iterator traversal of binary tree is : ");
	preOrder2(root);
	printf("\n");
	printf("Inorder traversal of binary tree is : ");
	inorder(root);
	printf("\nInorder iterator traversal of binary tree is : ");
	inOrder2(root);
	printf("\n");
	printf("Postorder traversal of binary tree is : ");
	postorder(root);
	printf("\nPostorder traversal of binary tree is : ");
	postOrder2(root);
	printf("\n");

	//getchar();
	return 0;
}
