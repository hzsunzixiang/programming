//EXAMPLE
//       The example program below demonstrates the use of getcontext(3), makecontext(), and swapcontext().  Running the program produces the following output:
//
//           $ ./a.out
//           main: swapcontext(&uctx_main, &uctx_func2)
//           func2: started
//           func2: swapcontext(&uctx_func2, &uctx_func1)
//           func1: started
//           func1: swapcontext(&uctx_func1, &uctx_func2)
//           func2: returning
//           func1: returning
//           main: exiting
//
//   Program source

#include <ucontext.h>
#include <stdio.h>
#include <stdlib.h>

static ucontext_t uctx_main, uctx_func1, uctx_func2;

#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

	static void
func1(void)
{
	printf("func1: started\n");
	printf("func1: swapcontext(&uctx_func1, &uctx_func2)\n");
	if (swapcontext(&uctx_func1, &uctx_func2) == -1)
		handle_error("swapcontext");
	printf("func1: returning\n");
}

	static void
func2(void)
{
	printf("func2: started\n");
	printf("func2: swapcontext(&uctx_func2, &uctx_func1)\n");
	if (swapcontext(&uctx_func2, &uctx_func1) == -1)
		handle_error("swapcontext");
	printf("func2: returning\n");
}

//           $ ./a.out
//           main: swapcontext(&uctx_main, &uctx_func2)
//           func2: started
//           func2: swapcontext(&uctx_func2, &uctx_func1)    //  此时 再去执行 uctx_func1    swap 驱动
//           func1: started
//           func1: swapcontext(&uctx_func1, &uctx_func2)    // 此时 再去执行 uctx_func2     swap驱动
//           func2: returning                                //  fun2执行完毕 再去执行 uctx_func1   函数结束驱动
//           func1: returning                                // uctx_func1 执行完毕再去执行 uctx_main  函数结束驱动
//           main: exiting
//
	int
main(int argc, char *argv[])
{
	char func1_stack[16384];
	char func2_stack[16384];

	if (getcontext(&uctx_func1) == -1)
		handle_error("getcontext");
	uctx_func1.uc_stack.ss_sp = func1_stack;
	uctx_func1.uc_stack.ss_size = sizeof(func1_stack);
	// 先赋予地址，后面swapcontext的时候会赋值
	uctx_func1.uc_link = &uctx_main; // 如果注释掉这一行，就不会返回到main函数打印  'main: exiting'
	//uctx_func1.uc_link = NULL; // 如果设为NULL，后面程序运行之后不再返回main函数了
	makecontext(&uctx_func1, func1, 0);
//       If  the  context  was  obtained  by a call of makecontext(3), program execution continues by a call to the function func specified as the second argument of that call to makecon
//       text(3).  When the function func returns, we continue with the uc_link member of the structure ucp specified as the first argument of that call to makecontext(3).  When this mem
//       ber is NULL, the thread exits.

//           main: swapcontext(&uctx_main, &uctx_func2)
//           func2: started
//           func2: swapcontext(&uctx_func2, &uctx_func1)
//           func1: started
//           func1: swapcontext(&uctx_func1, &uctx_func2)
//           func2: returning
//           func1: returning
//           main: exiting

	if (getcontext(&uctx_func2) == -1)
		handle_error("getcontext");
	uctx_func2.uc_stack.ss_sp = func2_stack;
	uctx_func2.uc_stack.ss_size = sizeof(func2_stack);
	/* Successor context is f1(), unless argc > 1 */
	uctx_func2.uc_link = (argc > 1) ? NULL : &uctx_func1;
	makecontext(&uctx_func2, func2, 0);

	printf("main: swapcontext(&uctx_main, &uctx_func2)\n");
	// 当前上下文存在uctx_main中，   uctx_func1 调用之后紧接着调用uctx_main ,这个在  uctx_func1.uc_link = &uctx_main; 中设置
	if (swapcontext(&uctx_main, &uctx_func2) == -1) // uctx_main 的初始化在这里，返回的时候从这里开始调用
		handle_error("swapcontext");

	printf("main: exiting\n");
	exit(EXIT_SUCCESS);
}


