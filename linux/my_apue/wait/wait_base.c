//EXAMPLE
//     The following program demonstrates the use of fork(2) and waitpid().  The program creates a child process.  If no command-line argument is supplied to the program, then the child
//     suspends its execution using pause(2), to allow the user to send signals to the child.  Otherwise, if a command-line argument is supplied, then the child exits immediately, using
//     the integer supplied on the command line as the exit status.  The parent process executes a loop that monitors the child using waitpid(), and uses the W*() macros described above
//     to analyze the wait status value.
//
//     The following shell session demonstrates the use of the program:
//
//         $ ./a.out &
//         Child PID is 32360
//         [1] 32359
//         $ kill -STOP 32360
//         stopped by signal 19
//         $ kill -CONT 32360
//         continued
//         $ kill -TERM 32360
//         killed by signal 15
//         [1]+  Done                    ./a.out
//         $
//
// Program source
//
// root@debian32-1:~/programming/linux/my_apue/wait# strace -e process ./wait_base
// execve("./wait_base", ["./wait_base"], [/* 21 vars */]) = 0
// clone(child_stack=0, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0xb75bc9a8) = 20743
// waitpid(20743, Child PID is 20743


// root@debian32-1:~/programming/linux/my_apue/wait# ltrace ./wait_base
// __libc_start_main(0x80485ab, 1, 0xbf92a764, 0x8048760 <unfinished ...>
// fork()                                                                                                               = 21662
// waitpid(21662, 0xbf92a680, 10Child PID is 21662


#include <sys/wait.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

	int
main(int argc, char *argv[])
{
	pid_t cpid, w;
	int status;

	cpid = fork();
	if (cpid == -1) {
		perror("fork");
		exit(EXIT_FAILURE);
	}

	if (cpid == 0) {            /* Code executed by child */
		printf("Child PID is %ld\n", (long) getpid());
		if (argc == 1)
			pause();                    /* Wait for signals */
		_exit(atoi(argv[1]));

	} else {                    /* Code executed by parent */
		do {
			w = waitpid(cpid, &status, WUNTRACED | WCONTINUED);
			if (w == -1) {
				perror("waitpid");
				exit(EXIT_FAILURE);
			}

			if (WIFEXITED(status)) {
				printf("exited, status=%d\n", WEXITSTATUS(status));
			} else if (WIFSIGNALED(status)) {
				printf("killed by signal %d\n", WTERMSIG(status));
			} else if (WIFSTOPPED(status)) {
				printf("stopped by signal %d\n", WSTOPSIG(status));
			} else if (WIFCONTINUED(status)) {
				printf("continued\n");
			}
		} while (!WIFEXITED(status) && !WIFSIGNALED(status));
		exit(EXIT_SUCCESS);
	}
}
