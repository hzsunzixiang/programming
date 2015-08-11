/* include wrlock */

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

static void rwlock_cancelwrwait(void *arg)
{
	pthread1_rwlock_t *rw;

	rw = arg;
	rw->rw_nwaitwriters--;
	pthread_mutex_unlock(&rw->rw_mutex);
}
int
pthread1_rwlock_wrlock(pthread1_rwlock_t *rw)
{
	int		result;

	if (rw->rw_magic != RW_MAGIC)
		return(EINVAL);

	if ( (result = pthread_mutex_lock(&rw->rw_mutex)) != 0)
		return(result);

	while (rw->rw_refcount != 0) {
		rw->rw_nwaitwriters++;
		pthread_cleanup_push(rwlock_cancelwrwait, (void *)rw);
		result = pthread_cond_wait(&rw->rw_condwriters, &rw->rw_mutex);
		pthread_cleanup_pop(0);
		rw->rw_nwaitwriters--;
		if (result != 0)
			break;
	}
	if (result == 0)
		rw->rw_refcount = -1;

	pthread_mutex_unlock(&rw->rw_mutex);
	return(result);
}
/* end wrlock */

void
Pthread_rwlock_wrlock(pthread1_rwlock_t *rw)
{
	int		n;

	if ( (n = pthread1_rwlock_wrlock(rw)) == 0)
		return;
	errno = n;
	err_sys("pthread_rwlock_wrlock error");
}
