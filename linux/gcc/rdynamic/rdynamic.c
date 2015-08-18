// http://stackoverflow.com/questions/8623884/gcc-debug-symbols-g-flag-vs-linkers-rdynamic-option
// http://www.lenky.info/archives/2013/01/2190
#include <stdio.h>
void bar() {}
void baz() {}
void foo() {}
int main()
{ 
	foo();
	printf("test"); 
	return 0;
}
