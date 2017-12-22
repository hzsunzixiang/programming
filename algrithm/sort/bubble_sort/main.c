
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
void bubble_sort(int arr[], int len)
{
	printf("++begin sort\n");
	for (int i =0; i<len-1; i++)
	{
		printf("**begin sort\n");
		printArray(arr, len);
		printf("**end sort\n");
		printArray(arr, len);
		for (int j = 0; j<len-i-1; j++)
		{
			if (arr[j] > arr[j+1])
			{
				swap(arr, j, j+1);
			}

			printf("\n==begin sort\n");
			printArray(arr, len);
			printf("\n==end sort\n");
		}
	}
	printf("\n++end sort\n");
	printArray(arr, len);

}


int main()
{
	int array[] = {22, 34, 3, 32, 82, 55, 89, 50, 37, 5, 64, 35, 9, 70};
	int len = sizeof(array)/sizeof(*array);
	printArray(array, len);
	bubble_sort(array, len);
	printArray(array, len);

	return 0;
}
