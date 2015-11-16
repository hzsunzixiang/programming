


// 二 重写（override）
// 概念：
// 
// 也称为覆盖，子类重新定义父类中有相同名称和参数的虚函数，主要在继承关系中出现。
// 基本条件：
// 
//     重写的函数和被重写的函数必须为virtual函数，分别位于基类和派生类中；
//     重写的函数和被重写的函数函数名和函数参数必须一致；
//     重写的函数和被重写的函数返回值相同，或者都返回指针或引用，并且派生类虚函数所返回的指针或引用的类型是基类中被替换的虚函数所返回的指针或引用的类型的子类型。
// 
// 注意：
// 
//     重写的函数所抛出的异常必须和被重写的函数所抛出的异常一致，或者是其子类；
//     重写的函数的访问修饰符可以不同于被重写的函数，如基类的virtual函数的修饰符为private，派生类改为public或protected也是可以的。
//     静态方法不能被重写，也就是static和virtual不能同时使用。
//     重写的函数可以带virtual关键字，也可以不带。
// 
// 

// 
//     子类和父类的函数名称相同，但参数不同，此时不管父类函数是不是virtual函数，都将被隐藏。
//     子类和父类的函数名称相同，参数也相同，但是父类函数不是virtual函数，父类的函数将被隐藏。
//     子类和父类的函数名称相同，但`返回参数`不同，此时父类函数是virtual函数 那么直接报错, 除非返回的指针是协变的 。

#include <iostream>
using namespace std;


class A {
};

class B : public A {
};


class C {
	public:
		virtual void Func1() {
			std::cout << "class C: func 1" << std::endl;
		}

		virtual A* Func2() {
			std::cout << "class C: func 2" << std::endl;
			return new A;
		}

		// ERROR:静态函数不能被声明为virtual，也就没办法被重写。
		// static virtual void FuncStatic() {}

		//由于Func3被声明为private，所以需要通过public函数来调用

		// _ZN1C9ShowFunc3Ev:
		// .LFB973:
		// 	.......
		// 	movq	(%rax), %rax
		// 	movq	-8(%rbp), %rdx
		// 	movq	%rdx, %rdi
		// 	call	*%rax     # 如果被调函数不是虚函数，那么静态调用 call	_ZN1C5Func3Ev
		// 	leave
		// 	ret
		//     .......
		void ShowFunc3() {
			Func3();  // 这个函数按虚函数的方式来调用
		}

		virtual void Func4() {
			std::cout << "class C: func 4" << std::endl;
		}

	private:
		virtual void Func3() {
			std::cout << "class C: func 3" << std::endl;
		}
};

class D : public C {
	public:
		// OK: 重写C类Func1，可以不带virtual关键字
		void Func1() {
			std::cout << "class D: func 1" << std::endl;
		}

		// OK: 当返回值为指针或者引用时，返回值可以是父类返回值类型的子类
		virtual B* Func2() {
			std::cout << "class D: func 2" << std::endl;
			return new B;
		}

		// ERROR: 除上面的情况，返回值类型要和父类一致
		/*virtual bool Func2() {
		  }*/

		// OK: 重写的函数的访问修饰符可以不同于被重写的函数
		virtual void Func3() {
			std::cout << "class D: func 3" << std::endl;
		}

	private:
		// OK: 重写的函数的访问修饰符可以不同于被重写的函数
		virtual void Func4() {
			std::cout << "class D: func 4" << std::endl;
		}
};


int main()
{
	C* cc = new C;
	C* cd = new D;
	D* dd = new D;

	// call	*%rax
	// call	*%rax
	// call	_ZN1C9ShowFunc3Ev
	// call	*%rax

	cout << "-------------------------------------" << endl;
	cc->Func1();
	cc->Func2();
	cc->ShowFunc3();
	cc->Func4();

	// call	*%rax
	// call	*%rax
	// call	_ZN1C9ShowFunc3Ev
	// call	*%rax

	cout << "-------------------------------------" << endl;
	cd->Func1();
	cd->Func2();
	cd->ShowFunc3();
	cd->Func4();
	cout << "-------------------------------------" << endl;

	// call	*%rax
	// call	*%rax
	// call	_ZN1C9ShowFunc3Ev
	dd->Func1();
	dd->Func2();
	dd->ShowFunc3();
	//dd->Func4();
	cout << "-------------------------------------" << endl;


	return 0;
}

