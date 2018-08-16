#include <typeinfo>

using namespace std;
int main()
{
	int a = 100;
	int b = std::move(a);


	return 0;

}
// https://stackoverflow.com/questions/3106110/what-are-move-semantics/11540204#11540204
// https://stackoverflow.com/questions/3601602/what-are-rvalues-lvalues-xvalues-glvalues-and-prvalues 
//	subq	$16, %rsp
//	.loc 2 6 0
//	movl	$100, -8(%rbp)
//	.loc 2 7 0
//	leaq	-8(%rbp), %rax
//	movq	%rax, %rdi
//	call	_ZSt4moveIRiEONSt16remove_referenceIT_E4typeEOS2_
//	movl	(%rax), %eax
//	movl	%eax, -4(%rbp)
//	.loc 2 10 0
