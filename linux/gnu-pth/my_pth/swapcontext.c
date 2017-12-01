
#include <stdio.h>
#include <ucontext.h>
#include <unistd.h>
void func1(void * arg)
{
	printf("func1\n");
}
void context_test()
{
	char szStack[1024 * 128];
	ucontext_t strChild, strMain;
	getcontext(&strChild); //获取当前上下文 
	strChild.uc_stack.ss_sp = szStack;//指定栈空间 
	strChild.uc_stack.ss_size = sizeof(szStack); 
	strChild.uc_stack.ss_flags = 0;
	strChild.uc_link = &strMain;//设置后继上下文 

	makecontext(&strChild, (void(*)(void))func1, 0);//设置上下文指向func1函数 
	swapcontext(&strMain, &strChild);//切换到strChild上下文，保存当前上下文到strstrMain   此时执行 strChild , 执行完毕 再去strMain
	printf("context_test\n");//如果设置了后继上下文，func1函数指向完后会返回此处 
}
int main(int argc, const char *argv[])
{
	context_test();
	return 0;
}
