/* include destroy */
#include	"pthread_rwlock.h"
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
#include	<pthread.h>

int
pthread1_rwlock_destroy(pthread1_rwlock_t *rw)
{
	if (rw->rw_magic != RW_MAGIC)
		return(EINVAL);
	if (rw->rw_refcount != 0 ||
		rw->rw_nwaitreaders != 0 || rw->rw_nwaitwriters != 0)
		return(EBUSY);

	pthread_mutex_destroy(&rw->rw_mutex);
	pthread_cond_destroy(&rw->rw_condreaders);
	pthread_cond_destroy(&rw->rw_condwriters);
	rw->rw_magic = 0;

	return(0);
}
/* end destroy */

void
Pthread_rwlock_destroy(pthread1_rwlock_t *rw)
{
	int		n;

	if ( (n = pthread1_rwlock_destroy(rw)) == 0)
		return;
	errno = n;
	err_sys("pthread_rwlock_destroy error");
}
