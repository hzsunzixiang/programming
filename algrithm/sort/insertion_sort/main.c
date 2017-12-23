
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
// 算法描述[编辑]
// 一般来说，插入排序都采用in-place在数组上实现。具体算法描述如下：
// 
// 从第一个元素开始，该元素可以认为已经被排序
// 取出下一个元素，在已经排序的元素序列中从后向前扫描
// 如果该元素（已排序）大于新元素，将该元素移到下一位置
// 重复步骤3，直到找到已排序的元素小于或者等于新元素的位置
// 将新元素插入到该位置后
// 重复步骤2~5
// 如果比较操作的代价比交换操作大的话，可以采用二分查找法来减少比较操作的数目。该算法可以认为是插入排序的一个变种，称为二分查找插入排序。


void insertion_sort1(int arr[], int len)
{
	int j, tmp;
	for (int i=1; i<len; i++)
	{
		tmp = arr[i];
		for (j=i-1; j>=0; j--)
		{
			if (arr[j] > tmp)
			{
				arr[j+1] = arr[j];
			}
			else
				break;
		}
		arr[++j] = tmp;
	}
}

void insertion_sort(int arr[], int len)
{
	int i,j,temp;

	for (i = 1 ; i < len ; i++ )
	{
		temp = arr[i];

		for (j = i; j > 0 && arr[j-1] > temp ; j--)   // 跟前一个元素比较的时候及时退出了 退出的时候 j 就是所需要的值 j 即为所插入的位置
		{
			arr[j] = arr[j-1];
		}

		arr[j] = temp;
	}
}
// 在STL的sort算法和stdlib的qsort算法中，都将插入排序作为快速排序的补充，用于少量元素的排序（通常为8个或以下）
// Insertion sort	插入排序稳定 最好的情况O(n) 平均和最坏O(n^{2}) 方式为 Insertion
int main()
{
	int array[] = {22, 34, 3, 32, 82, 55, 89, 50, 37, 5, 64, 35, 9, 70};
	int len = sizeof(array)/sizeof(*array);
	printArray(array, len);
	insertion_sort(array, len);
	printArray(array, len);

	return 0;
}
