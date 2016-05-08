#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>

int main()
{
	FILE* fp = NULL;
	const char *filename_1 = "test_fprintf.log";
	const char *filename_2 = "test_write.log";
	int fd;

	fp = fopen(filename_1, "wb");
	if(fp == NULL)
	{
		printf("open %s failed, %s\n", filename_1, strerror(errno));
		return -1;
	}
	//setbuf(fp, NULL);
	//setvbuf(fp, NULL, _IONBF, 0);
	//setvbuf(fp, NULL, _IOLBF, 0);
	int flag =  O_WRONLY|O_EXCL;
	if(access(filename_2, F_OK | R_OK) < 0)
		flag = flag | O_CREAT;

	fd = open(filename_2, flag, 0666);
	if(fd < 0)
	{
		printf("open %s failed, %s\n", filename_2, strerror(errno));
		return -1;
	}
	while(1)
	{
		// 缓冲区大小为4k  默认为全缓冲 除非指定不缓冲  或者 行缓冲 才会输出
		// 用是trace 查看的时候 确实是到4k的时候才会输出
		// 满足4096 字节的时候才会输出
		// write(4, "test fprintf.\n-------test fprint"..., 4096) = 4096

		// 如果输出到标准输出 则是 行缓冲 
	    // 标准错误时不缓冲的
		 
		// fprintf(fp, "test fprintf.\n");
		// fprintf(fp, "-------test fprintf.\n");
		// fprintf(fp, "=======test fprintf.\n");

		// 行缓冲不能及时输出
		// fprintf(stdout, "test fprintf.");
		// fprintf(stdout, "-------test fprintf.");
		// fprintf(stdout, "=======test fprintf.");

		// 有换行符 可以及时输出
		// fprintf(stdout, "test fprintf.\n");
		// fprintf(stdout, "-------test fprintf.\n");
		// fprintf(stdout, "=======test fprintf.\n");

		// 标准错误 可以及时输出
		fprintf(stderr, "test fprintf.");
		fprintf(stderr, "-------test fprintf.");
		fprintf(stderr, "=======test fprintf.");
		//fflush(fp);
		write(fd, "test write.\n", sizeof("test write.\n"));
		write(fd, "--------test write .\n", sizeof("--------test open.\n"));
		write(fd, "--------test write .\n", sizeof("--------test open.\n"));
		sleep(1);
	}

	return 0;
}
