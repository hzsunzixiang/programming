#include <iostream>
#include <stdint.h>
using namespace std;

// http://www.perfect-is-shit.com/cpp-vtable.html

typedef void(*func_pointer)(void);

class base_class
{
	public:
		virtual void v_func1()
		{
			cout << "This is base_class's v_func1()" << endl;
		}
		virtual void v_func2()
		{
			cout << "This is base_class's v_func2()" << endl;
		}
		virtual void v_func3()
		{
			cout << "This is base_class's v_func3()" << endl;
		}
	public:
		int x;
		int y;
};
class dev_class : public base_class
{
	public:
		virtual void v_func4()
		{
			cout << "This is dev_class's v_func4()" << endl;
		}
		virtual void v_func5()
		{
			cout << "This is dev_class's v_func5()" << endl;
		}
	public:
		int y;
		int z;
};

int main()
{
	// 查看 dev_class 的虚函数表
	base_class bc;
	base_class *pbc = &bc;

	pbc->v_func1();

	dev_class dc;
	dev_class *pdc = &dc;
	
	pdc->v_func4();
	cout << "-------------base_class------------------------" << endl;
	cout << "bc._vptr\t" << bc._vptr <<"\t&bc._vptr\t" << &bc._vptr  << "\t&bc\t" << &bc<< endl;  // 直接就是第一个函数首地址
	// bc._vptr为第一个函数指针， * 可以取出这个函数 
	((func_pointer)*(bc._vptr + 0))();
	((func_pointer)*(bc._vptr + 1))();
	((func_pointer)*(bc._vptr + 2))();

	cout << "\n\n\n-------------dev_class------------------------" << endl;
	cout << "dc._vptr\t" << dc._vptr << endl;
	((func_pointer)*(dc._vptr + 0))();
	((func_pointer)*(dc._vptr + 1))();
	((func_pointer)*(dc._vptr + 2))();
	((func_pointer)*(dc._vptr + 3))();
	((func_pointer)*(dc._vptr + 4))();





	cout << "-------------base_class------------------------" << endl;
	cout << "base_class 的虚函数表首地址为：" << (intptr_t*)&bc << endl;
	cout << "base_class 的 第一个函数首地址：" << (intptr_t*)*(intptr_t*)&bc+0 << endl;
	cout << "base_class 的 第二个函数首地址：" << (intptr_t*)*(intptr_t*)&bc+1 << endl;
	cout << "base_class 的 第三个函数首地址：" << (intptr_t*)*(intptr_t*)&bc+2 << endl;
	cout << "base_class 的虚函数表结束标志: " << (int64_t)*((intptr_t*)*(intptr_t*)&bc+3) << endl;

	cout << "\n\n\n-------------dev_class------------------------" << endl;
	cout << "dev_class 的虚函数表首地址为：" << (intptr_t*)&dc << endl;
	cout << "dev_class 的 第一个函数首地址：" << (intptr_t*)*(intptr_t*)&dc+0 << endl;
	cout << "dev_class 的 第二个函数首地址：" << (intptr_t*)*(intptr_t*)&dc+1 << endl;
	cout << "dev_class 的 第三个函数首地址：" << (intptr_t*)*(intptr_t*)&dc+2 << endl;
	cout << "dev_class 的 第四个函数首地址：" << (intptr_t*)*(intptr_t*)&dc+3 << endl;
	cout << "dev_class 的 第五个函数首地址：" << (intptr_t*)*(intptr_t*)&dc+4 << endl;
	cout << "dev_class 的虚函数表结束标志: " << *((intptr_t*)*(intptr_t*)&dc+5) << endl;





	return 0;
}
// (gdb) set print pretty
// (gdb) p dc
// $1 = {
//   <base_class> = {
//     _vptr.base_class = 0x400c70 <vtable for dev_class+16>,
//     x = 4197213,
//     y = 0
//   },
//   members of dev_class:
//   y = 0,
//   z = 0
// }
// (gdb) p bc
// $2 = {
//   _vptr.base_class = 0x400cb0 <vtable for base_class+16>,
//   x = 4196432,
//   y = 0
// }


// (gdb) p bc
// $2 = {
//   _vptr.base_class = 0x400b30 <vtable for base_class+16>,
//   x = 4196352,
//   y = 0
// }
//ptype obj/class/struct
//查看obj/class/struct的成员，但是会把基类指针指向的派生类识别为基类
//
//set print object on
//这个选项可以看到派生对象的真实类名，虽然ptype也可以打印出对象
//
//set print pretty on
//以树形打印对象的成员，可以清晰展示继承关系，设置为off时对象较大时会显示“一坨”
//
//set print vtbl on
//用比较规整的格式来显示虚函数表
//
//推荐设置这两个：
//set print object on
//set print pretty on
