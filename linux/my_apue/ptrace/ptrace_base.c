#include <sys/ptrace.h>  
#include <stdio.h>  
#include <sys/types.h>  
#include <sys/wait.h>  
#include <unistd.h>  
#include <sys/user.h>   /* For constants   ORIG_EAX etc */  
#include <sys/reg.h>   /* For constants   ORIG_EAX etc */  


int main()  
{  
	pid_t child;  
	long orig_eax;  

	child = fork();  
	if(child == 0) {  
		ptrace(PTRACE_TRACEME, 0, NULL, NULL);  
		printf("after ptrace but, not system call, sleep\n");
		sleep(5); // 在没调用系统之前， wait不返回 
		execl("/bin/ls", "ls", NULL);    // /usr/include/i386-linux-gnu/asm/unistd_32.h #define __NR_execve 11
	}  
	else {  
		wait(NULL);  
		printf("after return from wait\n");
		orig_eax = ptrace(PTRACE_PEEKUSER, child, 4 * ORIG_EAX, NULL);  
		printf("The child made a system call %ld\n ", orig_eax);  
		sleep(10); // 返回之后，子进程继续执行ls
		ptrace(PTRACE_CONT, child, NULL, NULL);  
	}  
	return 0;  
}  
