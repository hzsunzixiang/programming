#include <stdio.h>  
#include <sys/user.h>   /* For constants   ORIG_EAX etc */  
#include <sys/reg.h>   /* For constants   ORIG_EAX etc */  
#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <sys/syscall.h>   /* For SYS_write etc */



int main()
{ 
	pid_t child;
	long orig_eax, eax;
	long params[3];
	int status;
	int insyscall = 0;


	child = fork();

	if(child == 0) {
		ptrace(PTRACE_TRACEME, 0, NULL, NULL);
		execl("/bin/ls", "ls", NULL);
	}
	else {

		while(1) {
			// 先检查子进程是否已停止
			wait(&status);
			if(WIFEXITED(status))
				break;
			// #define ORIG_EAX 11  reg.h  user.h
			orig_eax = ptrace(PTRACE_PEEKUSER, child, 4 * ORIG_EAX, NULL);

			//printf("orig_eax:%ld, SYS_write:%d\n", orig_eax, SYS_write);
			// #define SYS_write __NR_write bits/syscall.h
			// 跟踪write系统调用的地址
			if(orig_eax == SYS_write) {   // 匹配，进入或者退出
				printf("orig_eax:%ld, SYS_write:%d\n", orig_eax, SYS_write);
				if(insyscall == 0) {
					/* Syscall entry */
					insyscall = 1;   // 第一次停止的时候是进入
					params[0] = ptrace(PTRACE_PEEKUSER, child, 4 * EBX, NULL);
					params[1] = ptrace(PTRACE_PEEKUSER, child, 4 * ECX, NULL);
					params[2] = ptrace(PTRACE_PEEKUSER, child, 4 * EDX, NULL);
					printf("Write called with %lu, %lx, %lu\n", params[0], params[1], params[2]);
				}
				else { /* Syscall exit */  // 第二次停止的时候是退出
					eax = ptrace(PTRACE_PEEKUSER, child, 4 * EAX, NULL);
					printf("Write returned with %lu\n", eax);
					insyscall = 0;
				}
			}

			// Here we are tracing the write system calls, and ls makes three write system calls. The call to ptrace, with a first argument of PTRACE_SYSCALL, makes the kernel stop the child process whenever a system call entry or exit is made. It's equivalent to doing a PTRACE_CONT and stopping at the next system call entry/exit. 
			// 内核会在子进程进入 系统 和 退出系统调用的时候停止子进程的运行

			// PTRACE_SYSCALL, PTRACE_SINGLESTEP
			// Restart the stopped tracee as for PTRACE_CONT, but arrange for the tracee to be stopped at the next entry to or exit from a system call, or after  execution  of  a  single
			// instruction,  respectively.   (The  tracee  will  also, as usual, be stopped upon receipt of a signal.)  From the tracer's perspective, the tracee will appear to have been
			// stopped by receipt of a SIGTRAP.  So, for PTRACE_SYSCALL, for example, the idea is to inspect the arguments to  the  system  call  at  the  first  stop,  then  do  another
			// PTRACE_SYSCALL and inspect the return value of the system call at the second stop.  The data argument is treated as for PTRACE_CONT.  (addr is ignored.)
			// 在这里停止
			ptrace(PTRACE_SYSCALL, child, NULL, NULL);
		}
	}
	return 0;
}




