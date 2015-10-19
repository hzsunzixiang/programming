/* Compile: gcc -pthread -m32 -ansi x.c */
#include <stdio.h>
#include <inttypes.h>
#include <pthread.h>
#include <stdbool.h>

static volatile uint32_t var = 0;

//	movl	$0, %eax
//	movl	$1, %edx
//	lock cmpxchgl	%edx, var(%rip)

void *func (void *x) {
	bool y = __sync_bool_compare_and_swap(&var, 0, 1);
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




//  这个操作用C语言来描述就是下面这个样子：（代码来自Wikipedia的Compare And Swap词条）意思就是说，看一看内存*reg里的值是不是oldval，如果是的话，则对其赋值newval。
//  	
//  int compare_and_swap (int* reg, int oldval, int newval)
//  {
//    int old_reg_val = *reg;
//    if (old_reg_val == oldval)
//       *reg = newval;
//    return old_reg_val;
//  }
//  
//  这个操作可以变种为返回bool值的形式（返回 bool值的好处在于，可以调用者知道有没有更新成功）：
//  	
//  bool compare_and_swap (int *accum, int *dest, int newval)
//  {
//    if ( *accum == *dest ) {
//        *dest = newval;
//        return true;
//    }
//    return false;
//  }
