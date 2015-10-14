#include <stdio.h>  
#include <sys/user.h>   /* For constants   ORIG_EAX etc */  
#include <sys/reg.h>   /* For constants   ORIG_EAX etc */  
#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/syscall.h>   /* For SYS_write etc */


// struct user_regs_struct  // user.h
// {
//   long int ebx;
//   long int ecx;
//   long int edx;
//   long int esi;
//   long int edi;
//   long int ebp;
//   long int eax;
//   long int xds;
//   long int xes;
//   long int xfs;
//   long int xgs;
//   long int orig_eax;
//   long int eip;
//   long int xcs;
//   long int eflags;
//   long int esp;
//   long int xss;
// };



// PTRACE_GETREGS, PTRACE_GETFPREGS
//        Copy the tracee's general-purpose or floating-point registers, respectively, to the address data in the tracer.  See <sys/user.h> for information on  the  format  of  this
//        data.   (addr  is ignored.)  Note that SPARC systems have the meaning of data and addr reversed; that is, data is ignored and the registers are copied to the address addr.
//        PTRACE_GETREGS and PTRACE_GETFPREGS are not present on all architectures.
#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)
int main()
{   pid_t child;
	long orig_eax, eax;
	int status;
	int insyscall = 0;
	struct user_regs_struct regs;
	child = fork();
	if(child == 0) {
		ptrace(PTRACE_TRACEME, 0, NULL, NULL);
		if (execl("/bin/ls", "ls", NULL) == -1)
			err_sys("execl");

	}
	else {
		while(1) {
			wait(&status);
			if(WIFEXITED(status))
				break;
			// ORIG_EAX 获取当前调用的系统调用号
			orig_eax = ptrace(PTRACE_PEEKUSER, child, 4 * ORIG_EAX, NULL);
			//printf("orig_eax:%ld, SYS_write:%d\n", orig_eax, SYS_write);  // 这里输入太多，

			if(orig_eax == SYS_write) {
				printf("orig_eax:%ld, SYS_write:%d\n", orig_eax, SYS_write);
				if(insyscall == 0) {
					/* Syscall entry */
					insyscall = 1;
					ptrace(PTRACE_GETREGS, child, NULL, &regs);
					printf("Write called with ebx:%lu, ecx:%lx, edx:%lu\n", regs.ebx, regs.ecx, regs.edx);
				}
				else { /* Syscall exit */
					eax = ptrace(PTRACE_PEEKUSER, child, 4 * EAX, NULL);
					printf("Write returned with %ld\n", eax);
					insyscall = 0;
				}
			}
			// 系统调用 进入 和退出时
			ptrace(PTRACE_SYSCALL, child, NULL, NULL);
		}
	}
	return 0;
}
