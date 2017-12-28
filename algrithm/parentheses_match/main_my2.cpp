//数据结构上机实验作业（二）
//时间：2017年10月11日
//Accepted by TaiFu_S
// https://taifua.com/dspractice.html#directory-1

#include <iostream>
#include <cstdio>
#include <cstring>
#include <stack>
using namespace std;

bool check(string s)
{
	stack<char>st;
	bool f = true;
	for (int i = 0; i < s.length() && f; ++i)
	{
		if (s[i] == '(' || s[i] == '[' || s[i] == '{')
			st.push(s[i]);
		else if (!st.empty() && st.top() == '(' && s[i] == ')')
			st.pop();
		else if (!st.empty() && st.top() == '[' && s[i] == ']')
			st.pop();
		else if (!st.empty() && st.top() == '{' && s[i] == '}')
			st.pop();
		else
			f = false;
	}
	if (f && st.empty())
		return true;
	return false;
}
int main()
{
	// 这个算法只适合 括号中间没有内容的情况
	string test = "{([][]{()})}{}[]";
	//string test = "({[xxx]{xxx}})";
	if (check(test))
		cout << "OK" << endl;
	else
		cout << "Error" << endl;
	return 0;
}
