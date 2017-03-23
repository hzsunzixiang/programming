#include <stdio.h>
unsigned long long sum(int n)
{
	unsigned long long  summary = 0;
	for (int i = 0; i <= n; i++)
	{
		summary += i;
	}
	return summary;
}

int main()
{
	//unsigned long long x = sum(10000);
	//printf("i:%d --- %lld\n", 100000, x);
	for (int i = 1; i<= 100000; i++)
	{
		unsigned long long x = sum(i);
		//printf("i:%d --- %lld\n", i, x);
	}
	return 0;
}

// stephensun@debian-32:~/programming/c/gdb_advance/recursion/performance_recurse$ time strace -c ./sum_iterater
// % time     seconds  usecs/call     calls    errors syscall
// ------ ----------- ----------- --------- --------- ----------------
//   0.00    0.000000           0         1           read
//   0.00    0.000000           0         2           open
//   0.00    0.000000           0         2           close
//   0.00    0.000000           0         1           execve
//   0.00    0.000000           0         3         3 access
//   0.00    0.000000           0         1           brk
//   0.00    0.000000           0         1           munmap
//   0.00    0.000000           0         2           mprotect
//   0.00    0.000000           0         6           mmap2
//   0.00    0.000000           0         2           fstat64
//   0.00    0.000000           0         1           set_thread_area
// ------ ----------- ----------- --------- --------- ----------------
// 100.00    0.000000                    22         3 total
// 
// real    0m15.268s
// user    0m15.236s
// sys     0m0.012s
// stephensun@debian-32:~/programming/c/gdb_advance/recursion/performance_recurse$ time strace -c ./sum_recursive
// % time     seconds  usecs/call     calls    errors syscall
// ------ ----------- ----------- --------- --------- ----------------
//   0.00    0.000000           0         1           read
//   0.00    0.000000           0         2           open
//   0.00    0.000000           0         2           close
//   0.00    0.000000           0         1           execve
//   0.00    0.000000           0         3         3 access
//   0.00    0.000000           0         1           brk
//   0.00    0.000000           0         1           munmap
//   0.00    0.000000           0         2           mprotect
//   0.00    0.000000           0         6           mmap2
//   0.00    0.000000           0         2           fstat64
//   0.00    0.000000           0         1           set_thread_area
// ------ ----------- ----------- --------- --------- ----------------
// 100.00    0.000000                    22         3 total
// 
// real    0m45.458s
// user    0m45.380s
// sys     0m0.048s

