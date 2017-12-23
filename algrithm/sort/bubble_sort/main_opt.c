
#include <stdio.h>


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
void swap(int *array, int i, int j)
{
	int temp = array[i];
	array[i] = array[j];
	array[j] = temp;
}

/*
   第一层循环为元素的个数-1, 每次要找出一个最大值放在最后面 只需要找到 len-1个 最后一个自动排序
   第二层循环 把最大值交换一个最大值到最后
 */
//  The pass through the list is repeated until no swaps are needed, which indicates that the list is sorted. 
// The only significant advantage that bubble sort has over most other implementations, even quicksort, but not insertion sort, is that the ability to detect that the list is sorted efficiently is built into the algorithm. When the list is already sorted (best-case), the complexity of bubble sort is only O(n). 
// 走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。
// 。冒泡排序如果能在内部循环第一次运行时，使用一个旗标来表示有无需要交换的可能，也可以把最优情况下的复杂度降低到 {\displaystyle O(n)} O(n)。
void bubble_sort(int arr[], int len)
{
	int count = 0;
	printf("++begin sort\n");
	int swapped;
	for (int i =0; i<len-1; i++)
	{
		swapped = 0;
		printf("**begin sort\n");
		printArray(arr, len);
		printf("**end sort\n");
		printArray(arr, len);
		for (int j = 0; j<len-i-1; j++)
		{
			++count;
			if (arr[j] > arr[j+1])
			{
				swap(arr, j, j+1);
				swapped = 1;
			}

			printf("\n==begin sort\n");
			printArray(arr, len);
			printf("\n==end sort\n");
		}
		if (!swapped)
		{
			printf("\n++end sort, count:%d pre\n", count);
			printArray(arr, len);
			return;
		}
	}
	printf("\n++end sort, count:%d\n", count);
	printArray(arr, len);

}

// 
// 冒泡排序	数组	稳定的 方法为Exchanging	
//	平均  O(n^{2})  最坏 O(n^{2})	最好 O(n) 额外空间复杂度 O(1) （无序区，有序区）。
// 从无序区通过交换找出最大元素放到有序区前端。

int main()
{
	int array[] = {22, 34, 3, 32, 82, 55, 89, 50, 37, 5, 64, 35, 9, 70};
	int array1[] = {3,5,9,22,32,34,35,37,50,55,64,70,82,89};
	int array2[] = {89,82,70,64,55,50,37,35,34,32,22, 9, 5, 3};

	int len = sizeof(array)/sizeof(*array);
	printArray(array, len);
	bubble_sort(array1, len);
	printArray(array, len);

	//bubble_sort(array1, len);
	return 0;
}
