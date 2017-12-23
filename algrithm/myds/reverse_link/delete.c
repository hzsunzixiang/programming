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

// 1. 在O(1)时间删除链表节点
// 题目描述：给定链表的头指针和一个节点指针，在O(1)时间删除该节点。[Google面试题]
// 
// 分析：本题与《编程之美》上的「从无头单链表中删除节点」类似。主要思想都是「狸猫换太子」，即用下一个节点数据覆盖要删除的节点，然后删除下一个节点。但是如果节点是尾节点时，该方法就行不通了。

// http://wuchong.me/blog/2014/03/25/interview-link-questions/ 
void deleteNode(Node* cur)
{
	// 记录当前节点值
	Node tmp = *cur;


}

int main() {
	Node d = { 'd', 0 };
	Node c = { 'c', &d };
	Node b = { 'b', &c };
	Node a = { 'a', &b };

	Node* root = &a;
	print_list(root);

	print_list(root);
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

