#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


//这是深入理解计算机系统的联系题 9.5

#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)


// mmapcopy - uses mmap to copy file fd to stdout
void mmapcopy(int fd, int size)
{
	char *bufp; // pointer to memory mapped VM area
	bufp = mmap(NULL, size, PROT_READ, MAP_PRIVATE, fd, 0);
	if (addr == MAP_FAILED)
		handle_error("mmap");

	write(1, bufp, size);
	if (s == -1)
		handle_error("write");
	return;
}
int main(int argc, char **argv)
{
	struct stat statinfo;
	int fd;
	// check for required command line argument
	if (argc != 2)
	{
		printf("usage: %s <filename>\n", argv[0]);
		exit(0);
	}
	// copy the input arguent to stdout
	fd = open(argv[1], O_RDONLY, 0);
	if (fd == -1)
		handle_error("open");
	if (fstat(fd, &sb) == -1)           /* To obtain file size */
		handle_error("fstat");
	mmapcopy(fd ,statinfo.st_size);
	exit(0);

}
