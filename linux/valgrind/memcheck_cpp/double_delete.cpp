#include <stdlib.h>
#include <unistd.h>
#include <map>

class ZEventManager
{
	public:
		ZEventManager()
		{
			x = 0;
		}
		ZEventManager(int X)
		{
			x = X;
		}


	private:
		int x;
};


class TexasTimerHandler
{
	public:
		TexasTimerHandler()
		{
			m_em = new ZEventManager(10);

			if (m_em == NULL)
			{
			}
		}
		TexasTimerHandler( const TexasTimerHandler &obj)
		{
			m_em = new ZEventManager(10);

			if (m_em == NULL)
			{
			}
		}

		~TexasTimerHandler(void)
		{
			if (m_em!=NULL)
			{
				delete m_em;
				m_em = NULL;
			}
			else
			{
			}
		}

	private:
		ZEventManager *m_em;
};

class CGameTable 
{
	TexasTimerHandler m_ChipinTimer;
};

std::map<int, CGameTable> m_TableList;
int main()
{
	int i = 0;
	for (i = 0; i < 10; i++)
	{
		CGameTable &table =  m_TableList[i];
	}
	return 0;
}




// stephensun@debian:~/programming/linux/valgrind/memcheck_cpp$ valgrind ./double_delete                                                                                                 [3/1177]
// ==2510== Memcheck, a memory error detector
// ==2510== Copyright (C) 2002-2013, and GNU GPL'd, by Julian Seward et al.
// ==2510== Using Valgrind-3.10.0 and LibVEX; rerun with -h for copyright info
// ==2510== Command: ./double_delete
// ==2510==
// ==2510== Invalid free() / delete / delete[] / realloc()
// ==2510==    at 0x4C2A360: operator delete(void*) (vg_replace_malloc.c:507)
// ==2510==    by 0x400A52: TexasTimerHandler::~TexasTimerHandler() (double_delete.cpp:38)
// ==2510==    by 0x400AAB: CGameTable::~CGameTable() (double_delete.cpp:50)
// ==2510==    by 0x400BDC: std::map<int, CGameTable, std::less<int>, std::allocator<std::pair<int const, CGameTable> > >::operator[](int const&) (stl_map.h:504)
// ==2510==    by 0x40095E: main (double_delete.cpp:61)
// ==2510==  Address 0x5a02040 is 0 bytes inside a block of size 4 free'd
// ==2510==    at 0x4C2A360: operator delete(void*) (vg_replace_malloc.c:507)
// ==2510==    by 0x400A52: TexasTimerHandler::~TexasTimerHandler() (double_delete.cpp:38)
// ==2510==    by 0x400AAB: CGameTable::~CGameTable() (double_delete.cpp:50)
// ==2510==    by 0x400AC9: std::pair<int const, CGameTable>::~pair() (stl_pair.h:96)
// ==2510==    by 0x400BD0: std::map<int, CGameTable, std::less<int>, std::allocator<std::pair<int const, CGameTable> > >::operator[](int const&) (stl_map.h:504)
// ==2510==    by 0x40095E: main (double_delete.cpp:61)
// ==2510==
// ==2510== Invalid free() / delete / delete[] / realloc()
// ==2510==    at 0x4C2A360: operator delete(void*) (vg_replace_malloc.c:507)
// ==2510==    by 0x400A52: TexasTimerHandler::~TexasTimerHandler() (double_delete.cpp:38)
// ==2510==    by 0x400AAB: CGameTable::~CGameTable() (double_delete.cpp:50)
// ==2510==    by 0x400AC9: std::pair<int const, CGameTable>::~pair() (stl_pair.h:96)
// ==2510==    by 0x4017A5: __gnu_cxx::new_allocator<std::pair<int const, CGameTable> >::destroy(std::pair<int const, CGameTable>*) (new_allocator.h:133)
// ==2510==    by 0x4010E9: std::_Rb_tree<int, std::pair<int const, CGameTable>, std::_Select1st<std::pair<int const, CGameTable> >, std::less<int>, std::allocator<std::pair<int const, CGameTab
// le> > >::_M_destroy_node(std::_Rb_tree_node<std::pair<int const, CGameTable> >*) (stl_tree.h:409)
// ==2510==    by 0x400EBE: std::_Rb_tree<int, std::pair<int const, CGameTable>, std::_Select1st<std::pair<int const, CGameTable> >, std::less<int>, std::allocator<std::pair<int const, CGameTab
// le> > >::_M_erase(std::_Rb_tree_node<std::pair<int const, CGameTable> >*) (stl_tree.h:1247)
// ==2510==    by 0x400E9B: std::_Rb_tree<int, std::pair<int const, CGameTable>, std::_Select1st<std::pair<int const, CGameTable> >, std::less<int>, std::allocator<std::pair<int const, CGameTab
// le> > >::_M_erase(std::_Rb_tree_node<std::pair<int const, CGameTable> >*) (stl_tree.h:1245)
// ==2510==    by 0x400E9B: std::_Rb_tree<int, std::pair<int const, CGameTable>, std::_Select1st<std::pair<int const, CGameTable> >, std::less<int>, std::allocator<std::pair<int const, CGameTab
// le> > >::_M_erase(std::_Rb_tree_node<std::pair<int const, CGameTable> >*) (stl_tree.h:1245)
// ==2510==    by 0x400E9B: std::_Rb_tree<int, std::pair<int const, CGameTable>, std::_Select1st<std::pair<int const, CGameTable> >, std::less<int>, std::allocator<std::pair<int const, CGameTab
// le> > >::_M_erase(std::_Rb_tree_node<std::pair<int const, CGameTable> >*) (stl_tree.h:1245)
// ==2510==    by 0x400E9B: std::_Rb_tree<int, std::pair<int const, CGameTable>, std::_Select1st<std::pair<int const, CGameTable> >, std::less<int>, std::allocator<std::pair<int const, CGameTab
// le> > >::_M_erase(std::_Rb_tree_node<std::pair<int const, CGameTable> >*) (stl_tree.h:1245)
// ==2510==    by 0x400C8C: std::_Rb_tree<int, std::pair<int const, CGameTable>, std::_Select1st<std::pair<int const, CGameTable> >, std::less<int>, std::allocator<std::pair<int const, CGameTab
// le> > >::~_Rb_tree() (in /home/stephensun/programming/linux/valgrind/memcheck_cpp/double_delete)
// ==2510==  Address 0x5a02700 is 0 bytes inside a block of size 4 free'd
// ==2510==    at 0x4C2A360: operator delete(void*) (vg_replace_malloc.c:507)
// ==2510==    by 0x400A52: TexasTimerHandler::~TexasTimerHandler() (double_delete.cpp:38)
// ==2510==    by 0x400AAB: CGameTable::~CGameTable() (double_delete.cpp:50)
// ==2510==    by 0x400AC9: std::pair<int const, CGameTable>::~pair() (stl_pair.h:96)
// ==2510==    by 0x400BD0: std::map<int, CGameTable, std::less<int>, std::allocator<std::pair<int const, CGameTable> > >::operator[](int const&) (stl_map.h:504)
// ==2510==    by 0x40095E: main (double_delete.cpp:61)
// ==2510==
// ==2510==
// ==2510== HEAP SUMMARY:
// ==2510==     in use at exit: 0 bytes in 0 blocks
// ==2510==   total heap usage: 20 allocs, 40 frees, 520 bytes allocated
// ==2510==
// ==2510== All heap blocks were freed -- no leaks are possible