// 相当于  uctx_func2 -> uctx_func1  -> uctx_main



 
//  (gdb) n
// 53              uctx_func1.uc_stack.ss_sp = func1_stack;
// (gdb) p uctx_func1
// $1 = {uc_flags = 0, uc_link = 0x0, uc_stack = {ss_sp = 0x0, ss_flags = 0, ss_size = 0}, uc_mcontext = {gregs = {140737351875680, 140737351954448, 0, 0, 4195712, 140737488347984, 0, 0,
//       6297216, 140737488347992, 140737488347760, 0, 140737488348008, 0, 0, 140737488314976, 4196144, 0, 0, 0, 0, 0, 0}, fpregs = 0x601828 <uctx_func1+424>, __reserved1 = {0, 0, 0, 0, 0, 0,
//       0, 0}}, uc_sigmask = {__val = {0 <repeats 16 times>}}, __fpregs_mem = {cwd = 895, swd = 65535, ftw = 0, fop = 65535, rip = 4294967295, rdp = 0, mxcsr = 8064, mxcr_mask = 0, _st = {{
//         significand = {0, 0, 0, 0}, exponent = 0, padding = {0, 0, 0}}, {significand = {0, 0, 0, 0}, exponent = 0, padding = {0, 0, 0}}, {significand = {0, 0, 0, 0}, exponent = 0,
//         padding = {0, 0, 0}}, {significand = {0, 0, 0, 0}, exponent = 0, padding = {0, 0, 0}}, {significand = {0, 0, 0, 0}, exponent = 0, padding = {0, 0, 0}}, {significand = {0, 0, 0, 0},
//         exponent = 0, padding = {0, 0, 0}}, {significand = {0, 0, 0, 0}, exponent = 0, padding = {0, 0, 0}}, {significand = {0, 0, 0, 0}, exponent = 0, padding = {0, 0, 0}}}, _xmm = {{
//         element = {0, 0, 0, 0}} <repeats 16 times>}, padding = {0 <repeats 24 times>}}}
// (gdb) n
// 54              uctx_func1.uc_stack.ss_size = sizeof(func1_stack);
// (gdb) p uctx_func1
// $2 = {uc_flags = 0, uc_link = 0x0, uc_stack = {ss_sp = 0x7fffffffa270, ss_flags = 0, ss_size = 0}, uc_mcontext = {gregs = {140737351875680, 140737351954448, 0, 0, 4195712, 140737488347984,
//       0, 0, 6297216, 140737488347992, 140737488347760, 0, 140737488348008, 0, 0, 140737488314976, 4196144, 0, 0, 0, 0, 0, 0}, fpregs = 0x601828 <uctx_func1+424>, __reserved1 = {0, 0, 0, 0,
//       0, 0, 0, 0}}, uc_sigmask = {__val = {0 <repeats 16 times>}}, __fpregs_mem = {cwd = 895, swd = 65535, ftw = 0, fop = 65535, rip = 4294967295, rdp = 0, mxcsr = 8064, mxcr_mask = 0,
//     _st = {{significand = {0, 0, 0, 0}, exponent = 0, padding = {0, 0, 0}}, {significand = {0, 0, 0, 0}, exponent = 0, padding = {0, 0, 0}}, {significand = {0, 0, 0, 0}, exponent = 0,
//         padding = {0, 0, 0}}, {significand = {0, 0, 0, 0}, exponent = 0, padding = {0, 0, 0}}, {significand = {0, 0, 0, 0}, exponent = 0, padding = {0, 0, 0}}, {significand = {0, 0, 0, 0},
//         exponent = 0, padding = {0, 0, 0}}, {significand = {0, 0, 0, 0}, exponent = 0, padding = {0, 0, 0}}, {significand = {0, 0, 0, 0}, exponent = 0, padding = {0, 0, 0}}}, _xmm = {{
//         element = {0, 0, 0, 0}} <repeats 16 times>}, padding = {0 <repeats 24 times>}}}
// 
		
