/* Compile: gcc -pthread -m32 -ansi x.c */
#include <stdio.h>
#include <inttypes.h>
#include <pthread.h>

static volatile uint32_t var = 0;

//	movl	$0, %eax
//	movl	$1, %edx
//	lock cmpxchgl	%edx, var(%rip)

void *func (void *x) {
	uint32_t y = __sync_val_compare_and_swap(&var, 0, 1);
	printf("y = %u\n", y);
	return x;
}

// 原子操作的比喻
// int compare_and_swap (int* reg, int oldval, int newval)
// {
// 	int old_reg_val = *reg;
// 	if (old_reg_val == oldval)
// 		*reg = newval;
// 	return old_reg_val;
// }
//
// bool __sync_bool_compare_and_swap (type *ptr, type oldval type newval, ...)
// type __sync_val_compare_and_swap (type *ptr, type oldval type newval, ...)
// These builtins perform an atomic compare and swap. That is, if the current value of *ptr is oldval, then write newval into *ptr.
// The “bool” version returns true if the comparison is successful and newval was written. The “val” version returns the contents of *ptr before the operation. 
//


int main (void) {
	pthread_t t;
	pthread_create (&t, NULL, func, NULL);
	pthread_join (t, NULL);
	printf ("var = %"PRIu32"\n", var);
	return 0;
}
