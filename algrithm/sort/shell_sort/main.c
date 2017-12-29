
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




// 原始的算法实现在最坏的情况下需要进行O(n2)的比较和交换。V. Pratt的书[1]对算法进行了少量修改，可以使得性能提升至O(n log2 n)。这比最好的比较算法的O(n log n)要差一些。
// 
// 希尔排序通过将比较的全部元素分为几个区域来提升插入排序的性能。这样可以让一个元素可以一次性地朝最终位置前进一大步。然后算法再取越来越小的步长进行排序，算法的最后一步就是普通的插入排序，但是到了这步，需排序的数据几乎是已排好的了（此时插入排序较快）。
// 
// 假设有一个很小的数据在一个已按升序排好序的数组的末端。如果用复杂度为O(n2)的排序（冒泡排序或插入排序），可能会进行n次的比较和交换才能将该数据移至正确位置。而希尔排序会用较大的步长移动数据，所以小数据只需进行少数比较和交换即可到正确位置。
// 
// 一个更好理解的希尔排序实现：将数组列在一个表中并对列排序（用插入排序）。重复这过程，不过每次用更长的列来进行。最后整个表就只有一列了。将数组转换至表是为了更好地理解这算法，算法本身仅仅对原数组进行排序（通过增加索引的步长，例如是用i += step_size而不是i++）。
// 
// 例如，假设有这样一组数[ 13 14 94 33 82 25 59 94 65 23 45 27 73 25 39 10 ]，如果我们以步长为5开始进行排序，我们可以通过将这列表放在有5列的表中来更好地描述算法，这样他们就应该看起来是这样：
// 
// 13 14 94 33 82
// 25 59 94 65 23
// 45 27 73 25 39
// 10
// 然后我们对每列进行排序：
// 
// 10 14 73 25 23
// 13 27 94 33 39
// 25 59 94 65 82
// 45
// 将上述四行数字，依序接在一起时我们得到：[ 10 14 73 25 23 13 27 94 33 39 25 59 94 65 82 45 ].这时10已经移至正确位置了，然后再以3为步长进行排序：
// 
// 10 14 73
// 25 23 13
// 27 94 33
// 39 25 59
// 94 65 82
// 45
// 排序之后变为：
// 
// 10 14 13
// 25 23 33
// 27 25 59
// 39 65 73
// 45 94 82
// 94
// 最后以1步长进行排序（此时就是简单的插入排序了）。
// 
// 步长序列[编辑]
// 步长的选择是希尔排序的重要部分。只要最终步长为1任何步长序列都可以工作。算法最开始以一定的步长进行排序。然后会继续以一定步长进行排序，最终算法以步长为1进行排序。当步长为1时，算法变为插入排序，这就保证了数据一定会被排序。
// 
// Donald Shell最初建议步长选择为 {\displaystyle {\frac {n}{2}}} \frac{n}{2}并且对步长取半直到步长达到1。虽然这样取可以比 {\displaystyle {\mathcal {O}}(n^{2})} {\mathcal {O}}(n^{2})类的算法（插入排序）更好，但这样仍然有减少平均时间和最差时间的余地。可能希尔排序最重要的地方在于当用较小步长排序后，以前用的较大步长仍然是有序的。比如，如果一个数列以步长5进行了排序然后再以步长3进行排序，那么该数列不仅是以步长3有序，而且是以步长5有序。如果不是这样，那么算法在迭代过程中会打乱以前的顺序，那就不会以如此短的时间完成排序了。
// 
// 步长序列	最坏情况下复杂度
// {\displaystyle {n/2^{i}}} {n/2^i}	{\displaystyle {\mathcal {O}}} \mathcal{O} {\displaystyle (n^{2})} (n^2)
// {\displaystyle 2^{k}-1} 2^k - 1	{\displaystyle {\mathcal {O}}} \mathcal{O} {\displaystyle (n^{3/2})} (n^{3/2})
// {\displaystyle 2^{i}3^{j}} 2^i 3^j	{\displaystyle {\mathcal {O}}} \mathcal{O} {\displaystyle (n\log ^{2}n)} ( n\log^2 n )
// 	已知的最好步长序列是由Sedgewick提出的(1, 5, 19, 41, 109,...)，该序列的项来自 {\displaystyle 9\times 4^{i}-9\times 2^{i}+1} 9\times 4^{i}-9\times 2^{i}+1和 {\displaystyle 2^{i+2}\times (2^{i+2}-3)+1} 2^{{i+2}}\times (2^{{i+2}}-3)+1这两个算式[1]。这项研究也表明“比较在希尔排序中是最主要的操作，而不是交换。”用这样步长序列的希尔排序比插入排序要快，甚至在小数组中比快速排序和堆排序还快，但是在涉及大量数据时希尔排序还是比快速排序慢。
// 
// 	另一个在大数组中表现优异的步长序列是（斐波那契数列除去0和1将剩余的数以黄金分区比的两倍的幂进行运算得到的数列）：(1, 9, 34, 182, 836, 4025, 19001, 90358, 428481, 2034035, 9651787, 45806244, 217378076, 1031612713,…)[2]
