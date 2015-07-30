#include <signal.h>
#include <stdio.h>

int main()
{
	sigset_t set;
	int sig;

	sigemptyset(&set);
	sigaddset(&set, SIGUSR1);
	sigaddset(&set, SIGUSR2);
	sigprocmask(SIG_BLOCK, &set, NULL);
	sigwait(&set, &sig);
	printf("Got signal %d\n", sig);
	return 0;
}
