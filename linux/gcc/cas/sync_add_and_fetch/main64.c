/* Compile: gcc -pthread -m32 -ansi x.c */
#include <stdio.h>
#include <inttypes.h>
#include <pthread.h>

static volatile uint64_t var = 1;

void *func (void *x) {
	uint64_t ret = __sync_add_and_fetch (&var, 1999);
	printf ("ret = %"PRIu64"\n", ret);
	return x;
}
// type __sync_add_and_fetch (type *ptr, type value, ...)
// type __sync_sub_and_fetch (type *ptr, type value, ...)
// type __sync_or_and_fetch (type *ptr, type value, ...)
// type __sync_and_and_fetch (type *ptr, type value, ...)
// type __sync_xor_and_fetch (type *ptr, type value, ...)
// type __sync_nand_and_fetch (type *ptr, type value, ...)
// These builtins perform the operation suggested by the name, and return the new value. That is,
//           { *ptr op= value; return *ptr; }
//           { *ptr = ~*ptr & value; return *ptr; }   // nand
//                          

int main (void) {
	pthread_t t;
	pthread_create (&t, NULL, func, NULL);
	pthread_join (t, NULL);
	printf ("var = %"PRIu64"\n", var);
	return 0;
}
