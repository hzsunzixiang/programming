#pragma once
#include <new>
#include "time.h"
#include <string.h>
#include <stdlib.h>

//#include "External/clog/macro_define.h"
//#include "External/clog/log.h"

using namespace std;

#ifdef MEM_CHECK

extern void * operator new(size_t size, const char* file, const size_t line) throw(std::bad_alloc);
extern void   operator delete(void *ptr, const char* file, const size_t line) throw();
extern void * operator new[](size_t size, const char* file, const size_t line);
extern void   operator delete[](void *ptr, const char* file, const size_t line);

/*
 * 标准库的八个函数
extern void *operator new(size_t);
extern void *operator new[](size_t);
extern void  operator delete(void *ptr);
extern void  operator delete[](void *ptr);

extern void *operator new(size_t size, nothrow_t &nothrow);
extern void *operator new[](size_t size, nothrow_t &nothrow);
extern void  operator delete(void *ptr, nothrow_t &nothrow);
extern void  operator delete[](void *ptr, nothrow_t &nothrow);
*/
extern void PrintMallocInfo();


#define ZNEW new(__FILE__, __LINE__)
#define ZDELX(x) operator delete(x, __FILE__, __LINE__)
#define ZDEL(x) ZDELX(x); (x)=NULL;
#define ZNEWARRAY(x) operator new[](__FILE__, __LINE__)
#define ZDELARRAY(x)  operator delete [](x, __FILE__, __LINE__); (x)=NULL;

#else

#define ZNEW new
#define ZDELX(x) delete (x)
#define ZDEL(x) ZDELX(x); (x)=NULL;
#define ZDELARRAY(x) delete [](x); (x)=NULL;

#endif

#define ZMOLLOC malloc
#define ZFREE free
#define ZCALLOC calloc
#define ZREALLOC realloc
