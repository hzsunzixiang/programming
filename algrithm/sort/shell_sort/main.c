
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

void insertion_sort(int arr[], int len)
{
	// 对i 从1 到len-1 排序
	for (int i = 1; i < len; i++)
	{
		int temp = arr[i]; // 把要交换的保存一下
		// 从i 遍历 至 1  i...1
		// 每移动一次  j-- 之后正好是留下的空洞 把 temp放进去
		// 如果不满足条件 j 即为要放入的位置
		// 每次都是判断 j所在的位置 是否适合放入 如果不适合 把 a[j-1] 填入
		int j = i;
		for (; j>0&&arr[j-1]>temp; j--)
		{
			arr[j] = arr[j-1];  // a[j-1] 比temp要大 所以需要移动
		}
		arr[j] = temp;
	}
}
	

// // shell排序
// input: an array a of length n with array elements numbered 0 to n − 1
// inc ← round(n/2)
// while inc > 0 do:    
//     for i = inc .. n − 1 do:        
//         temp ← a[i]        
//         j ← i        
//         while j ≥ inc and a[j − inc] > temp do:            
//             a[j] ← a[j − inc]            
//             j ← j − inc        
//         a[j] ← temp    
//     inc ← round(inc / 2)







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



// C语言[编辑]
// void shell_sort(int arr[], int len) {
// 	int gap, i, j;
// 	int temp;
// 	for (gap = len >> 1; gap > 0; gap >>= 1)
// 		for (i = gap; i < len; i++) {
// 			temp = arr[i];
// 			for (j = i - gap; j >= 0 && arr[j] > temp; j -= gap)
// 				arr[j + gap] = arr[j];
// 			arr[j + gap] = temp;
// 		}
// }
// C++[编辑]
// template<typename T>
// void shell_sort(T array[], int length) {
//     int h = 1;
//     while (h < length / 3) {
//         h = 3 * h + 1;
//     }
//     while (h >= 1) {
//         for (int i = h; i < length; i++) {
//             for (int j = i; j >= h && array[j] < array[j - h]; j -= h) {
//                 std::swap(array[j], array[j - h]);
//             }
//         }
//         h = h / 3;
//     }
// }
