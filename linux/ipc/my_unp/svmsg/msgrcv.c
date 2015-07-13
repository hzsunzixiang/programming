#include	<sys/ipc.h>		/* System V IPC */
#include	<sys/msg.h>		/* System V message queues */
#include	<sys/types.h>	/* basic system data types */
#include	<sys/time.h>	/* timeval{} for select() */
#include	<time.h>		/* timespec{} for pselect() */
#include	<errno.h>
#include	<fcntl.h>		/* for nonblocking */
#include	<limits.h>		/* PIPE_BUF */
#include	<signal.h>
#include	<stdio.h>
#include	<stdlib.h>
#include	<string.h>
#include	<sys/stat.h>	/* for S_xxx file mode constants */
#include	<unistd.h>
#include	<sys/wait.h>


#define MAXMSG (8192 + sizeof(long))
/* message buffer for msgsnd and msgrcv calls */
struct msgbuf {
    long mtype;         /* type of message */
    char mtext[1];      /* message text */
};
int main(int argc, char *argv[])
{
    int  c, flag, msqid;
	//size_t len;
	ssize_t len;  // 注意是有符号的
	long type;
	struct msgbuf *ptr;

	type = flag = 0; 
	while ((c = getopt(argc, argv, "nt:")) != -1)
	{
		switch(c)
		{
			case 'n':
				flag |= IPC_NOWAIT;
				break;
			case 't':
				type = atol(optarg);
				break;
		}
	}
	if(optind != argc -1)
	{
		perror("usage: msgrcv [-n] [-t type] <pathname>");
		exit(1);
	}

	int ftok_ret = ftok(argv[optind], 0);
	if(ftok_ret < 0)
	{
		perror("ftok");
		exit(1);
	}
	printf("key: %x\n", ftok_ret);
	msqid = msgget(ftok_ret, 0666);

	if (msqid < 0)
	{
		perror("msgget");
		return -1;
	}
	ptr = malloc(MAXMSG);
	if (ptr == NULL)
	{
		perror("malloc");
		return -1;
	}
    len = msgrcv(msqid, ptr, MAXMSG, type, flag);
    if (len < 0)
    {
        perror("msgrcv");
        return -1;
    }

	printf("read %lu bytes, type = %ld\n", len, ptr->mtype);
    system("ipcs -q");
	exit(0);
}
