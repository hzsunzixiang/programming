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

