#include <iostream>
using namespace std;

void ConstCaseFun(int const * data)
{
	int * tmp = const_cast<int *>(data);	
	*tmp = 111111;
}

// primary template to compute 3 to the Nth
class Static_const{
	public:
		int i; 
		int const result_non;  // class 中的static int const 不能取地址
		// c++11 或gnu++11 支持不初始化 g++ -Wall -g   -std=c++11  class_const.cpp -o class_const
		// class_const.cpp:8:26: warning: non-static data member initializers only available with -std=c++11 or -std=gnu++11 [enabled by default]

	public:
		Static_const():result_non(3333333)
	{}
};

int main()
{
	Static_const e;
	cout << e.result_non << endl;
	ConstCaseFun(&(e.result_non)); 
	cout << e.result_non << endl;

	return 0;
}

//	cout << &(e.result) << endl;

///root/programming/cpp/c++study/static_const_vs_enum/static_const.cpp:26: undefined reference to `Static_const::result'
//collect2: error: ld returned 1 exit status

