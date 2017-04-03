// https://www.ibm.com/developerworks/cn/linux/l-cn-perf1/
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <stdio.h>


//test.c 
void longa() 
{ 
	int i, j; 
	for(i = 0; i < 10000000; i++) 
		j=i; //am I silly or crazy? I feel boring and desperate. 
} 

void foo2() 
{ 
	int i; 
	for(i = 0 ; i < 10; i++) 
		longa(); 
} 

void foo1() 
{ 
	int i; 
	for(i = 0; i< 100; i++) 
		longa(); 
} 

int main(void) 
{ 
	foo1(); 
	foo2(); 
}


//Branch and Loop Reorganization to Prevent Mispredicts
//
//https://software.intel.com/en-us/articles/branch-and-loop-reorganization-to-prevent-mispredicts




//stephensun@debian:~/programming/perf/helloworld$ sudo perf record -e cpu-clock ./long_test
//[ perf record: Woken up 2 times to write data ]
//[ perf record: Captured and wrote 0.275 MB perf.data (~12024 samples) ]
//stephensun@debian:~/programming/perf/helloworld$ perf report
//failed to open perf.data: Permission denied
//stephensun@debian:~/programming/perf/helloworld$ sudo perf report
//stephensun@debian:~/programming/perf/helloworld$ sudo perf report --stdio
//# To display the perf.data header info, please use --header/--header-only options.
//#
//# Samples: 6K of event 'cpu-clock'
//# Event count (approx.): 1736500000
//#
//# Overhead    Command        Shared Object                           Symbol
//# ........  .........  ...................  ...............................
//#
//    99.54%  long_test  long_test            [.] longa()
//     0.33%  long_test  [kernel.kallsyms]    [k] __do_softirq
//     0.03%  long_test  [kernel.kallsyms]    [k] copy_page
//     0.03%  long_test  ld-2.19.so           [.] _dl_lookup_symbol_x
//     0.01%  long_test  [kernel.kallsyms]    [k] _raw_spin_unlock_irqrestore
//     0.01%  long_test  [kernel.kallsyms]    [k] filemap_map_pages
//     0.01%  long_test  [kernel.kallsyms]    [k] run_timer_softirq
//     0.01%  long_test  [kernel.kallsyms]    [k] update_blocked_averages
//     0.01%  long_test  libstdc++.so.6.0.20  [.] 0x00000000000c3b20
//





//stephensun@debian:~/programming/perf/helloworld$ sudo perf record -e cpu-clock -g ./long_test
//
//
//# To display the perf.data header info, please use --header/--header-only options.
//#
//# Samples: 5K of event 'cpu-clock'
//# Event count (approx.): 1382000000
//#
//# Children      Self    Command      Shared Object                           Symbol
//# ........  ........  .........  .................  ...............................
//#
//    99.95%    99.55%  long_test  long_test          [.] longa()
//            |
//            --- longa()
//               |
//               |--87.22%-- foo1()
//               |          main
//               |          __libc_start_main
//               |
//               |--12.76%-- foo2()
//               |          main
//               |          __libc_start_main
//                --0.02%-- [...]
//
//    99.93%     0.00%  long_test  libc-2.19.so       [.] __libc_start_main
//            |
//            --- __libc_start_main
//
//    99.93%     0.00%  long_test  long_test          [.] main
//            |
//            --- main
//                __libc_start_main
//
//    87.17%     0.00%  long_test  long_test          [.] foo1()
//            |
//            --- foo1()
//                main
//                __libc_start_main
//
//    12.75%     0.00%  long_test  long_test          [.] foo2()
//            |
//            --- foo2()
//                main
//                __libc_start_main
//
//     0.33%     0.33%  long_test  [kernel.kallsyms]  [k] __do_softirq
//            |
//            --- __do_softirq
//                longa()
//               |
//               |--94.44%-- foo1()
//               |          main
//               |          __libc_start_main
//               |
//                --5.56%-- foo2()
//                          main
//                          __libc_start_main
//
