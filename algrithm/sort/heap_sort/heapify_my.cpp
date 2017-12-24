#include <stdio.h>
#include <stdlib.h>

// 包含堆调整 和排序
void swap(int* a, int* b) {
	int temp = *b;
	*b = *a;
	*a = temp;
}

void printArray(int arr[], int len)
{
	printf("begin:");
	for (int i = 0; i < len; i++)
	{
		//printf("i:%d, val:%d\t", i, arr[i]);
		printf("%6d", arr[i]);
	}
	printf("\tend:");
	printf("\n");
}

// 从start 开始调整 到end
void max_heapify(int arr[], int start, int end)
{
	int dad = start;  // 父节点为要调整的开始节点开始
	int son = 2*dad + 1;//  左儿子
	while(son<end)  // 循环调整
	{
		// 判断是否有右儿子， 如果有 比较左右儿子大小
		if ( (son+1<=end) && arr[son] < arr[son+1])
		{
			son++;
		}
		// 如果不需要调整直接返回
		if (arr[dad] > arr[son])
		{
			return;
		}
		else  // 否则需要调整
		{
			swap(&arr[dad], &arr[son]);
			dad = son;  // 继续往下调整
			son = dad * 2 + 1;// 指向左儿子
		}
	}

}

// Parent(i) = floor((i-1)/2)，i 的父节点下标
// Left(i) = 2i + 1，i 的左子节点下标
// Right(i) = 2(i + 1)，i 的右子节点下标

// Parent(i) = floor((i-1)/2)，i 的父节点下标  也就是 i/2 -1

// 堆调整 从 最后一个节点的父节点开始调整
void heap_create(int arr[], int len)
{
	int end = len - 1; // 数组的最大下标
	int index = (end-1)/2;  // 也就是 len/2 - 1
	for (int i = index; i>=0; i--)
	{
		max_heapify(arr, i, end);
	}

}

void heap_sort(int arr[], int len)
{
	// 先调整为一个最大堆
	heap_create(arr, len);
	for (int i=0; i<len; i++)
	{
		// 把第0个元素和第 end-i 个元素交换
		swap(&arr[0], &arr[len-1-i]);
		// 然后再调整
		heap_create(arr, len-1-i);
	}
}

int main() 
{
	//int arr[] = { 3, 5, 3, 0, 8, 6, 1, 5, 8, 6, 2, 4, 9, 4, 7, 0, 1, 8, 9, 7, 3, 1, 2, 5, 9, 7, 4, 0, 2, 6 };
	int arr[] = { 3, 5, 3, 0, 8, 6};
	int len = (int) sizeof(arr) / sizeof(*arr);
	printArray(arr, len);
	//heap_create(arr, len);
	heap_sort(arr, len);
	printArray(arr, len);
	printf("\n");
	return 0;
}
