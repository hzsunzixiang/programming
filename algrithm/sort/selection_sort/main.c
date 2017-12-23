
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

void selection_sort(int arr[], int len) 
{
	for (int i=0; i<len-1; i++)
	{
		int temp = i;
		for(int j=i+1; j<len; j++)
		{
			if (arr[temp] > arr[j])
			{
				temp = j;
			}
		}
		swap(arr, i, temp);   // 这里交换的时候可能造成不稳定
	}
}
// 
// 因此对  n个元素的表进行排序总共进行至多  n-1 次交换。在所有的完全依靠交换去移动元素的排序方法中，选择排序属于非常好的一种。
// Selection sort	不稳定  最好最坏最差的时间复杂度都是 O(n^{2})  Selection 
int main()
{
	int array[] = {22, 34, 3, 32, 82, 55, 89, 50, 37, 5, 64, 35, 9, 70};
	int len = sizeof(array)/sizeof(*array);
	printArray(array, len);
	selection_sort(array, len);
	printArray(array, len);

	return 0;
}
