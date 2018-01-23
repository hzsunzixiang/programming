
#include <list>
#include <vector>

using namespace std;



template <typename T>
class Trap
{
	public:
		enum { x };  // (1) x is not a type here
};


template <typename T>
class Victim
{
	public:
		int y;
		void poof()
		{
			// typename.cpp:24:4: error: need ‘typename’ before ‘Trap<T>::x’ because ‘Trap<T>’ is a dependent scope
			// Trap<T>::x  y;  
			// 这里是按乘积来算的
			//Trap<T>::x * y;  // 这里究竟是声明还是乘积  (2) declaration or multiplication?
			typename Trap<T>::x * y;     // 这样就是对的

		}
};

//The language definition resolves this problem by specifying that in general a dependent qualified name does not
//denote a type unless that name is prefixed with the keyword typename.


template<>
class Trap<void>
{
	public:
		typedef int x;  // 这里的x是一个类型
};

// typename.cpp: In instantiation of ‘void Victim<T>::poof() [with T = void]’:
// typename.cpp:44:12:   required from here
// typename.cpp:27:15: error: dependent-name ‘Trap<T>::x’ is parsed as a non-type, but instantiation yields a type
//     Trap<T>::x * y;  // 这里究竟是声明还是乘积  (2) declaration or multiplication?
//                ^
// typename.cpp:27:15: note: say ‘typename Trap<T>::x’ if a type is meant
// Makefile:8: recipe for target 'typename' failed

// 如果没下面的调用 由于延迟实例化 则Victim 中不会报错
void boom(Victim<void>& bomb)
{
	bomb.poof();

}

int main()
{
	return 0;
}
