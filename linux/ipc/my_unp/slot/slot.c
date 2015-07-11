# include	<sys/ipc.h>		/* System V IPC */
# include	<sys/msg.h>		/* System V message queues */
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

//#define	SVMSG_MODE	(MSG_R | MSG_W | MSG_R>>3 | MSG_R>>6)
int
main(int argc, char **argv)
{
	int		i, msqid;
    struct msqid_ds info;

    for (i = 0; i < 10; i++) {
        //msqid = msgget(IPC_PRIVATE, SVMSG_MODE | IPC_CREAT);
        msqid = msgget(IPC_PRIVATE, IPC_CREAT);
        if(msqid < 0)
        {
            perror("msgget");
        }
        msgctl(msqid, IPC_STAT, &info);
        //printf("msqid = %d, seq = %lu\n", msqid, info.msg_perm.seq);
        printf("msqid = %d\n", msqid );

        msgctl(msqid, IPC_RMID, NULL);
    }
    exit(0);
}
