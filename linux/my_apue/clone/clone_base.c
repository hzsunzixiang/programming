//EXAMPLE
//  The following program demonstrates the use of clone() to create a child process that executes in a separate UTS namespace.  The child changes the hostname in its  UTS  namespace.
//  Both  parent and child then display the system hostname, making it possible to see that the hostname differs in the UTS namespaces of the parent and child.  For an example of the
//  use of this program, see setns(2).
//
// Program source



//  root@debian32-1:~/programming/linux/my_apue/clone# strace -e process ./clone_base 9999
//  execve("./clone_base", ["./clone_base", "9999"], [/* 21 vars */]) = 0
//  clone(child_stack=0xb761efe4, flags=CLONE_NEWUTS|SIGCHLD) = 20830
//  clone() returned 20830
//  uts.nodename in child:  9999
//  uts.nodename in parent: debian32-1
//  waitpid(20830,

#define _GNU_SOURCE
#include <sys/wait.h>
#include <sys/utsname.h>
#include <sched.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \
} while (0)

	static int              /* Start function for cloned child */
childFunc(void *arg)
{
	struct utsname uts;

	/* Change hostname in UTS namespace of child */

	if (sethostname(arg, strlen(arg)) == -1)
		errExit("sethostname");

	/* Retrieve and display hostname */

	if (uname(&uts) == -1)
		errExit("uname");
	printf("uts.nodename in child:  %s\n", uts.nodename);

	/* Keep the namespace open for a while, by sleeping.
	   This allows some experimentation--for example, another
	   process might join the namespace. */

	sleep(200);

	return 0;           /* Child terminates now */
}

#define STACK_SIZE (1024 * 1024)    /* Stack size for cloned child */

	int
main(int argc, char *argv[])
{
	char *stack;                    /* Start of stack buffer */
	char *stackTop;                 /* End of stack buffer */
	pid_t pid;
	struct utsname uts;

	if (argc < 2) {
		fprintf(stderr, "Usage: %s <child-hostname>\n", argv[0]);
		exit(EXIT_SUCCESS);
	}

	/* Allocate stack for child */

	stack = malloc(STACK_SIZE);
	if (stack == NULL)
		errExit("malloc");
	stackTop = stack + STACK_SIZE;  /* Assume stack grows downward */

	/* Create child that has its own UTS namespace;
	   child commences execution in childFunc() */

	pid = clone(childFunc, stackTop, CLONE_NEWUTS | SIGCHLD, argv[1]);
	if (pid == -1)
		errExit("clone");
	printf("clone() returned %ld\n", (long) pid);

	/* Parent falls through to here */

	sleep(1);           /* Give child time to change its hostname */

	/* Display hostname in parent's UTS namespace. This will be
	   different from hostname in child's UTS namespace. */

	if (uname(&uts) == -1)
		errExit("uname");
	printf("uts.nodename in parent: %s\n", uts.nodename);

	if (waitpid(pid, NULL, 0) == -1)    /* Wait for child */
		errExit("waitpid");
	printf("child has terminated\n");

	exit(EXIT_SUCCESS);
}
