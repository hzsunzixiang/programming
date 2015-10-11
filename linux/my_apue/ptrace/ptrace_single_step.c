#include <stdio.h>  
#include <sys/user.h>   /* For constants   ORIG_EAX etc */  
#include <sys/reg.h>   /* For constants   ORIG_EAX etc */  
#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <sys/syscall.h>   /* For SYS_write etc */


//root@debian32-1:~/programming/linux/my_apue/ptrace# ./ptrace_single_step
//hello world
//EIP: 804964b Instruction executed: 1b8
//EIP: 8049650 Instruction executed: 80cddb31
//EIP: 8049654 Instruction executed: c3


int main()
{ 
	pid_t child;

	child = fork();
	if(child == 0) {
		ptrace(PTRACE_TRACEME, 0, NULL, NULL);
		execl("./dummy1", "dummy1", NULL);
	}
	else {

		int status;
		struct user_regs_struct regs;
		int start = 0;
		long ins;
		while(1) {
			wait(&status);
			if(WIFEXITED(status))
				break;
			// 先获取所有的寄存器
			ptrace(PTRACE_GETREGS, child, NULL, &regs);
			if(start == 1) {
				// long ptrace(enum __ptrace_request request, pid_t pid, void *addr, void *data);
				// PTRACE_PEEKTEXT, PTRACE_PEEKDATA
				//  Read  a word at the address addr in the tracee's memory, returning the word as the result of the ptrace() call.  Linux does not have separate text and data address spaces,
				//  so these two requests are currently equivalent.  (data is ignored; but see NOTES.)
				// 获取寄存地址中的值
				ins = ptrace(PTRACE_PEEKTEXT, child, regs.eip, NULL);
				printf("EIP: %lx Instruction executed: %lx\n", regs.eip, ins);
			}
			// 只捕捉write指令
			//PTRACE_SYSCALL, PTRACE_SINGLESTEP
			// Restart the stopped tracee as for PTRACE_CONT, but arrange for the tracee to be stopped at the next entry to or exit from a system call, or after  execution  of  a  single
			// instruction,  respectively.   (The  tracee  will  also, as usual, be stopped upon receipt of a signal.)  From the tracer's perspective, the tracee will appear to have been
			// stopped by receipt of a SIGTRAP.  So, for PTRACE_SYSCALL, for example, the idea is to inspect the arguments to  the  system  call  at  the  first  stop,  then  do  another
			// PTRACE_SYSCALL and inspect the return value of the system call at the second stop.  The data argument is treated as for PTRACE_CONT.  (addr is ignored.)
			if(regs.orig_eax == SYS_write) {
				start = 1;
				ptrace(PTRACE_SINGLESTEP, child, NULL, NULL);
				//ptrace(PTRACE_SYSCALL, child, NULL, NULL);
			}
			else
				ptrace(PTRACE_SYSCALL, child, NULL, NULL);
		}
	}
	return 0;
}
