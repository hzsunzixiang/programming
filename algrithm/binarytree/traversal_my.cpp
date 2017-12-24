#include <stdio.h>
#include <stdlib.h>
#include <stack>
#include <queue>
#include <iostream>
//#include <conio.h>
using namespace std;


struct tree
{
	int data;
	struct tree *left;
	struct tree *right;
};

typedef struct tree tree;

tree * newnode(int data)
{
	tree * newdata = NULL;
	newdata = (tree*)malloc(sizeof(tree));
	newdata->data = data;
	newdata->left = NULL;
	newdata->right = NULL;
	return newdata;
}
// 前序遍历 先访问根节点  根-左-右
void preorder(tree* root)
{
	if (!root)
	{
		return;
	}
	printf("%d\t", root->data);
	preorder(root->left);
	preorder(root->right);
}
void inorder(tree* root)
{
	if (!root)
	{
		return;
	}
	inorder(root->left);
	printf("%d\t", root->data);
	inorder(root->right);
}

void postorder(tree* root)
{
	if (!root)
	{
		return;
	}
	postorder(root->left);
	postorder(root->right);
	printf("%d\t", root->data);
}
void preOrder2(tree* root)
{
	// 前序遍历 根-左-右
	// 先访问根， 访问之后因为要访问left,  所以left需要入栈
	// 所以每次访问入栈之后都要把left入栈
	// 如果有出栈的情况  
	tree* p = root;
	stack<tree*> s;
	while ((!s.empty()) || p)
	{
		// 先访问left  直到为空
		while (p)
		{
			// 访问根节点  //  这里的逻辑出过错误
			printf("%d\t", p->data);
			s.push(p);
			p = p->left;
		}
		// left 访问完毕 出栈 访问right
		if (!s.empty())
		{
			p = s.top();    
			s.pop();
			p = p->right;   // 再访问 right 
			// 如果right为空 则不进入里面的while循环  接着重新出栈
		}
	}
	printf("\n");
}
void inOrder2(tree *root)
{
	// 中序遍历 left - root - right
	stack<tree*> s;
	tree *p = root;
	while(!s.empty() || p)
	{
		while (p)
		{
			// 依次进栈
			s.push(p);
			p = p->left;
		}
		if (!s.empty())  // 栈不空  访问
		{
			p = s.top();
			printf("%d\t", p->data);
			s.pop();
			p = p->right; // right如果非空将要进栈
		}
	}

}
void postOrder2(tree *root)     //非递归后序遍历
{
	stack<tree*> s;  // 存储节点
	// right left 依次进栈 出栈的时候 访问标记
	tree *pre = NULL;  // 访问完毕之后 指向left或者right  做判断
	tree *cur ;  // 要处理的当前元素
	tree *p = root;
	// 先进栈
	s.push(p);
	while (!s.empty()) // 直到栈为空
	{
		cur = s.top();   // 访问的时候 
		if ( (cur->right==NULL && cur->left==NULL) || (pre != NULL && (pre == cur->right || pre == cur->left) ))
		{
			// 如果left right 都为空就可以访问 或者 左右子女有一个被访问过(按照进栈顺序 一个被访问过 另一个一定被访问过)
			// 访问之后标记pre
			printf("%d\t", cur->data);
			s.pop();     // 访问完毕要出栈
			pre = cur;
		}
		else  // 不满足条件的时候 right left 依次进栈 
		{
			if (cur->right != NULL)
			{
				s.push(cur->right);
			}
			if (cur->left != NULL)
			{
				s.push(cur->left);
			}
		}
	}
}

void postOrder21(tree* root)
{
	// left - right - root
	stack<tree*> s;
	tree *cur;  // 当前节点
	tree *pre = NULL;
	tree *p = root;   // 前一次访问的节点
	// root先进栈
	s.push(p);
	while (!s.empty()) 
	{
		cur = s.top();
		if ( (cur->left == NULL &&cur->right == NULL) || (pre != NULL && (pre == cur->left || pre == cur->right)))
		{
			printf("%d\t", cur->data);
			s.pop();
			pre = cur;
		}
		else
		{
			if (cur->right != NULL)
			{
				s.push(cur->right);
			}
			if (cur->left != NULL)
			{
				s.push(cur->left);
			}

		}

	}
	// 如果left right 非空依次进栈

}

void levelOrder(tree* root)
{
	queue<tree*> Q;
	if (root == NULL)
		return;
	Q.push(root);
	while(!Q.empty())
	{
		tree *cur = Q.front();
		printf("%6d", cur->data);
		if (cur->left)
		{
			Q.push(cur->left);
		}
		if (cur->right)
		{
			Q.push(cur->right);
		}
		Q.pop();
	}
}
int main() {
	tree *root =  newnode(10);
	root->left = newnode(20);
	root->right = newnode(30);
	root->left->left = newnode(40);
	root->left->right = newnode(50);
	root->right->right = newnode(60);
	printf("Preorder traversal of binary tree is : ");
	preorder(root);
	printf("\n");

	printf("\nInorder traversal of binary tree is : ");
	inorder(root);

	printf("\nPostorder traversal of binary tree is : ");
	postorder(root);

	printf("\nPreorder iterator traversal of binary tree is : ");
	preOrder2(root);
	printf("\n");

	printf("\nInorder iterator traversal of binary tree is : ");
	inOrder2(root);
	printf("\n");

	printf("\nPostorder traversal of binary tree is : ");
	postOrder2(root);
	printf("\n");

	printf("\nlevelOrder  traversal of binary tree is : ");
	levelOrder(root);
	printf("\n");

	//getchar();
	return 0;
}



