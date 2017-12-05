#include <map>
#include "z_memcheck.h"
#include "stdio.h"

struct stMallocInfo
{
    size_t size;        //申请的内存大小
    void   *ptr;        //申请的内存的地址
    char   file[64];    //申请内存的代码的文件名
    size_t line;        //申请内存的代码的行号
    size_t time;        //内存申请成功的时刻

    stMallocInfo()
    {
        memset(this, 0, sizeof(*this));
    }

    stMallocInfo(
            size_t a_size,
            void   *a_ptr,
            const char*  a_file,
            const size_t a_line,
            size_t a_time)
        : size(a_size), ptr(a_ptr), line(a_line), time(a_time)
    {
        memcpy(file, a_file, sizeof(file) - 1);
    }

    stMallocInfo &operator = (const stMallocInfo &objInfo)
    {
        memcpy(this, &objInfo, sizeof(*this));
        return *this;
    }

    ~stMallocInfo()
    {
        memset(this, 0, sizeof(*this));
    }
};

struct stAddrCmp
{
    bool operator()(const void *ptr1, const void *ptr2) const
    {
        return ((unsigned long long)ptr1 < (unsigned long long)ptr2);
    }
};


/*
 *存放所有new出来的内存信息的全局容器
 *有vector改为map，考虑到数据量大时，删除时查找性能
 *如果使用vector，遍历删除的时间复杂度是O(n)
 *而使用map，查找删除的时间复杂度是O(logn)
 *使用包裹函数，是为了避免多个全局变量的依赖问题
 */
std::map<void *, stMallocInfo, stAddrCmp> & getGlobalMallocInfo()
{
    static std::map<void *, stMallocInfo, stAddrCmp> s_mapMallocInfo;   
    return s_mapMallocInfo;
}

void * operator new(size_t size, const char* file, const size_t line) throw(std::bad_alloc)
{
    if(size == 0)
    {
        size = 1;
    }

    //保证new能够申请到内存再返回
    while(true)
    {
        void *ptr = malloc(size);
        if(ptr)
        {

            size_t time_now = time(NULL);
            stMallocInfo objMallocInfo(size, ptr, file, line, time_now);
	    std::map<void *, stMallocInfo, stAddrCmp> & g_mapMallocInfo = getGlobalMallocInfo();
            g_mapMallocInfo[ptr] = objMallocInfo;

            return ptr;
        }
        else
        {
            //内存申请失败处理函数

            //获取当前的new_handler 
            new_handler globalHandler = set_new_handler(0);
            set_new_handler(globalHandler);
            if(globalHandler)
            {
                (*globalHandler)();
            }
            else
            {
                throw std::bad_alloc();
            }
        }
    }
}

void   operator delete(void *ptr, const char* file, const size_t line) throw()
{
    if(ptr == NULL)
    {
        return ;
    }

    std::map<void *, stMallocInfo, stAddrCmp> & g_mapMallocInfo = getGlobalMallocInfo();
    std::map<void *, stMallocInfo>::iterator it = g_mapMallocInfo.find(ptr);
    if(it != g_mapMallocInfo.end())
    {
	printf("g_mapMallocInfo erase element : memory addr:%p, memory size:%zd, \
		file name:%s, line number:%zd, calloc time:%zd\n",
		it->second.ptr, it->second.size, it->second.file, it->second.line, it->second.time);
	g_mapMallocInfo.erase(it);
    }
    else
    {
		printf("addr:%p is not in g_mapMallocInfo\n", ptr);
    }

    free(ptr);
}

void * operator new[](size_t size, const char* file, const size_t line)
{
    return operator new(size);
}

void operator delete[](void *ptr, const char* file, const size_t line)
{
    operator delete(ptr);
}

void PrintMallocInfo()
{
    std::map<void *, stMallocInfo, stAddrCmp> & g_mapMallocInfo = getGlobalMallocInfo();
    std::map<void *, stMallocInfo>::iterator it = g_mapMallocInfo.begin(); 
    for(; it != g_mapMallocInfo.end(); ++it)
    {
        printf("g_mapMallocInfo element size-%zd: memory addr:%p, memory size:%zd, \
                file name:%s, line number:%zd, calloc time:%zd\n",g_mapMallocInfo.size(),
                it->second.ptr, it->second.size, it->second.file, it->second.line, it->second.time);
    }
}
