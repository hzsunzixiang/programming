#include <stdlib.h>
#include <assert.h>
#include <stdio.h>

// https://gist.github.com/mpenkov/5301559

/*
 * Swap the ith and jth elements of the array A in-place.
 */
// A utility function to swap two elements
void swap(int* a, int* b)
{
	int t = *a;
	*a = *b;
	*b = t;
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

//  
/* This function takes last element as pivot, places
   the pivot element at its correct position in sorted
    array, and places all smaller (smaller than pivot)
   to left of pivot and all greater elements to right
   of pivot */
int partition2(int arr[], int low, int high)  
{
	printf("partition, low:%d, high:%d\n", low, high);
	// 以最后一个元素为枢元
	int pivot = arr[high]; // 枢元为最后元素
	int tail = low;   // 需要返回的位置 在遍历的过程中 会指向第一个大于等于枢元的序号(比如前面所有元素都小于枢元)
	for (int i=low; i<high; i++)   
	{
		if (arr[i] <= pivot)
		{
			swap(&arr[i], &arr[tail]);
			tail++;
		}  // 如果所有的值都小于 pivot 此时tail指向 high
	}
	swap(&arr[tail], &arr[high]);
	printf("partition, low:%d, high:%d tail:%d\n", low, high, tail);
	return tail;
}

int partition(int arr[], int low, int high)  
{
	int pivot = arr[high];  // 枢元为最后的元素
	// 初始化 tail 为第一个元素下标
	int tail = low;   // 需要返回的位置 在遍历的过程中 会指向第一个大于等于枢元的序号(比如前面所有元素都小于枢元)

	for (int i = low; i< high; i++)
	{
		if (arr[i] < pivot)
		{
			if (i != tail)
			{
				swap(&arr[i], &arr[tail]);
			}
			else
			{
				printf("no need to swap\n");
			}
			tail++;
		}  // 如果所有的值都小于 pivot 此时tail指向 high
	}
	if (high != tail)
	{
		swap(&arr[high], &arr[tail]);
	}
	else
	{
		printf("no need to swap end\n");
	}
	return tail;
}

int partition1(int arr[], int low, int high)  
{
	printf("partition, low:%d, high:%d\n", low, high);
	// 以最后一个元素为枢元
	int pivot = arr[high]; // 枢元为最后元素
	//int tail = low;
	int tail = low-1;
	for (int i=low; i<high; i++)   
	{
		if (arr[i] <= pivot)
		{
			tail++;
			swap(&arr[i], &arr[tail]);
		}
	}
	swap(&arr[tail+1], &arr[high]);
	printf("partition, low:%d, high:%d tail:%d\n", low, high, tail);
	return tail+1;
}


// 快速排序使用分治法（Divide and conquer）策略来把一个序列（list）分为两个子序列（sub-lists）。
void quick_sort(int arr[], int low, int high)
{
	if (low<high)
	{
		int pivot = partition(arr, low, high);
		quick_sort(arr, low, pivot-1);
		quick_sort(arr, pivot+1, high);
	}
}

//Quicksort	最好和平局情况 O(nlogn) 最坏 O(n^{2}) 就地排序 不稳定 Partitioning	Quicksort, 需要空间  O(log n) ; is usually done in-place with O(log n) stack space.

	int
main(int argc, char **argv)
{
	int array[] = {22, 34, 3, 32, 82, 55, 89, 50, 37, 5, 64, 35, 9, 70};
	int len = sizeof(array)/sizeof(*array);
	printArray(array, len);
	quick_sort(array, 0, len-1);
	printArray(array, len);

	return 0;
}



