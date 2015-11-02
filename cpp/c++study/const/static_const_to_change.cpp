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
		static int const result = 111111;  // class 中的static int const 不能取地址
};

// 有这句定义可以取地址，不然不能取地址
int const Static_const::result;
int main()
{
	Static_const e;
	cout << sizeof (e) << endl;
	//cout << &(e.result) << endl;
	cout << e.result << endl;
	cout << &(Static_const::result) << endl;
	// ConstCaseFun(&Static_const::result);  // 同样会 Segmentation fault


	return 0;
}

//	cout << &(e.result) << endl;

///root/programming/cpp/c++study/static_const_vs_enum/static_const.cpp:26: undefined reference to `Static_const::result'
//collect2: error: ld returned 1 exit status

