
#include <string>
#include <iostream>
#include <stack>
using namespace std;

// {} [] ()
bool ArePair(char opening, char closing)
{
	if ((opening == '(' && closing == ')')
		||	(opening == '{' && closing == '}')
		||	(opening == '[' && closing == ']')
	   )
	{
		return true;
	}
	return false;
}

bool AreParanthesesBalanced(const string& exp)
{
	stack<char> S;

	size_t len = exp.length();
	for (size_t i = 0; i < len; i++)
	{
		if (exp[i] == '(' || exp[i] == '{' || exp[i] == '[')
		{
			S.push(exp[i]);
		}
		else if( exp[i] == ')' ||exp[i] == '}' || exp[i] == ']')
		{
			if( !S.empty() && ArePair(S.top(), exp[i]))
			{
				S.pop();
			}
			else
				return false;
		}
		// 允许 匹配的括号之间有内容
		//else
		//	return false;
	}

	if (S.empty())
	{
		return true;
	}
	return false;
}



int main()
{
	//string test = "{([][]{()})}{}[]";
	//string test = "{([][]{()})}{}[]";
	string test = "({[xxx]{xxx}})";
	cout << AreParanthesesBalanced(test) << endl;;
	return 0;
}

