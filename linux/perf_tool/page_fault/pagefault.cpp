
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

int main(void) 
{ 
	//getchar();
	sleep(5);

	char* ptr;

 	// ptr = (char*) malloc(1*4);
	// free(ptr);

	//sleep(5);

	int i = 0;
	//char *tmp[100] ;
	// 情形一 
	// malloc 分配内存时  不 free 
	// 如果不触发mmap (<128k) 不管是否有使用 都会实际分配物理内存
	// 申请<=4k时 会实际分配4k  满4k 产生一次minifault 否则不会
	// 且知会在第一次调用brk(什么时候会再次调用)
	// free的时候 只会在第一次产生minifault 之后不再产生
	while(1)
	{
		#define  N 1*1024
		ptr = (char*) malloc(N);
		//memset(ptr, 'c', N);
		//free(ptr);
		sleep(1);
	}

	return 0;
	// 情形二  持续申请大块内存  不free
	// mmap 分配内存时 (>= 128k)  不 free
	// 如果不使用 只会分配虚拟内存 同时物理内存也有上升  产生一次 minifault
	// 如果使用 同时分配物理内存  同时产生比较多的minifault
	while(1)
	{
		#define  N 128*1024
		ptr = (char*) malloc(N);
		memset(ptr, 'c', N);
		//free(ptr);
		sleep(1);
	}

	// 情形三  持续申请大块内存  然后free
	// mmap 分配内存时 (>= 128k)  然后free
	// 如果不使用  只会在第一申请时产生 minifault 分配一次虚拟内存  不实际分配物理内存
	// 如果使用 同时分配一块物理内存 之后不会再产生minifalut (因为物理内存已经载入了) 
	while(1)
	{
		#define  N 128*1024
		ptr = (char*) malloc(N);
		memset(ptr, 'c', N);
		free(ptr);
		sleep(1);
	}
	//. while(1)
	//. {
	//. 	#define  N 128*1024
	//. 	ptr = (char*) malloc(N);
	//. 	memset(ptr, 'c', N);
	//. 	//free(ptr);
	//. 	//usleep(100);
	//. 	sleep(1);
	//. }

	// while(1)
	// {
	// 	ptr = (char*) malloc(1000*1024);
	// 	sleep(5);
	// }
	//free(ptr);
	//
	//sleep(5);

	//ptr = (char*)malloc(4*1024);
	//memset(ptr, 'c', 4*1024);
	//free(ptr);

	//A *ptr = new A;
	//
	getchar();
	return 0;
}

// 关键点1：
// 	char* ptr = (char*) malloc(1*1024);
// delete ptr;
// Brk分配虚拟内存，不分配物理内存，所以没有minflt。
//
// 	关键点2：
// 	char* ptr = (char*) malloc(1000*1024);
// delete ptr;
// mmap2分配虚拟内存，也分配物理内存，产生minflt。

// 	关键点3：
// 	char * ptr = (char*)malloc(4*1024);
// memset(ptr, ‘c’, 4*1024);
// Brk分配虚拟内存，且产生一次minflt（每个物理页4K）。
//
// 	关键点4：
// 	A *ptr = new A;
// 分配虚拟和物理内存，
