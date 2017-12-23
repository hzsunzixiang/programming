
#include <iostream>
using namespace std;

template <typename T>
void printArray(T arr[], int len)
{
	cout <<  "begin:";
	for (int i = 0; i < len; i++)
	{
		//printf("i:%d, val:%d\t", i, arr[i]);
		//printf("%6d", arr[i]);
		cout << arr[i] << "\t";
	}
	cout << "end\n";
}
template <typename T>
void swap(T arr[], int i, int j)
{
	T temp = arr[i];

	arr[i] = arr[j];
	arr[j] = temp;
}
template <typename T>    // //整數或浮點數皆可使用,若要使用物件(class)時必須設定大於(>)的運算子功能
void bubble_sort(T arr[], int len)
{
	for (int i = 0; i < len-1; i++)
	{
		for (int j = 0; j < len-i-1; j++)
		{
			if (arr[j] > arr[j+1])
			{
				//swap(arr[j], arr[j+1]);   // 用c++本身的swap 函数
				swap(arr, j+1, j);
			}
		}
	}
}


int main()
{
	int arr[] = { 61, 17, 29, 22, 34, 60, 72, 21, 50, 1, 62 }; 
	int len = (int) sizeof(arr) / sizeof(*arr);
	bubble_sort(arr, len);
	for (int i = 0; i < len; i++)
		cout << arr[i] << ' ';
	cout << endl;

	float arrf[] = { 17.5, 19.1, 0.6, 1.9, 10.5, 12.4, 3.8, 19.7, 1.5, 25.4, 28.6, 4.4, 23.8, 5.4 };
	int lenf = sizeof(arrf)/sizeof(*arrf);
	printArray(arrf, lenf);
	bubble_sort(arrf, lenf);
	printArray(arrf, lenf);
}
