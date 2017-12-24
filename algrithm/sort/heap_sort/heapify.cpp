#include <stdio.h>
#include <stdlib.h>

void swap(int* a, int* b) {
	int temp = *b;
	*b = *a;
	*a = temp;
}

void max_heapify(int arr[], int start, int end) {
	//建立父節點指標和子節點指標
	int dad = start;
	int son = dad * 2 + 1;
	// 循环调整
	while (son <= end) { //若子節點指標在範圍內才做比較
		if (son + 1 <= end && arr[son] < arr[son + 1]) //先比較兩個子節點大小，選擇最大的
			son++;
		if (arr[dad] > arr[son]) //如果父節點大於子節點代表調整完畢，直接跳出函數
			return;
		else { //否則交換父子內容再繼續子節點和孫節點比較
			swap(&arr[dad], &arr[son]);
			dad = son;
			son = dad * 2 + 1;
		}
	}
}

// Parent(i) = floor((i-1)/2)，i 的父节点下标
// Left(i) = 2i + 1，i 的左子节点下标
// Right(i) = 2(i + 1)，i 的右子节点下标

// Parent(i) = floor((i-1)/2)，i 的父节点下标  也就是 i/2 -1
// 所以最后一个节点的父节点开始调整  
void heap_create(int arr[], int len) {
	int i;
	//初始化，i從最後一個父節點開始調整
	for (i = len / 2 - 1; i >= 0; i--)
		max_heapify(arr, i, len - 1);
	for (i = 0; i < len; i++)
		printf("%d ", arr[i]);
	printf("\n");
}

int main() {
	//int arr[] = { 3, 5, 3, 0, 8, 6, 1, 5, 8, 6, 2, 4, 9, 4, 7, 0, 1, 8, 9, 7, 3, 1, 2, 5, 9, 7, 4, 0, 2, 6 };
	int arr[] = { 3, 5, 3, 0, 8, 6};
	int len = (int) sizeof(arr) / sizeof(*arr);
	heap_create(arr, len);
	int i;
	for (i = 0; i < len; i++)
		printf("%d ", arr[i]);
	printf("\n");
	return 0;
}
