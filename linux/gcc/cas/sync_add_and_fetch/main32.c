/* Compile: gcc -pthread -m32 -ansi x.c */
#include <stdio.h>
#include <inttypes.h>
#include <pthread.h>

static volatile uint32_t var = 1;

// 操作之后返回新值
// 相加之后返回新值
void *func (void *x) {

	//  uint32_t addVal = 19999;
	//  uint32_t ret = __sync_add_and_fetch (&var, addVal);

	// 上面的汇编为
	// movl	$19999, -4(%rbp)
	// .loc 1 13 0
	// movl	-4(%rbp), %eax
	// lock xaddl	%eax, var(%rip)
	// movl	%eax, %edx
	// movl	-4(%rbp), %eax
	// addl	%edx, %eax
	// movl	%eax, -8(%rbp)

	uint32_t ret = __sync_add_and_fetch (&var, 19999);

	// 上面的汇编为
	// movl	$19999, %eax
	// lock xaddl	%eax, var(%rip)
	// addl	$19999, %eax
	// movl	%eax, -4(%rbp)

	printf ("ret = %"PRIu32"\n", ret);
	return x;
}
//type __sync_add_and_fetch (type *ptr, type value, ...)
//type __sync_sub_and_fetch (type *ptr, type value, ...)
//type __sync_or_and_fetch (type *ptr, type value, ...)
//type __sync_and_and_fetch (type *ptr, type value, ...)
//type __sync_xor_and_fetch (type *ptr, type value, ...)
//type __sync_nand_and_fetch (type *ptr, type value, ...)
//These builtins perform the operation suggested by the name, and return the new value. That is,
//          { *ptr op= value; return *ptr; }
//          { *ptr = ~*ptr & value; return *ptr; }   // nand
//                         



int main (void) {
	pthread_t t;
	pthread_create (&t, NULL, func, NULL);
	pthread_join (t, NULL);
	printf ("var = %"PRIu32"\n", var);
	return 0;
}
