#include <unistd.h>
#include <signal.h>
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/mman.h>



// man sigaction

//  siginfo_t {
//  	int      si_signo;    /* Signal number */
//  	int      si_errno;    /* An errno value */
//  	int      si_code;     /* Signal code */
//  	int      si_trapno;   /* Trap number that caused
//  							 hardware-generated signal
//  							 (unused on most architectures) */
//  	pid_t    si_pid;      /* Sending process ID */
//  	uid_t    si_uid;      /* Real user ID of sending process */
//  	int      si_status;   /* Exit value or signal */
//  	clock_t  si_utime;    /* User time consumed */
//  	clock_t  si_stime;    /* System time consumed */
//  	sigval_t si_value;    /* Signal value */
//  	int      si_int;      /* POSIX.1b signal */
//  	void    *si_ptr;      /* POSIX.1b signal */
//  	int      si_overrun;  /* Timer overrun count; POSIX.1b timers */
//  	int      si_timerid;  /* Timer ID; POSIX.1b timers */
//  	void    *si_addr;     /* Memory location which caused fault 用到了这个 */
//  	long     si_band;     /* Band event (was int in
//  							 glibc 2.3.2 and earlier) */
//  	int      si_fd;       /* File descriptor */
//  	short    si_addr_lsb; /* Least significant bit of address
//  							 (since Linux 2.6.32) */
//  }

//    kernel.randomize_va_space 
//    
//    0 - don't use ASLR
//    1 - randomize base address for mmap'd areas
//    2 - ditto, and also randomize the "brk base address" (I assume that would refer to this? http://www.kernel.org/doc/man-pages/online/pages/man2/brk.2.html)
//    
//    
//    
//    According to an article How Effective is ASLR on Linux Systems?, you can configure ASLR in Linux using the /proc/sys/kernel/randomize_va_space interface.
//    
//        The following values are supported:
//    
//            0 – No randomization. Everything is static.
//            1 – Conservative randomization. Shared libraries, stack, mmap(), VDSO and heap are randomized.
//            2 – Full randomization. In addition to elements listed in the previous point, memory managed through brk() is also randomized.


#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

#define ADDR(address) (void *)(address), (unsigned long)(address)/1024/1024, (unsigned long)(address)/1024/1024/1024

char *buffer;

	static void
handler(int sig, siginfo_t *si, void *unused)
{
	printf("Got SIGSEGV at address: 0x%lx\n",
			(long) si->si_addr);
	exit(EXIT_FAILURE);
}

	int
main(int argc, char *argv[])
{
	//char *p;
	int pagesize;
	struct sigaction sa;

	sa.sa_flags = SA_SIGINFO;
	sigemptyset(&sa.sa_mask);
	sa.sa_sigaction = handler;
	if (sigaction(SIGSEGV, &sa, NULL) == -1)
		handle_error("sigaction");

	pagesize = sysconf(_SC_PAGE_SIZE);
	if (pagesize == -1)
		handle_error("sysconf");

	/* Allocate a buffer aligned on a page boundary;
	   initial protection is PROT_READ | PROT_WRITE */

	// 0xc0000000  是内核空间分界线 
	// 必须设置内核参数，不然程序无法运行
	// ################
	//  sysctl kernel.randomize_va_space=0

	int si = 100;
	printf("the address of si 0x%X\n", (unsigned )&si);
	//int *iptr = (int*) (0xBFFFE5EC);
	int *iptr = (int*) (0xc0000000 - 4); // success
	//int *iptr = (int*) (0xc0000000); // failure 
	//int *iptr = (int*) (0xc0000000 - 2); // failure 
	//int *iptr = (int*) (0xc0000000 - 8); // success
	printf("%p(%luM, %luG)\n", ADDR(iptr));

	*iptr = 700;
	printf("the value of iptr %d\n", *iptr);


	int *mi = malloc(sizeof(int));
	printf("malloc %p(%luM, %luG)\n", ADDR(mi));

	// 低地址空间，
	//int *lptr = (int*) (0x08048000 + 4); // failure 
	// int *lptr = (int*) (0x08055000); // success 
	int *lptr = (int*) (0x08056000 + 8); // succesf
	*lptr = 800;
	printf("the value of lptr %d\n", *lptr);
	printf("%p(%luM, %luG)\n", ADDR(lptr));



	exit(EXIT_SUCCESS);
}
