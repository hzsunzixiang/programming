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

int partition1(int arr[], int low, int high)  
{
	printf("partition, low:%d, high:%d\n", low, high);
	// 以最后一个元素为枢元
	int pivot = arr[high-1]; // 枢元为最后元素
	int tail = low;
	for (int i=low; i<high; i++)   
	{
		if (arr[i] < pivot)
		{
			swap(&arr[i], &arr[tail]);
			tail++;
		}
	}
	swap(&arr[tail], &arr[high-1]);   // 哨兵的情况下 注意交换的元素
	printf("partition, low:%d, high:%d tail:%d\n", low, high, tail);
	return tail;
}

int partition(int arr[], int low, int high)
{

	// high 是哨兵 没有实际数据
	int pivot = arr[high-1];  // 最后一个元素为 pivot
	int tail = low;

	for (int i=0; i<high; i++)
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
		}
	}
	if ((high-1) != tail)
	{
		swap(&arr[high-1], &arr[tail]);
	}
	else
	{
		printf("no need to swap end\n");
	}

	return tail;   // tail指向 pivot
}

// 快速排序使用分治法（Divide and conquer）策略来把一个序列（list）分为两个子序列（sub-lists）。
void quick_sort(int arr[], int low, int high)
{
	if (low<high)
	{
		int pivot = partition(arr, low, high);
		quick_sort(arr, low, pivot);  //  high是哨兵 递归的过程中 指向pivot
		quick_sort(arr, pivot+1, high);
	}
}


	int
main(int argc, char **argv)
{
	int array[] = {22, 34, 3, 32, 82, 55, 89, 50, 37, 5, 64, 35, 9, 70};
	int len = sizeof(array)/sizeof(*array);
	printArray(array, len);
	quick_sort(array, 0, len);
	printArray(array, len);

	return 0;
}



