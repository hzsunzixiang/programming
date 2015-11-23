#include <stdio.h>

typedef struct Node {
	char data;
	struct Node* next;
} Node;

void print_list(Node* root) {
	while (root) {
		printf("%c ", root->data);
		root = root->next;
	}
	printf("\n");
}

/* Function to reverse the linked list */
void printReverse(struct Node* head)
{
	// Base case  
	if (head == NULL)
		return;

	// print the list after head node
	printReverse(head->next);

	// After everything else is printed, print head
	printf("%c  ", head->data);
}
Node* reverse(Node* root) {
	Node* new_root = 0;
	while (root) {
		Node* next = root->next;
		root->next = new_root;
		new_root = root;
		root = next;
	}
	return new_root;
}

int main() {
	Node d = { 'd', 0 };
	Node c = { 'c', &d };
	Node b = { 'b', &c };
	Node a = { 'a', &b };

	Node* root = &a;
	print_list(root);
	root = reverse(root);
	print_list(root);
	printReverse(root);
	printf("\n");

	return 0;
}
// http://www.geeksforgeeks.org/write-a-function-to-reverse-the-nodes-of-a-linked-list/
/* Function to reverse the linked list */
// static void reverse(struct node** head_ref)
// {
// 	struct node* prev   = NULL;
// 	struct node* current = *head_ref;
// 	struct node* next;
// 	while (current != NULL)
// 	{
// 		next  = current->next;  
// 		current->next = prev;   
// 		prev = current;
// 		current = next;
// 	}
// 	*head_ref = prev;
// }

