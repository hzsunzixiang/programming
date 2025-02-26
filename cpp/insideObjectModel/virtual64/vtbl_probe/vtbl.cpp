#include <iostream>
using namespace std;

class base_class
{
	public:
		base_class()
		{
			x = 100;
			cout << "This is  base_class's Constructor()" << endl;
		}
		virtual ~base_class()
		{
			x = -100;
			cout << "This is  base_class's Deconstructor()" << endl;
		}

		int normal_func()
		{
			cout << "This is  base_class's normal_func()" << endl;
			x = 100;
			return 0;
		}
		virtual int virtual_fuc()
		{
			cout << "This is  base_class's virtual_fuc()" << endl;
			return 0;
		}
		int x;

};

class drived_class1 : public base_class
{
	public:
		drived_class1()
		{
			y = 200;
			cout << "This is  drived_class1's Constructor()" << endl;
		}
		~drived_class1()
		{
			y = -200;
			cout << "This is  drived_class1's Deconstructor()" << endl;
		}

		int normal_func()
		{
			cout << "This is  drived_class1's normal_func()" << endl;
			y = 100;
			return 0;
		}
		virtual int virtual_fuc()
		{
			cout << "This is  drived_class1's virtual_fuc()" << endl;
			return 0;
		}
		int y;
};

class drived_class2 : public base_class
{
	public:
		drived_class2()
		{
			z = 300;
			cout << "This is  drived_class2's Constructor()" << endl;
		}
		~drived_class2()
		{
			z = -300;
			cout << "This is  drived_class2's Deconstructor()" << endl;
		}

		int normal_func()
		{
			cout << "This is  drived_class2's normal_func()" << endl;
			z = 700;
			return 0;
		}
		virtual int virtual_fuc()
		{
			cout << "This is  drived_class2's virtual_fuc()" << endl;
			return 0;
		}
		int z;
};


int main()
{
	base_class * pbc = NULL;
	cout << "---------------------------------------------" << endl;
	base_class bc;
	cout << "---------------------------------------------" << endl;
	drived_class1 dc1;
	cout << "---------------------------------------------" << endl;
	drived_class2 dc2;
	cout << "---------------------------------------------" << endl;

	pbc = &bc;
	pbc->normal_func();
	pbc->virtual_fuc();

	cout << "---------------------------------------------" << endl;
	pbc = &dc1;
	pbc->normal_func();  // 非虚函数  调用的仍然是基类的
	((drived_class1*)pbc)->normal_func();  // 非虚函数 强制转换 
	// 这个也能成功?
	((drived_class2*)pbc)->normal_func();  // 非虚函数 强制转换 
	cout << "the value of z:" << ((drived_class2*)pbc)->z << endl;  


	//drived_class2* pd2=dynamic_cast<drived_class2 *>(pbc);
	//call	__dynamic_cast

//.L44:
//	.loc 1 114 0 discriminator 2
//	movl	$0, %ecx
//	movl	$_ZTI13drived_class2, %edx
//	movl	$_ZTI10base_class, %esi
//	movq	%rax, %rdi
//	call	__dynamic_cast

	// 这里是类型安全的 会 段错误
	//dynamic_cast<drived_class2 *>(pbc)->normal_func();

	pbc->virtual_fuc();

	cout << "---------------------------------------------" << endl;
	pbc = &dc2;
	pbc->normal_func();
	dc2.normal_func();
	pbc->virtual_fuc();
	cout << "---------------------------------------------" << endl;
	return 0;

}
//.LEHB15:
//	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
//	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
//	movq	%rax, %rdi
//	call	_ZNSolsEPFRSoS_E
//	.loc 1 98 0
//	leaq	-48(%rbp), %rax
//	movq	%rax, -24(%rbp)
//	.loc 1 99 0
//	movq	-24(%rbp), %rax
//	movq	%rax, %rdi
//	call	_ZN10base_class11normal_funcEv
//	.loc 1 100 0
//	movq	-24(%rbp), %rax
//	movq	(%rax), %rax
//	addq	$16, %rax
//	movq	(%rax), %rax
//	movq	-24(%rbp), %rdx
//	movq	%rdx, %rdi
//	call	*%rax
//	.loc 1 102 0
//	movl	$.LC10, %esi
//	movl	$_ZSt4cout, %edi
//	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
//	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
//	movq	%rax, %rdi
//	call	_ZNSolsEPFRSoS_E
//	.loc 1 103 0
//	leaq	-64(%rbp), %rax
//	movq	%rax, -24(%rbp)
//	.loc 1 104 0
//	movq	-24(%rbp), %rax
//	movq	%rax, %rdi
//	call	_ZN10base_class11normal_funcEv
//	.loc 1 105 0
//	movq	-24(%rbp), %rax
//	movq	(%rax), %rax
//	addq	$16, %rax
//	movq	(%rax), %rax
//	movq	-24(%rbp), %rdx
//	movq	%rdx, %rdi
//	call	*%rax
//	.loc 1 107 0
//	movl	$.LC10, %esi
//	movl	$_ZSt4cout, %edi
//	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
//	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
//	movq	%rax, %rdi
//	call	_ZNSolsEPFRSoS_E
//	.loc 1 108 0
//	leaq	-80(%rbp), %rax
//	movq	%rax, -24(%rbp)
//	.loc 1 109 0
//	movq	-24(%rbp), %rax
//	movq	%rax, %rdi
//	call	_ZN10base_class11normal_funcEv
//	.loc 1 110 0
//	movq	-24(%rbp), %rax
//	movq	(%rax), %rax
//	addq	$16, %rax
//	movq	(%rax), %rax
//	movq	-24(%rbp), %rdx
//	movq	%rdx, %rdi
//	call	*%rax
//	.loc 1 111 0
//	movl	$.LC10, %esi
//	movl	$_ZSt4cout, %edi
//	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
//	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
//	movq	%rax, %rdi
//	call	_ZNSolsEPFRSoS_E
