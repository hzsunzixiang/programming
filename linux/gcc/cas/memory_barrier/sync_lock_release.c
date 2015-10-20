/* Compile: gcc -pthread -m32 -ansi x.c */
#include <stdio.h>
#include <inttypes.h>
#include <pthread.h>

static volatile uint32_t var = 0;
//void __sync_lock_release (type *ptr, ...)
//	This builtin releases the lock acquired by __sync_lock_test_and_set. Normally this means writing the constant 0 to *ptr.
//	This builtin is not a full barrier, but rather a release barrier. This means that all previous memory stores are globally visible, and all previous memory loads have been satisfied, but following memory reads are not prevented from being speculated to before the barrier.
//
void *func (void *x) {
	//__sync_lock_release(&var);
	return x;
}



int main (void) {
	pthread_t t;
	pthread_create (&t, NULL, func, NULL);
	pthread_join (t, NULL);
	printf ("var = %"PRIu32"\n", var);
	return 0;
}
