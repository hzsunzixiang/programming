/* Compile: gcc -pthread -m32 -ansi x.c */
#include <stdio.h>
#include <inttypes.h>
#include <pthread.h>

static volatile uint32_t var = 1;

// 操作之后返回新值
// 相加之后返回新值
void *func (void *x) {

	//  uint32_t addVal = 19999;
	//  uint32_t ret = __sync_fetch_and_add(&var, addVal);

	// 上面的汇编为
	// movl	$19999, -4(%rbp)
	// .loc 1 13 0
	// movl	-4(%rbp), %eax
	// lock xaddl	%eax, var(%rip)
	// movl	%eax, -8(%rbp)

	uint32_t ret = __sync_fetch_and_add(&var, 19999);

	// 上面的汇编为
	// movl	$19999, %eax
	// lock xaddl	%eax, var(%rip)
	// movl	%eax, -4(%rbp)

	printf ("ret = %"PRIu32"\n", ret);
	return x;
}
// type __sync_fetch_and_add (type *ptr, type value, ...)
// type __sync_fetch_and_sub (type *ptr, type value, ...)
// type __sync_fetch_and_or (type *ptr, type value, ...)
// type __sync_fetch_and_and (type *ptr, type value, ...)
// type __sync_fetch_and_xor (type *ptr, type value, ...)
// type __sync_fetch_and_nand (type *ptr, type value, ...)
// These builtins perform the operation suggested by the name, and returns the value that had previously been in memory. That is,
//           { tmp = *ptr; *ptr op= value; return tmp; }
//           { tmp = *ptr; *ptr = ~tmp & value; return tmp; }   // nand


int main (void) {
	pthread_t t;
	pthread_create (&t, NULL, func, NULL);
	pthread_join (t, NULL);
	printf ("var = %"PRIu32"\n", var);
	return 0;
}
