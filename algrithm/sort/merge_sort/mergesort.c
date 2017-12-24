
// https://gist.github.com/mpenkov/5301559
/* C program for Merge Sort */
#include<stdlib.h>
#include<stdio.h>
 
// Merges two subarrays of arr[].
// First subarray is arr[l..m]
// Second subarray is arr[m+1..r]
void merge(int arr[], int l, int m, int r)
{
	// 走到这里的时候 l - m已经排好序 m+1 - r 也已经排好序
	// 现在把两边排序好
	int n1 = m - l + 1;
	int n2 = r - m;
	int L[n1];
	int R[n2];
	// 把数据copy 进来
	for (int i = 0; i < n1; i++ )
	{
		L[i] = arr[l + i];
	}
	for (int i = 0; i < n2; i++)
	{
		R[i] = arr[m+1+i];
	}

	// 开始归并
	/* Merge the temp arrays back into arr[l..r]*/
	int i = 0; // Initial index of first subarray
	int j = 0; // Initial index of second subarray
	int k = l; // Initial index of merged subarray
	while( (i < n1) && (j < n2))
	{
		if (L[i] <= R[j])
		{
			arr[k] = L[i];
			i++;
		}
		else
		{
			arr[k] = R[j];
			j++;
		}
		k++;
	}
	while (i < n1)
	{
		arr[k] = L[i];
		k++;
		i++;
	}
	while (j < n2)
	{
		arr[k] = R[j];
		k++;
		j++;    // 这里写成 i++ 会coredump
	}
}

// 小l为了和1 区分 使用L
void mergeSort(int arr[], int L, int r)
{
	if (L<r)
	{
		int m = (L+r)/2;
		// 先排序左边
		mergeSort(arr, L, m);

		// 再排序右边
		mergeSort(arr, m+1, r);

		// 把排好序部分再排序
		merge(arr, L, m, r);
	}

}
/* UTILITY FUNCTIONS */
/* Function to print an array */
void printArray(int A[], int size)
{
	int i;
	for (i=0; i < size; i++)
		printf("%d ", A[i]);
	printf("\n");
}

/* Driver program to test above functions */
int main()
{
	int arr[] = {12, 11, 13, 5, 6, 7, 1, 4, 9};
	//int arr[] = {2, 5, 3, 7, 9, 6, 8};
	int arr_size = sizeof(arr)/sizeof(arr[0]);

	printf("Given array is \n");
	printArray(arr, arr_size);

	mergeSort(arr, 0, arr_size - 1);

	printf("\nSorted array is \n");
	printArray(arr, arr_size);
	return 0;
}
