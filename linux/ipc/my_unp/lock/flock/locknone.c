#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>        /* For mode constants */
#include <fcntl.h>           /* For O_* constants */
#include <signal.h>

#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)
#define SEQFILE "seqno"
#define MAXLINE 100

void my_lock(int), my_unlock(int);


void my_lock(int fd)
{
	return;
}
void my_unlock(int fd)
{
	return;
}
int main(int argc, char *argv[])
{

	pid_t pid;
	pid = getpid();
	int fd = open(SEQFILE, O_RDWR, 0666);
	if (fd < 0)
	{
		handle_error("open");
	}
	long i, seqno;
	for (i = 0; i < 200; i++)
	{
		my_lock(fd);


		lseek(fd, 0L, SEEK_SET); // rewind before read
		char  line[MAXLINE + 1];
		ssize_t n = read(fd, line, MAXLINE);
		if (n < 0)
		{
			handle_error("read");
		}
		line[n] = '\0'; // null terminate for sscanf
		n = sscanf(line, "%ld\n", &seqno);
		printf("%s:pid = %ld, seq# = %ld\n", argv[0], (long) pid, seqno);
		seqno++; // increment sequrence number
		snprintf(line, sizeof(line), "%ld\n", seqno);
		lseek(fd, 0L, SEEK_SET); // rewind before write 
		n = write(fd, line, strlen(line));
		if (n < 0)
		{
			handle_error("read");
		}
		my_unlock(fd);
	}


	exit(EXIT_SUCCESS);
}











































