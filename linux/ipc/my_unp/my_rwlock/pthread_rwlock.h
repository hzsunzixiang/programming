/* include rwlock.h */

#include <pthread.h>
#ifndef	__pthread1_rwlock_h
#define	__pthread1_rwlock_h

typedef struct {
  pthread_mutex_t	rw_mutex;		/* basic lock on this struct */
  pthread_cond_t	rw_condreaders;	/* for reader threads waiting */
  pthread_cond_t	rw_condwriters;	/* for writer threads waiting */
  int				rw_magic;		/* for error checking */
  int				rw_nwaitreaders;/* the number waiting */
  int				rw_nwaitwriters;/* the number waiting */
  int				rw_refcount;
	/* -1 if writer has the lock, else # readers holding the lock */
} pthread1_rwlock_t;

#define	RW_MAGIC	0x19283746

	/* following must have same order as elements in struct above */
#define	PTHREAD1_RWLOCK_INITIALIZER	{ PTHREAD_MUTEX_INITIALIZER, \
			PTHREAD_COND_INITIALIZER, PTHREAD_COND_INITIALIZER, \
			RW_MAGIC, 0, 0, 0 }




#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

typedef	int		pthread1_rwlockattr_t;	/* dummy; not supported */

	/* function prototypes */
int		pthread1_rwlock_destroy(pthread1_rwlock_t *);
int		pthread1_rwlock_init(pthread1_rwlock_t *, pthread1_rwlockattr_t *);
int		pthread1_rwlock_rdlock(pthread1_rwlock_t *);
int		pthread1_rwlock_tryrdlock(pthread1_rwlock_t *);
int		pthread1_rwlock_trywrlock(pthread1_rwlock_t *);
int		pthread1_rwlock_unlock(pthread1_rwlock_t *);
int		pthread1_rwlock_wrlock(pthread1_rwlock_t *);
/* $$.bp$$ */
	/* and our wrapper functions */
void	Pthread_rwlock_destroy(pthread1_rwlock_t *);
void	Pthread_rwlock_init(pthread1_rwlock_t *, pthread1_rwlockattr_t *);
void	Pthread_rwlock_rdlock(pthread1_rwlock_t *);
int		Pthread_rwlock_tryrdlock(pthread1_rwlock_t *);
int		Pthread_rwlock_trywrlock(pthread1_rwlock_t *);
void	Pthread_rwlock_unlock(pthread1_rwlock_t *);
void	Pthread_rwlock_wrlock(pthread1_rwlock_t *);

/* end rwlockh */
#endif    //	__pthread1_rwlock_h
