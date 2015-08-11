/* include tryrdlock */
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
pthread1_rwlock_tryrdlock(pthread1_rwlock_t *rw)
{
	int		result;

	if (rw->rw_magic != RW_MAGIC)
		return(EINVAL);

	if ( (result = pthread_mutex_lock(&rw->rw_mutex)) != 0)
		return(result);

	if (rw->rw_refcount < 0 || rw->rw_nwaitwriters > 0)
		result = EBUSY;			/* held by a writer or waiting writers */
	else
		rw->rw_refcount++;		/* increment count of reader locks */

	pthread_mutex_unlock(&rw->rw_mutex);
	return(result);
}
/* end tryrdlock */

int
Pthread_rwlock_tryrdlock(pthread1_rwlock_t *rw)
{
	int		n;

	if ( (n = pthread1_rwlock_tryrdlock(rw)) != 0) {
		errno = n;
		err_sys("pthread_rwlock_tryrdlock error");
	}
	return(n);
}
