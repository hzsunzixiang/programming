#include <stdio.h>


int global_uninit; /* Uninitialized variable stored in bss*/
int global_init = 10; /* initialized global variable stored in DS*/


// static 函数，必须放在调用者foo之前
static int bar()
{
	int i = 10;
	return i  + 10;

}
int foo()
{
	return bar();
}



int main(void)
{
	static int i_uninit; /* Uninitialized static variable stored in bss */
	static int i_init = 100; /* Initialized static variable stored in DS*/
	int i_local_in_main  = 10;

	foo();

	return 0;
}

// root@debian32-1:~/programming/linux/my_apue/memory_layout# readelf -s elf_of_use

//    41: 00000000     0 FILE    LOCAL  DEFAULT  ABS elf_of_use.c
//    42: 080483cb    21 FUNC    LOCAL  DEFAULT   13 bar                           static 函数
//    43: 080496e4     4 OBJECT  LOCAL  DEFAULT   24 i_init.1855                 初始化静态变量 local
//    44: 080496ec     4 OBJECT  LOCAL  DEFAULT   25 i_uninit.1854             未初始化静态变量local
//    57: 080496f0     4 OBJECT  GLOBAL DEFAULT   25 global_uninit            未初始化全局变量
//    67: 080483e0    10 FUNC    GLOBAL DEFAULT   13 foo                           全局函数
//    69: 080482d0     0 FUNC    GLOBAL DEFAULT   13 _start                        程序的入口地址，在main之前运行
//    72: 080483ea    25 FUNC    GLOBAL DEFAULT   13 main                         main函数入口


