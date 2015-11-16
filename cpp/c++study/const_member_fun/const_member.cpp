// http://stackoverflow.com/questions/3682049/functions-with-const-arguments-and-overloading

#include <iostream> 
using std::cout; 
using std::endl; 

class Test { 
	public: 
		Test(){}
		int foo (const int) const; 
		int foo (int ); 
		int bar (const int) const; 
		int test (const int); 
}; 

//	call	_ZN4Test3fooEi
//	call	_ZNK4Test3fooEi
//
//	call	_ZNK4Test3barEi
//	call	_ZNK4Test3barEi
//
//	call	_ZN4Test4testEi

int main () 
{ 
	Test obj;
	Test const objc;  // const object
	// 编译器自动选择
	obj.foo(3);       // calls non const overload, object expression obj is non const
	objc.foo(3);      // calls const overload, object expression objc is const


	obj.bar(3);       
	objc.bar(3);      

	obj.test(3);       
	// objc.test(3);  // const Test’ as ‘this’ argument of ‘int Test::test(int)’ discards qualifiers [-fpermissive]

} 

int Test::foo(int a) 
{ 
	cout << " int Test::foo(int a) " << endl;
	a++; 
	return a; 
} 

int Test::foo (const int a) const
{ 
	cout << " int Test::foo(const int a) const " << endl;
	return a; 
} 

int Test::bar(const int a) const
{ 
	cout << " int Test::bar(const int a) const " << endl;
	return a; 
} 
int Test::test(const int a) 
{ 
	cout << " int Test::test(const int a) " << endl;
	return a; 
} 
