#include	"pthread_rwlock.h"

#include	<sys/types.h>	/* basic system data types */
#include	<sys/time.h>	/* timeval{} for select() */
#include	<time.h>		/* timespec{} for pselect() */
#include	<fcntl.h>		/* for nonblocking */
#include	<limits.h>		/* PIPE_BUF */
#include	<signal.h>
#include	<errno.h>
#include	<stdio.h>
#include	<stdlib.h>
#include	<string.h>
#include	<sys/stat.h>	/* for S_xxx file mode constants */
#include	<unistd.h>
#include	<sys/wait.h>
#include	<pthread.h>

#define	MAXNTHREADS	100

void	*reader(void *), *writer(void *);

int		nloop = 1000, nreaders = 6, nwriters = 4;

struct {
  pthread1_rwlock_t	rwlock;
  pthread_mutex_t	rcountlock;
  int				nreaders;
  int				nwriters;
} shared = { PTHREAD1_RWLOCK_INITIALIZER, PTHREAD_MUTEX_INITIALIZER };

int
main(int argc, char **argv)
{
	int		c, i;
	pthread_t	tid_readers[MAXNTHREADS], tid_writers[MAXNTHREADS];

	while ( (c = getopt(argc, argv, "n:r:w:")) != -1) {
		switch (c) {
		case 'n':
			nloop = atoi(optarg);
			break;

		case 'r':
			nreaders = atoi(optarg);
			break;

		case 'w':
			nwriters = atoi(optarg);
			break;
		}
	}
	if (optind != argc)
	{
		fprintf(stderr, "usage: test1 [-n #loops ] [ -r #readers ] [ -w #writers ]");
		exit(EXIT_FAILURE);
	}
		/* 4create all the reader and writer threads */
	//Set_concurrency(nreaders + nwriters);
	for (i = 0; i < nreaders; i++)
		pthread_create(&tid_readers[i], NULL, reader, NULL);
	for (i = 0; i < nwriters; i++)
		pthread_create(&tid_writers[i], NULL, writer, NULL);

		/* wait for all the threads to complete */
	for (i = 0; i < nreaders; i++)
		pthread_join(tid_readers[i], NULL);
	for (i = 0; i < nwriters; i++)
		pthread_join(tid_writers[i], NULL);

	exit(0);
}

void *
reader(void *arg)
{
	int		i;

	for (i = 0; i < nloop; i++) {
		Pthread_rwlock_rdlock(&shared.rwlock);

		pthread_mutex_lock(&shared.rcountlock);
		shared.nreaders++;	/* shared by all readers; must protect */
		pthread_mutex_unlock(&shared.rcountlock);

		if (shared.nwriters > 0)
		{
			fprintf(stderr, "reader: %d writers found", shared.nwriters);
			exit(EXIT_FAILURE);
		}


		pthread_mutex_lock(&shared.rcountlock);
		shared.nreaders--;	/* shared by all readers; must protect */
		pthread_mutex_unlock(&shared.rcountlock);

		Pthread_rwlock_unlock(&shared.rwlock);
	}
	//fprintf(stderr, "reader return shared.nreaders :%d\n", shared.nreaders);
	return(NULL);
}

void *
writer(void *arg)
{
	int		i;

	for (i = 0; i < nloop; i++) {
		Pthread_rwlock_wrlock(&shared.rwlock);
		shared.nwriters++;	/* only one writer; need not protect */

		if (shared.nwriters > 1)
		{
			fprintf(stderr, "writer: %d writers found", shared.nwriters);
		}

		if (shared.nreaders > 0)
		{
			fprintf(stderr, "writer: %d readers found", shared.nreaders);
		}

		shared.nwriters--;	/* only one writer; need not protect */
		Pthread_rwlock_unlock(&shared.rwlock);
	}
	//fprintf(stderr, "writer return shared.nwriters：%d\n", shared.nwriters);
	return(NULL);
}
