#include <pthread.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <ctype.h>

#define handle_error_en(en, msg) \
	do { errno = en; perror(msg); exit(EXIT_FAILURE); } while (0)

#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

	int
main(int argc, char *argv[])
{
	int s = 0;
	s = pthread_create(&tinfo[tnum].thread_id, &attr,
			&thread_start, &tinfo[tnum]);
	if (s != 0)
		handle_error_en(s, "pthread_create");

	//  for (tnum = 0; tnum < num_threads; tnum++) {
	//  	s = pthread_join(tinfo[tnum].thread_id, &res);
	//  	if (s != 0)
	//  		handle_error_en(s, "pthread_join");

	//  	printf("Joined with thread %d; returned value was %s\n",
	//  			tinfo[tnum].thread_num, (char *) res);
	//  	free(res);      /* Free memory allocated by thread */
	//  }

	free(tinfo);
	exit(EXIT_SUCCESS);
}
