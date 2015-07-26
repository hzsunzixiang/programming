#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<sys/time.h>
#include<fcntl.h>
#include<sys/mman.h>

#define MAX 1000000

#define SUM_SIZE sizeof(int) * MAX

//http://blog.csdn.net/mg0832058/article/details/5890688
int main()
{
	int i = 0;
	int  fd=0;
	struct timeval tv1, tv2;
	int *array = (int *)malloc(SUM_SIZE);

	/*read*/
	gettimeofday( &tv1, NULL );
	fd = open( "mmap_test", O_RDWR );
	// for((i=0;i<1000000;i++));do echo $i >> mmap_test ;done
	if (SUM_SIZE != read(fd, (void *)array, SUM_SIZE))
	{
		printf( "Reading data failed...\n" );
		return -1;
	}
	for (i = 0; i < MAX; ++i)
		++array[i];
	if (SUM_SIZE != write(fd, (void *)array, SUM_SIZE))
	{
		printf("Writing data failed...\n");
		return -1;
	}
	free(array);
	close(fd);
	gettimeofday( &tv2, NULL );
	printf( "Time of read/write: %ld ms\n", tv2.tv_usec - tv1.tv_usec );

	/*mmap*/

	gettimeofday(&tv1, NULL);
	fd = open("/tmp/test1", O_RDWR );
	ftruncate(fd, SUM_SIZE );
	//lseek(fd, SUM_SIZE, SEEK_SET);
	//write(fd, "", 1);
	array = mmap(NULL, SUM_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
	for(i = 0; i < MAX; ++i)
	{
		//printf("index i = %d\n", i);
		++array[i];
	}
	munmap(array, SUM_SIZE );
	msync(array, SUM_SIZE, MS_SYNC);
	close(fd);
	gettimeofday(&tv2, NULL);
	printf( "Time of mmap: %ldms\n", tv2.tv_usec-tv1.tv_usec );

	return 0;
}
