

// https://www.geeksforgeeks.org/heap-sort/
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

// void swap(int *a,int *b) //交換兩個變數
// {
// 	int temp = *a;
// 	*a = *b;
// 	*b = temp;
// }
void heap_sort(int arr[], int len)
{
}
int main()
{
	int array[] = {22, 34, 3, 32, 82, 55, 89, 50, 37, 5, 64, 35, 9, 70};
	int len = sizeof(array)/sizeof(*array);
	printArray(array, len);
	selection_sort(array, len);
	printArray(array, len);

	return 0;
}
