/* include init */
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
pthread1_rwlock_init(pthread1_rwlock_t *rw, pthread1_rwlockattr_t *attr)
{
	int		result;

	if (attr != NULL)
		return(EINVAL);		/* not supported */

	if ( (result = pthread_mutex_init(&rw->rw_mutex, NULL)) != 0)
		goto err1;
	if ( (result = pthread_cond_init(&rw->rw_condreaders, NULL)) != 0)
		goto err2;
	if ( (result = pthread_cond_init(&rw->rw_condwriters, NULL)) != 0)
		goto err3;
	rw->rw_nwaitreaders = 0;
	rw->rw_nwaitwriters = 0;
	rw->rw_refcount = 0;
	rw->rw_magic = RW_MAGIC;

	return(0);

err3:
	pthread_cond_destroy(&rw->rw_condreaders);
err2:
	pthread_mutex_destroy(&rw->rw_mutex);
err1:
	return(result);			/* an errno value */
}
/* end init */

void
Pthread_rwlock_init(pthread1_rwlock_t *rw, pthread1_rwlockattr_t *attr)
{
	int		n;

	if ( (n = pthread1_rwlock_init(rw, attr)) == 0)
		return;
	errno = n;
	err_sys("pthread_rwlock_init error");
}
