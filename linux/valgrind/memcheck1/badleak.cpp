#include <stdio.h> 
#include "tree.h" 

int main(int argc , char *argv[]) 

{ 
	node *tree1 , *tree2 , *tree3; 
	printf("test\n"); 
	tree1 = mk(mk(mk(0,0,'3'),0,'2'),0,'1'); 
	tree2 = mk(0,mk(0,mk(0,0,'6'),'5'),'4'); 
	tree3 = mk(mk(tree1,tree2,'8'),0,'7'); 
	return 0; 
} 


// 
// stephensun@debian:~/programming/linux/valgrind/memcheck1$ valgrind --leak-check=full ./badleak
// ==7053== Memcheck, a memory error detector
// ==7053== Copyright (C) 2002-2013, and GNU GPL'd, by Julian Seward et al.
// ==7053== Using Valgrind-3.10.0 and LibVEX; rerun with -h for copyright info
// ==7053== Command: ./badleak
// ==7053==
// test
// ==7053==
// ==7053== HEAP SUMMARY:
// ==7053==     in use at exit: 192 bytes in 8 blocks
// ==7053==   total heap usage: 8 allocs, 0 frees, 192 bytes allocated
// ==7053==
// ==7053== 192 (24 direct, 168 indirect) bytes in 1 blocks are definitely lost in loss record 8 of 8
// ==7053==    at 0x4C28C20: malloc (vg_replace_malloc.c:296)
// ==7053==    by 0x40073A: mk(__node*, __node*, char) (tree.cpp:7)
// ==7053==    by 0x400710: main (badleak.cpp:11)
// ==7053==
// ==7053== LEAK SUMMARY:
// ==7053==    definitely lost: 24 bytes in 1 blocks
// ==7053==    indirectly lost: 168 bytes in 7 blocks
// ==7053==      possibly lost: 0 bytes in 0 blocks
// ==7053==    still reachable: 0 bytes in 0 blocks
// ==7053==         suppressed: 0 bytes in 0 blocks
// ==7053==
// ==7053== For counts of detected and suppressed errors, rerun with: -v
// ==7053== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)

