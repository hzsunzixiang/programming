#include <stdio.h>

//// https://stackoverflow.com/questions/1801549/how-to-reverse-a-singly-linked-list-using-only-two-pointers
// https://www.geeksforgeeks.org/reverse-a-linked-list/

typedef struct Node
{
	char data;
	struct Node *next;
}Node;

void visit(Node *root)
{
	printf("visit node:%c, next:%p\n", root->data, root->next);
}
void print_list(Node *root)
{
	while(root)
	{
		//printf("node:%c, next:%p\n", root->data, root->next);
		visit(root);
		root = root->next;
	}
}
void print_list_recursive1(struct Node* root)
{
	if(!root)
	{
		return;
	}
	printf("node:%c, next:%p\n", root->data, root->next);
	print_list_recursive1(root->next);
}
void printReverse1(struct Node* root)
{
	if(!root)
	{
		return;
	}
	printReverse1(root->next);
	printf("node:%c, next:%p\n", root->data, root->next);
}

void print_list_recursive(struct Node* root, void (*visit)(Node*))
{
	if(!root)
	{
		return;
	}
	visit(root);
	print_list_recursive(root->next, visit);
}
void printReverse(struct Node* root, void (*visit)(Node*))
{
	if(!root)
	{
		return;
	}
	printReverse(root->next, visit);
	visit(root);
}
int count(Node* root)
{
	if (!root)
	{
		return 0;
	}
	return 1+count(root->next);

}


Node* Reverse(Node *root)
{
	Node *newRoot = NULL;
	Node *p = NULL;

	while(root)
	{
		p = root->next;
		root->next = newRoot;
		newRoot = root;
		root = p;
	}
	return newRoot;
}
void Reverse1(Node **head_ref)
{
	Node *newRoot = NULL;
	Node *n = NULL;
	Node *current = *head_ref;

	while(current)
	{
		n = current->next;
		current->next = newRoot;
		newRoot = current;
		current = n;
	}
	*head_ref = newRoot;
}

void testReverse(Node *root)
{
	print_list(root);
	Node* newRoot = Reverse(root);
	print_list(newRoot);

}

void testReverse1(Node *root)
{
	print_list(root);
	Reverse1(&root);
	print_list(root);

}
int main() {
	Node a = {'a', NULL};
	Node b = {'b', &a};
	Node c = {'c', &b};
	Node d = {'d', &c};
	Node e = {'e', &d};
	Node f = {'f', &e};
	Node g = {'g', &f};
	Node h = {'h', &g};
	testReverse1(&h);
	//print_list(&h);
	//printReverse(&h, visit);
	//printReverse(NULL, visit);
	//printf("count:%d\n", count(&h));
	//printf("count:%d\n", count(NULL));
	return 0;
}
