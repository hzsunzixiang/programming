/* Compile: gcc -pthread -m32 -ansi x.c */
#include <stdio.h>
#include <inttypes.h>
#include <pthread.h>
#include <stdbool.h>

static volatile uint32_t var = 1;



//type __sync_lock_test_and_set (type *ptr, type value, ...)
//	This builtin, as described by Intel, is not a traditional test-and-set operation, but rather an atomic exchange operation. It writes value into *ptr, and returns the previous contents of *ptr.
//	Many targets have only minimal support for such locks, and do not support a full exchange operation. In this case, a target may support reduced functionality here by which the only valid value to store is the immediate constant 1. The exact value actually stored in *ptr is implementation defined.
//
//	This builtin is not a full barrier, but rather an acquire barrier. This means that references after the builtin cannot move to (or be speculated to) before the builtin, but previous memory stores may not be globally visible yet, and previous memory loads may not yet be satisfied. 
void *func (void *x) {
	uint32_t y = __sync_lock_test_and_set(&var, 200);
	printf ("y = %"PRIu32"\n", y);
	return x;
}

// 指令xchgl
//	subq	$32, %rsp
//	movq	%rdi, -24(%rbp)
//	.loc 1 10 0
//	movl	$200, %eax
//	xchgl	var(%rip), %eax
//	movl	%eax, -4(%rbp)

int main (void) {
	pthread_t t;
	pthread_create (&t, NULL, func, NULL);
	pthread_join (t, NULL);
	printf ("var = %"PRIu32"\n", var);
	return 0;
}

