#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>

#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)


int main(void)
{
	printf("sizeof(sigset_t)):%d, sizeof(int): %d\n", sizeof(sigset_t), sizeof(int));
	return 0;
}
