
#include <stdio.h>

void printArray(int arr[], int len)
{
	printf("begin:");
	for (int i = 0; i < len; i++)
	{
		printf("%6d", arr[i]);
	}
	printf("\tend:");
	printf("\n");
}

int maxSubArray(int arr[], int n)
{
	int curSum = 0;// 每次循环的最大值
	int maxSum = arr[0];  // 是所有的最大值
	for (int i = 0; i < n; i++)
	{
		if (curSum > 0)
		{
			curSum += arr[i];
		}
		else
		{
			curSum = arr[i];
		}

		if (curSum > maxSum)
		{
			maxSum = curSum;
		}
	}
	return maxSum;
}


int maxSubArray1(int arr[], int n)
{
	int curSum = arr[0];  // 每次循环的最大值
	int maxSum = arr[0];  // 是所有的最大值
	for (int i = 1; i < n; i++)
	{
		if (curSum > 0)
		{
			curSum += arr[i];
		}
		else
		{
			curSum = arr[i];
		}

		if (curSum > maxSum)
		{
			maxSum = curSum;
		}
	}
	return maxSum;
}

int main()
{
	int arr[] = {1, -2, 3, 10, -4, 7, 2, -5};
	int len = sizeof(arr)/sizeof(*arr);
	printArray(arr, len);
	int sum = maxSubArray(arr, len);
	printf("sum\t%d\n", sum);
	return 0;
}
