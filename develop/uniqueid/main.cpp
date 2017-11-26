
#include "z_uniqueid.h"
#include <iostream>
using namespace std;

int main()
{
	//UniqueDWORDID instance;

	// ZUniqueID() {
	// 	initIDRange(1,(T)-1);   // 这里初始化最大值
	// }
	typedef ZUniqueID<uint16_t> UniqueWORDID;
	UniqueWORDID instance;
	//cout << instance.getUniqueID(0UL) << endl;;
	for (;;)
	{
		uint16_t id = 0;
		uint16_t idr = instance.getUniqueID(id);;
		cout << idr << "\t\t" <<  instance.getCurMaxId() << endl; 
		instance.putUniqueID(idr);
	}
	return 0;
}
