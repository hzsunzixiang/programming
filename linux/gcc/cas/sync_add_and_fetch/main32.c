/* Compile: gcc -pthread -m32 -ansi x.c */
#include <stdio.h>
#include <inttypes.h>
#include <pthread.h>

static volatile uint32_t var = 0;

void *func (void *x) {
	__sync_add_and_fetch (&var, 1);
	return x;
}

int main (void) {
	pthread_t t;
	pthread_create (&t, NULL, func, NULL);
	pthread_join (t, NULL);
	printf ("var = %"PRIu32"\n", var);
	return 0;
}
