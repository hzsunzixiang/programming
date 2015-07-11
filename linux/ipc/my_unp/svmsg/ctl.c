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
    struct msqid_ds info;
    struct msgbuf buf;
    msqid = msgget(IPC_PRIVATE, 0666 | IPC_CREAT);
    if (msqid < 0)
    {
        perror("msgget");
        return -1;
    }

    buf.mtype = 1;
    buf.mtext[0] =  1;
    int ret = msgsnd(msqid, &buf, 1, 0);
    if (ret < 0)
    {
        perror("msgsnd");
        return -1;
    }

    ret = msgctl(msqid, IPC_STAT, &info);
    if (ret < 0)
    {
        perror("msgctl");
        return -1;
    }
    printf("read-write: %03o, cbytes = %lu, qnum = %lu, qbyte = %lu\n",
            info.msg_perm.mode & 0777, info.msg_cbytes,
            info.msg_qnum,  info.msg_qbytes);
    system("ipcs -q");
    ret = msgctl(msqid, IPC_RMID, NULL);
    if (ret < 0)
    {
        perror("msgctl");
        return -1;
    }
    exit(0);
}
