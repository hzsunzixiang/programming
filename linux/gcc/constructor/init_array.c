// http://book.51cto.com/art/201309/412043.htm
//
//
// 根据函数可见，__libc_csu_init将先后调用段".preinit_array"、".init_array"中包含的函数指针指向的函数。
// 因此，如果打算在程序执行main函数前或者在动态库被加载时做点什么，那么我们可以定义一个函数，并告诉链接器将函数指针存储到段“.preinit_array”或 “.init_array”中

// 相当于 __attribute__((constructor)) 

#include <stdio.h> 

void myinit(int argc, char **argv, char **envp)  
{  
	printf("%s\n", __FUNCTION__);  
}  

void mypreinit(int argc, char **argv, char **envp)  
{  
	printf("%s\n", __FUNCTION__);  
}  
void myfinit(int argc, char **argv, char **envp)  
{  
	printf("%s\n", __FUNCTION__);  
}  
__attribute__((section(".init_array"))) typeof(myinit) *_myinit =  myinit;  
__attribute__((section(".preinit_array"))) typeof(mypreinit) *_mypreinit =  mypreinit;  

// 结束的时候执行.fini_array
// 相当于 __attribute__((destructor)) 
__attribute__((section(".fini_array"))) typeof(myfinit) *_myfinit =  myfinit;  

void test()  
{  
	printf("%s\n", __FUNCTION__);  
}  

#include <stdio.h> 

int main()  
{  
	printf ("Enter main.\n");  
	test();  
	return 0;
} 
