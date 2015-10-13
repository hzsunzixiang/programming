#include <stdio.h>  
#include <sys/user.h>   /* For constants   ORIG_EAX etc */  
#include <sys/reg.h>   /* For constants   ORIG_EAX etc */  
#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <errno.h>
#include <stdlib.h>
#include <sys/syscall.h>   /* For SYS_write etc */

#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)
int main(int argc, char *argv[])
{
	pid_t traced_process;
	struct user_regs_struct regs;
	long ins;

	if(argc != 2) {
		printf("Usage: %s <pid %s to be traced>\n", argv[0], argv[1]);
		exit(1);
	}

	traced_process = atoi(argv[1]);

	ins = ptrace(PTRACE_ATTACH, traced_process, NULL, NULL);
	if (ins == -1)
	{
		err_sys("ptrace PTRACE_ATTACH");
	}

	wait(NULL);
	ins = ptrace(PTRACE_GETREGS, traced_process, NULL, &regs);
	if (ins == -1)
	{
		err_sys("ptrace PTRACE_GETREGS");
	}
	ins = ptrace(PTRACE_PEEKTEXT, traced_process, regs.eip, NULL);
	if (ins == -1)
	{
		err_sys("ptrace PTRACE_PEEKTEXT");
	}
	printf("EIP: %lx Instruction executed: %lx\n", regs.eip, ins);
	ins = ptrace(PTRACE_DETACH, traced_process, NULL, NULL);
	if (ins == -1)
	{
		err_sys("ptrace PTRACE_DETACH");
	}

	return 0;
}
