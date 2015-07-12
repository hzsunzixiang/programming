#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <string.h>
#include <pwd.h>

#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)
#define err_dump(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)


// fstat64(3, {st_mode=S_IFREG|0644, st_size=1105, ...}) = 0
// --- SIGALRM {si_signo=SIGALRM, si_code=SI_KERNEL, si_value={int=13388752, ptr=0xcc4bd0}} ---
// write(1, "in signal handler\n", 18in signal handler
// )     = 18
// futex(0xa78c64, FUTEX_WAIT, 2, NULL^CProcess 15142 detached
//  <detached ...>

static void my_alarm(int signo)
{
	struct passwd *rootptr;

	printf("in signal handler\n");
	if ((rootptr = getpwnam("root")) == NULL)
		err_sys("getpwnam(root) error");
	else
		printf("in signal getpwname success\n");
	alarm(1);

	printf("in signal over\n");
}
//
int main(void)
{
	struct passwd *ptr;
	signal(SIGALRM, my_alarm);
	alarm(1);
	for (; ;)
	{
		if ((ptr = getpwnam("szx")) == NULL)
			err_sys("getpwnam error\n");
		else
			printf("getpwname success\n");
		if (strcmp(ptr->pw_name, "szx") != 0)
			printf("return value corrupted!, pw_name = %s\n", ptr->pw_name);
		else
			printf("strcmp\n");
	}
}

