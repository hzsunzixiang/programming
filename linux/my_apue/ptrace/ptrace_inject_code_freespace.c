#include <stdio.h>  
#include <sys/user.h>   /* For constants   ORIG_EAX etc */  
#include <sys/reg.h>   /* For constants   ORIG_EAX etc */  
#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <sys/syscall.h>   /* For SYS_write etc */

// 这个实验没有做成功
// http://www.linuxjournal.com/article/6210?page=0,1

#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)
const int long_size = sizeof(long);

void getdata(pid_t child, long addr, char *str, int len);
void putdata(pid_t child, long addr, char *str, int len);
long freespaceaddr(pid_t pid)
{
	FILE *fp;
	char filename[30];
	char line[85];
	long addr = 0;
	long addr1 = 0;
	char str1[20];
	char str2[20];
	char str3[20];
	sprintf(filename, "/proc/%d/maps", pid);
	fp = fopen(filename, "r");
	if(fp == NULL)
		exit(1);
	while(fgets(line, 85, fp) != NULL) {
		sscanf(line, "%lx-%lx %s %s %s", &addr, &addr1, str1, str2, str3);
		if(strcmp(str3, "00:00") == 0)
			break;
	}
	printf("addr:%lx addr1:%lx str1:%s str2:%s str3:%s\n", addr, addr1, str1, str2, str3);
	printf("%lx-%lx %s %s %s\n", addr, addr1, str1, str2, str3);

	fclose(fp);
	return addr;
}

int main(int argc, char *argv[])
{ 
	pid_t traced_process;
	struct user_regs_struct oldregs, regs;
	long ins;
	int len = 41;
	long addr;
	// 这段代码是hello.c 反汇编之后的代码
	//
	//(gdb) x/40bx main+3
	//	0x80483ce <main+3>:     0xeb    0x15    0x5e    0xb8    0x04    0x00    0x00    0x00
	//	0x80483d6 <main+11>:    0xbb    0x02    0x00    0x00    0x00    0x89    0xf1    0xba
	//	0x80483de <main+19>:    0x0c    0x00    0x00    0x00    0xcd    0x80    0xcc    0xe8
	//	0x80483e6 <forward+1>:  0xe6    0xff    0xff    0xff    0x48    0x65    0x6c    0x6c
	//	0x80483ee <forward+9>:  0x6f    0x20    0x57    0x6f    0x72    0x6c    0x64    0x0a
	//	(gdb) quit

	char insertcode[] =
		"\xeb\x15\x5e\xb8\x04\x00"
		"\x00\x00\xbb\x02\x00\x00\x00\x89\xf1\xba"
		"\x0c\x00\x00\x00\xcd\x80\xcc\xe8\xe6\xff"
		"\xff\xff\x48\x65\x6c\x6c\x6f\x20\x57\x6f"
		"\x72\x6c\x64\x0a\x00";

	char backup[len];
	if(argc != 2) {
		printf("Usage: %s <pid %s to be traced>\n", argv[0], argv[1]);
		exit(1);
	}
	traced_process = atoi(argv[1]);
	ins = ptrace(PTRACE_ATTACH, traced_process, NULL, NULL);
	if (ins == -1)
	{
		err_sys("ptrace PTRACE_ATTACH");
	}
	wait(NULL);
	ins = ptrace(PTRACE_GETREGS, traced_process, NULL, &regs);
	if (ins == -1)
		err_sys("ptrace PTRACE_GETREGS");

	addr = freespaceaddr(traced_process);
	printf("addr:%lx\n", addr);

	getdata(traced_process, addr, backup, len);
	putdata(traced_process, addr, insertcode, len);
	memcpy(&oldregs, &regs, sizeof(regs));
	// 执行的插入指令 放入eip
	regs.eip = addr;

	printf("The will set insertcode\n");
	// 设置 eip寄存器，也就是指令寄存器
	ins = ptrace(PTRACE_SETREGS, traced_process, NULL, &regs);
	if (ins == -1)
		err_sys("ptrace PTRACE_GETREGS");

	printf("PTRACE_CONT---\n");
	ins = ptrace(PTRACE_CONT, traced_process, NULL, NULL);
	if (ins == -1)
		err_sys("ptrace PTRACE_GETREGS");

	wait(NULL);
	printf("The process stopped, Putting back the original instructions\n");
	// 恢复原来的指令寄存器
	putdata(traced_process, addr, backup, len);

	ins = ptrace(PTRACE_SETREGS, traced_process, NULL, &oldregs);
	if (ins == -1)
		err_sys("ptrace PTRACE_GETREGS");

	printf("Letting it continue with original flow\n");

	sleep(100);  // 睡眠一会 可以观察子进程被停止
	ins = ptrace(PTRACE_DETACH, traced_process, NULL, NULL);
	if (ins == -1)
		err_sys("ptrace PTRACE_GETREGS");
	return 0;
}

void getdata(pid_t child, long addr, char *str, int len)
{   
	char *laddr;
	int i, j;
	union u {
		long val;
		char chars[long_size];
	}data;

	i = 0;
	j = len / long_size;
	laddr = str;

	while(i < j) {
		data.val = ptrace(PTRACE_PEEKDATA, child, addr + i * 4, NULL);
		memcpy(laddr, data.chars, long_size);
		++i;
		laddr += long_size;
	}

	j = len % long_size;

	if(j != 0) {
		data.val = ptrace(PTRACE_PEEKDATA, child, addr + i * 4, NULL);
		memcpy(laddr, data.chars, j);
	}

	str[len] = '\0';
}

void putdata(pid_t child, long addr, char *str, int len)
{   
	char *laddr;
	int i, j;
	union u {
		long val;
		char chars[long_size];
	}data;

	i = 0;
	j = len / long_size;
	laddr = str;

	while(i < j) {
		memcpy(data.chars, laddr, long_size);
		ptrace(PTRACE_POKEDATA, child, addr + i * 4, data.val);
		++i;
		laddr += long_size;
	}

	j = len % long_size;

	if(j != 0) {
		memcpy(data.chars, laddr, j);
		ptrace(PTRACE_POKEDATA, child, addr + i * 4, data.val);
	}
}

