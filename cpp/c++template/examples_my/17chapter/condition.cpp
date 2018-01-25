

#include <iostream>

using namespace std;


int main()
{
	int N = 100;
	int mid = 8;
	int tmp1 = 0;
	int tmp2 = 0;
    int result = (N<mid*mid) ? (++tmp1) : (tmp2=400);
	cout << "result:\t" << result << "\ttmp1\t" << tmp1 << "\ttmp2\t" << tmp2 << endl;
	return 0;
}

// 看起来 ?: 运算符 是短路求值
    // enum { result = (N<mid*mid) ? Sqrt<N,LO,mid-1>::result
    //                             : Sqrt<N,mid,HI>::result };