// 如果不 delete



// stephensun@debian:~/programming/linux/valgrind/memcheck_cpp$ valgrind  --leak-check=full  ./double_delete
// ==2524== Memcheck, a memory error detector
// ==2524== Copyright (C) 2002-2013, and GNU GPL'd, by Julian Seward et al.
// ==2524== Using Valgrind-3.10.0 and LibVEX; rerun with -h for copyright info
// ==2524== Command: ./double_delete
// ==2524==
// ==2524==
// ==2524== HEAP SUMMARY:
// ==2524==     in use at exit: 40 bytes in 10 blocks
// ==2524==   total heap usage: 20 allocs, 10 frees, 520 bytes allocated
// ==2524==
// ==2524== 40 bytes in 10 blocks are definitely lost in loss record 1 of 1
// ==2524==    at 0x4C29180: operator new(unsigned long) (vg_replace_malloc.c:324)
// ==2524==    by 0x400A0C: TexasTimerHandler::TexasTimerHandler() (double_delete.cpp:28)
// ==2524==    by 0x400A7F: CGameTable::CGameTable() (double_delete.cpp:50)
// ==2524==    by 0x400B80: std::map<int, CGameTable, std::less<int>, std::allocator<std::pair<int const, CGameTable> > >::operator[](int const&) (stl_map.h:504)
// ==2524==    by 0x40095E: main (double_delete.cpp:61)
// ==2524==
// ==2524== LEAK SUMMARY:
// ==2524==    definitely lost: 40 bytes in 10 blocks
// ==2524==    indirectly lost: 0 bytes in 0 blocks
// ==2524==      possibly lost: 0 bytes in 0 blocks
// ==2524==    still reachable: 0 bytes in 0 blocks
// ==2524==         suppressed: 0 bytes in 0 blocks
// ==2524==
// ==2524== For counts of detected and suppressed errors, rerun with: -v
// ==2524== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 1 from 1)

