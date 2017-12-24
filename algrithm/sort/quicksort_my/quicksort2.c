


#include <cstdio>

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

//  6 void quick_sort_recursive(int arr[], int start, int end) {
//  7     if (start >= end)
//  8         return; // 這是為了防止宣告堆疊陣列時當機
//  9     int mid = arr[end];
// 10     int left = start, right = end - 1;
// 11     while (left < right) {
// 12         while (arr[left] < mid && left < right)
// 13             left++;
// 14         while (arr[right] >= mid && left < right)
// 15             right--;
// 16         swap(&arr[left], &arr[right]);
// 17     }
// 18     if (arr[left] >= arr[end])
// 19         swap(&arr[left], &arr[end]);
// 20     else
// 21         left++;
// 22     if (left)
// 23         quick_sort_recursive(arr, start, left - 1);
// 24     quick_sort_recursive(arr, left + 1, end);
// 25 }
int partition(int arr[], int start, int end)
{
	int pivot = arr[end];
	int left = start;
	int right = end-1;
	printf("xxpivot:%d, left:%d, right:%d, end:%d\n", pivot, left, right, end);
	while (left<right)
	{
		while ((arr[left] <  pivot) && (left < right))
		{
			left++;
		}
		while ((arr[right] >=  pivot) && (left < right))
		{
			right--;	
		}
		swap(&arr[left], &arr[right]);
	}

	if (arr[left] >= arr[end])
	{
		printf("--pivot:%d, left:%d, right:%d, end:%d\n", pivot, left, right, end);
		printArray(arr, end+1);
		swap(&arr[left], &arr[end]);
		printArray(arr, end+1);
		printf("\n");
	}
	else 
	{
		//  22    34     3    32     9    55    35    50    37     5    64
		// 这种情况下 left = right = 9
		// ++pivot:64, left:9, right:9
		// 但是 arr[left] < arr[end]  此时不能交换
		printf("++pivot:%d, left:%d, right:%d, end:%d\n", pivot, left, right, end);
		left++;
		printArray(arr, end+1);
		printf("++pivot:%d, left:%d, right:%d\n", pivot, left, right);
		printf("\n");
	}

	// 处理边界条件 比如只有两个元素
	return left;
}

void quick_sort(int arr[], int start, int end)  // start end 为下标
{
	if (start < end)
	{
		int pivot = partition(arr, start, end);
		quick_sort(arr, start, pivot-1);
		quick_sort(arr, pivot+1, end);
	}

}

	int
main(int argc, char **argv)
{
	int array[] = {22, 34, 3, 32, 82, 55, 89, 50, 37, 5, 64, 35, 9, 70};
	//int array[] = {1, 8, 9, 2, 3, 5};
	//int array[] = {8, 9};
	int len = sizeof(array)/sizeof(*array);
	printArray(array, len);
	printf("\n");
	quick_sort(array, 0, len-1);
	printf("\n");
	printArray(array, len);

	return 0;
}

// 递归法
// 
//  1 void swap(int *x, int *y) {
//  2     int t = *x;
//  3     *x = *y;
//  4     *y = t;
//  5 }
//  6 void quick_sort_recursive(int arr[], int start, int end) {
//  7     if (start >= end)
//  8         return; // 這是為了防止宣告堆疊陣列時當機
//  9     int mid = arr[end];
// 10     int left = start, right = end - 1;
// 11     while (left < right) {
// 12         while (arr[left] < mid && left < right)
// 13             left++;
// 14         while (arr[right] >= mid && left < right)
// 15             right--;
// 16         swap(&arr[left], &arr[right]);
// 17     }
// 18     if (arr[left] >= arr[end])
// 19         swap(&arr[left], &arr[end]);
// 20     else
// 21         left++;
// 22     if (left)
// 23         quick_sort_recursive(arr, start, left - 1);
// 24     quick_sort_recursive(arr, left + 1, end);
// 25 }
// 26 void quick_sort(int arr[], int len) {
// 27     quick_sort_recursive(arr, 0, len - 1);
// 28 }
// C++[编辑]
// 迭代法
// 
// // 参考：http://www.dutor.net/index.php/2011/04/recursive-iterative-quick-sort/
// struct Range {
//     int start, end;
//     Range(int s = 0, int e = 0) {
//         start = s, end = e;
//     }
// };
// template <typename T> // 整數或浮點數皆可使用,若要使用物件(class)時必須設定"小於"(<)、"大於"(>)、"不小於"(>=)的運算子功能
// void quick_sort(T arr[], const int len) {
//     if (len <= 0)
//         return; // 避免len等於負值時宣告堆疊陣列當機
//     // r[]模擬堆疊,p為數量,r[p++]為push,r[--p]為pop且取得元素
//     Range r[len];
//     int p = 0;
//     r[p++] = Range(0, len - 1);
//     while (p) {
//         Range range = r[--p];
//         if (range.start >= range.end)
//             continue;
//         T mid = arr[range.end];
//         int left = range.start, right = range.end - 1;
//         while (left < right) {
//             while (arr[left] < mid && left < right) left++;
//             while (arr[right] >= mid && left < right) right--;
//             std::swap(arr[left], arr[right]);
//         }
//         if (arr[left] >= arr[range.end])
//             std::swap(arr[left], arr[range.end]);
//         else
//             left++;
//         r[p++] = Range(range.start, left - 1);
//         r[p++] = Range(left + 1, range.end);
//     }
// }
// 递归法
// 
// template <typename T>
// void quick_sort_recursive(T arr[], int start, int end) {
//     if (start >= end)
//         return;
//     T mid = arr[end];
//     int left = start, right = end - 1;
//     while (left < right) {
//         while (arr[left] < mid && left < right)
//             left++;
//         while (arr[right] >= mid && left < right)
//             right--;
//         std::swap(arr[left], arr[right]);
//     }
//     if (arr[left] >= arr[end])
//         std::swap(arr[left], arr[end]);
//     else
//         left++;
//     quick_sort_recursive(arr, start, left - 1);
//     quick_sort_recursive(arr, left + 1, end);
// }
// template <typename T> //整數或浮點數皆可使用,若要使用物件(class)時必須設定"小於"(<)、"大於"(>)、"不小於"(>=)的運算子功能
// void quick_sort(T arr[], int len) {
//     quick_sort_recursive(arr, 0, len - 1);
