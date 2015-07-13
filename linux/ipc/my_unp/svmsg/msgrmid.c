#include	<sys/ipc.h>		/* System V IPC */
#include	<sys/msg.h>		/* System V message queues */
//#include	<linux/msg.h>		/* System V message queues */
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

/* message buffer for msgsnd and msgrcv calls */
struct msgbuf {
    long mtype;         /* type of message */
    char mtext[1];      /* message text */
};

int main(int argc, char *argv[])
{
    int msqid;
	int ret;

	if (argc != 2)
	{
		perror("usage : msgrmid <pathname>");
		exit(1);
	}
	int ftok_ret = ftok(argv[optind], 0);
	if(ftok_ret < 0)
	{
		perror("ftok");
		exit(1);
	}
	printf("key: %x\n", ftok_ret);
	msqid = msgget(ftok_ret, 0);

	if (msqid < 0)
	{
		perror("msgget");
		return -1;
	}
    system("ipcs -q");
    ret = msgctl(msqid, IPC_RMID, NULL);
    if (ret < 0)
    {
        perror("msgctl");
        return -1;
    }
    system("ipcs -q");
    exit(0);
}
