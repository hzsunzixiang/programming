//解法一
//copyright@ July && yansha
//updated@ 2014 July
#include<list>
#include<iostream>
using namespace std;

list<int>list1;
void SumOfkNumber(int sum, int n)
{
	// 递归出口
	if (n <= 0 || sum <= 0)
		return;

	// 输出找到的结果
	if (sum == n)
	{
		// 反转list
		list1.reverse();
		for (list<int>::iterator iter = list1.begin(); iter != list1.end(); iter++)
			cout << *iter << " + ";
		cout << n << endl;
	}

	list1.push_front(n);      //典型的01背包问题
	SumOfkNumber(sum - n, n - 1);   //放n，n-1个数填满sum-n
	list1.pop_front();
	SumOfkNumber(sum, n - 1);     //不放n，n-1个数填满sum
}

int main()
{
	int sum, n;
	cout << "请输入你要等于多少的数值sum:" << endl;
	cin >> sum;
	cout << "请输入你要从1.....n数列中取值的n：" << endl;
	cin >> n;
	cout << "所有可能的序列，如下：" << endl;
	SumOfkNumber(sum, n);
	///system("pause");
	return 0;
}





