#include <stdio.h>
#include <ucontext.h>
#include <unistd.h>

// This makes an infinite loop because context holds the program counter.
int main(int argc, const char *argv[]){
	ucontext_t context;

	getcontext(&context);
	puts("Hello world");
	sleep(1);
	setcontext(&context);
	return 0;
}


//  The function setcontext() restores the user context pointed at by ucp.  A successful call does not return.  The context should have been obtained by a call  of  getcontext(),  or
//  makecontext(3), or passed as third argument to a signal handler.
//  If the context was obtained by a call of getcontext(), program execution continues as if this call just returned.



//    (gdb) info b
//    Num     Type           Disp Enb Address            What
//    2       breakpoint     keep y   0x0000000000400628 in main at infinite_loop.c:9
//            breakpoint already hit 1 time
//    3       breakpoint     keep y   0x000000000040064b in main at infinite_loop.c:12
//            breakpoint already hit 3 times
//    5       breakpoint     keep y   0x0000000000400641 in main at infinite_loop.c:11
//            breakpoint already hit 1 time
//    (gdb) p/x $rip
//    $20 = 0x400641
//    (gdb) n
//    
//    Breakpoint 3, main (argc=1, argv=0x7fffffffe428) at infinite_loop.c:12
//    12              setcontext(&context);
//    (gdb) p/x $rip
//    $21 = 0x40064b
//    (gdb) n
//    Hello world
//    
//    Breakpoint 5, main (argc=1, argv=0x7fffffffe428) at infinite_loop.c:11
//    11              sleep(1);
//    (gdb) p/x $rip
//    $22 = 0x400641
//    (gdb)
//    
