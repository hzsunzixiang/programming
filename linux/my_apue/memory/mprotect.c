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

#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

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
	char *p;
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

	buffer = memalign(pagesize, 4 * pagesize);
	if (buffer == NULL)
		handle_error("memalign");

	printf("Start of region:        0x%lx\n", (long) buffer);

	if (mprotect(buffer + pagesize * 2, pagesize,
				PROT_READ) == -1)
		handle_error("mprotect");

	for (p = buffer ; ; )
		*(p++) = 'a';

	printf("Loop completed\n");     /* Should never happen */
	exit(EXIT_SUCCESS);
}
