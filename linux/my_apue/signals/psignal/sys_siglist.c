#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>

#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)
#define err_dump(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)


/*one handler for both signals*/
extern __const char *__const sys_siglist[_NSIG];

int main(void)
{
	
	int i = 0;
	//for (i = 1; i < NSIG; i++)
	for (i = 1; i < 31; i++)
	{
		printf("signal = %d, %s\n", i, sys_siglist[i]);
	}
	for (; ;)
		pause();
}


//  signal = 1, Hangup
//  signal = 2, Interrupt
//  signal = 3, Quit
//  signal = 4, Illegal instruction
//  signal = 5, Trace/breakpoint trap
//  signal = 6, Aborted
//  signal = 7, Bus error
//  signal = 8, Floating point exception
//  signal = 9, Killed
//  signal = 10, User defined signal 1
//  signal = 11, Segmentation fault
//  signal = 12, User defined signal 2
//  signal = 13, Broken pipe
//  signal = 14, Alarm clock
//  signal = 15, Terminated
//  signal = 16, Stack fault
//  signal = 17, Child exited
//  signal = 18, Continued
//  signal = 19, Stopped (signal)
//  signal = 20, Stopped
//  signal = 21, Stopped (tty input)
//  signal = 22, Stopped (tty output)
//  signal = 23, Urgent I/O condition
//  signal = 24, CPU time limit exceeded
//  signal = 25, File size limit exceeded
//  signal = 26, Virtual timer expired
//  signal = 27, Profiling timer expired
//  signal = 28, Window changed
//  signal = 29, I/O possible
//  signal = 30, Power failure

