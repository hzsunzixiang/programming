
#include <iostream>
using namespace std;

//https://gcc.gnu.org/onlinedocs/gcc-4.0.2/gcc/Type-Attributes.html

enum __attribute__ ((__packed__))my_packdata  // 起作用
{ 
	result1 = 111 ,
};

#pragma pack(push, 1) // 没起作用

enum  my_unpackdata
{ 
	result2 = 111 ,
};
int main()
{

	enum my_packdata pack;
	cout << "sizeof(my_packdata)\t" << sizeof (pack) << endl;
	enum my_unpackdata unpack;
	cout << "sizeof(my_unpackdata)\t" << sizeof (unpack) << endl;
	return 0;
}

#pragma pack(pop)     // return to previous pack setting

// p_jdzxsun@centos7:~/programming/cpp/c++study/enum$ ./enum
// sizeof(my_packdata)     1
// sizeof(my_unpackdata)   4

