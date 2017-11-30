

#include <iostream>
using namespace std;

// https://stackoverflow.com/questions/449436/singleton-instance-declared-as-static-variable-of-getinstance-method/449823#449823 

// Is Meyers' implementation of the Singleton pattern thread safe?
// https://stackoverflow.com/questions/1661529/is-meyers-implementation-of-the-singleton-pattern-thread-safe
// 2、内部静态实例的懒汉模式

// 这里需要注意的是，C++0X以后，要求编译器保证内部静态变量的线程安全性，可以不加锁。但C++ 0X以前，仍需要加锁。
// http://www.cnblogs.com/ccdev/archive/2012/12/19/2825355.html
class Singleton {
	public:
		static Singleton& Instance()  // 第一次调用 才会调用这里
		{
			static Singleton theSingleton;
			return theSingleton;
		}
		/* more (non-static) functions here */
		void hello()
		{
			cout << "hello, world!" << endl;
		}
	private:
		Singleton() // ctor hidden
		{
			cout << "Singleton init" << endl;
		}
		Singleton(Singleton const&){} // copy ctor hidden
		//Singleton& operator=(Singleton const&){} // assign op. hidden
		~Singleton()// dtor hidden
		{
			cout << "Singleton destroy" << endl;
		}
};

int main()
{
	int i = 10;
	int j = 11; 
	int m = i + j;
	Singleton::Instance().hello(); // 调用这里才会 初始化局部静态变量
	return 0;
}




// 
// In C++11 it is thread safe:
// 
//     §6.7 [stmt.dcl] p4 If control enters the declaration concurrently while the variable is being initialized, the concurrent execution shall wait for completion of the initialization.
// 
// 	In C++03:
// 
// 	    Under g++ it is thread safe.
// 		    But this is because g++ explicitly adds code to guarantee it.
// 
// 			One problem is that if you have two singletons and they try and use each other during construction and destruction.
// 
// 			Read this: Finding C++ static initialization order problems
// 
// 			A variation on this problem is if the singleton is accessed from the destructor of a global variable. In this situation the singleton has definitely been destroyed, but the get method will still return a reference to the destroyed object.
// 
// 			There are ways around this but they are messy and not worth doing. Just don't access a singleton from the destructor of a global variable.
// 
// 			A Safer definition but ugly:
// 			I am sure you can add some appropriate macros to tidy this up
// 
// 			SomeBaseClass &SomeClass::GetInstance()
// {
// #ifdef _WIN32 
// 	Start Critical Section Here
// #elif  defined(__GNUC__) && (__GNUC__ > 3)
// 		// You are OK
// #else
// #error Add Critical Section for your platform
// #endif
// 
// 		    static SomeClass instance;
// 
// #ifdef _WIN32
// 	END Critical Section Here
// #endif 
// 
// 		    return instance;
// }


