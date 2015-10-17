
//   EXAMPLE
//          The program below demonstrates the use of pthread_create(), as well as a number of other functions in the pthreads API.
//   
//          In the following run, on a system providing the NPTL threading implementation, the stack size defaults to the value given by the "stack size" resource limit:
//   
//              $ ulimit -s
//              8192            # The stack size limit is 8 MB (0x800000 bytes)
//              $ ./a.out hola salut servus
//              Thread 1: top of stack near 0xb7dd03b8; argv_string=hola
//              Thread 2: top of stack near 0xb75cf3b8; argv_string=salut
//              Thread 3: top of stack near 0xb6dce3b8; argv_string=servus
//              Joined with thread 1; returned value was HOLA
//              Joined with thread 2; returned value was SALUT
//              Joined with thread 3; returned value was SERVUS
//   
//          In the next run, the program explicitly sets a stack size of 1MB (using pthread_attr_setstacksize(3)) for the created threads:
//   
//              $ ./a.out -s 0x100000 hola salut servus
//              Thread 1: top of stack near 0xb7d723b8; argv_string=hola
//              Thread 2: top of stack near 0xb7c713b8; argv_string=salut
//              Thread 3: top of stack near 0xb7b703b8; argv_string=servus
//              Joined with thread 1; returned value was HOLA
//              Joined with thread 2; returned value was SALUT
//              Joined with thread 3; returned value was SERVUS
//   
//      Program source
//   
//  root@debian32-1:~/programming/linux/my_apue/threads# strace -e process ./pthread_create_man   111 222 333
//  execve("./pthread_create_man", ["./pthread_create_man", "111", "222", "333"], [/* 21 vars */]) = 0
//  clone(child_stack=0xb7617424, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, parent_tidptr=0xb7617ba8, tls={entry_number:6, base_addr:0xb7617b40, limit:1048575, seg_32bit:1, contents:0, read_exec_only:0, limit_in_pages:1, seg_not_present:0, useable:1}, tls=0xbffe4bc0, child_tidptr=0xb7617ba8) = 20923
//  clone(child_stack=0xb6e17424, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, parent_tidptr=0xb6e17ba8, tls={entry_number:6, base_addr:0xb6e17b40, limit:1048575, seg_32bit:1, contents:0, read_exec_only:0, limit_in_pages:1, seg_not_present:0, useable:1}, tls=0xbffe4bc0, child_tidptr=0xb6e17ba8) = 20924
//  clone(child_stack=0xb6617424, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, parent_tidptr=0xb6617ba8, tls={entry_number:6, base_addr:0xb6617b40, limit:1048575, seg_32bit:1, contents:0, read_exec_only:0, limit_in_pages:1, seg_not_present:0, useable:1}, tls=0xbffe4bc0, child_tidptr=0xb6617ba8) = 20925
//  Thread 3: top of stack near 0xb6617344; argv_string=333
//  Thread 2: top of stack near 0xb6e17344; argv_string=222
//  Thread 1: top of stack near 0xb7617344; argv_string=111
//  Joined with thread 1; returned value was 111
//  Joined with thread 2; returned value was 222
//  Joined with thread 3; returned value was 333


// ltrace 能够看到调用的pthread_create
// root@debian32-1:~/programming/linux/my_apue/threads# ltrace ./pthread_create_man  111 222 333
// __libc_start_main(0x80488e9, 4, 0xbff03c84, 0x8048c10 <unfinished ...>
// getopt(4, 0xbff03c84, "s:")                                                                                          = -1
// pthread_attr_init(0xbff03b94, 0xbff03c84, 0x8048cfa, 0)                                                              = 0
// calloc(3, 12)                                                                                                        = 0x977c008
// pthread_create(0x977c008, 0xbff03b94, 0x804884b, 0x977c008)                                                          = 0
// pthread_create(0x977c014, 0xbff03b94, 0x804884b, 0x977c014)                                                          = 0
// pthread_create(0x977c020, 0xbff03b94, 0x804884b, 0x977c020)                                                          = 0
// pthread_attr_destroy(0xbff03b94, 0xbff03b94, 0x804884b, 0x977c020)                                                   = 0
// pthread_join(0xb7617b40, 0xbff03b90, 0x804884b, 0x977c020Thread 3: top of stack near 0xb6617344; argv_string=333
// Thread 2: top of stack near 0xb6e17344; argv_string=222
// Thread 1: top of stack near 0xb7617344; argv_string=111
// )                                                           = 0
// printf("Joined with thread %d; returned "..., 1, "111"Joined with thread 1; returned value was 111
// )                                                              = 45
// free(0xb5d00488)                                                                                                     = <void>
// pthread_join(0xb6e17b40, 0xbff03b90, 0xb5d00488, 0x977c020)                                                          = 0
// printf("Joined with thread %d; returned "..., 2, "222"Joined with thread 2; returned value was 222
// )                                                              = 45
// free(0xb5d00478)                                                                                                     = <void>
// pthread_join(0xb6617b40, 0xbff03b90, 0xb5d00478, 0x977c020)                                                          = 0
// printf("Joined with thread %d; returned "..., 3, "333"Joined with thread 3; returned value was 333
// )                                                              = 45
// free(0xb5d00468)                                                                                                     = <void>
// free(0x977c008)                                                                                                      = <void>
// exit(0 <no return ...>
// +++ exited (status 0) +++


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

struct thread_info {    /* Used as argument to thread_start() */
	pthread_t thread_id;        /* ID returned by pthread_create() */
	int       thread_num;       /* Application-defined thread # */
	char     *argv_string;      /* From command-line argument */
};

/* Thread start function: display address near top of our stack,
   and return upper-cased copy of argv_string */

	static void *
thread_start(void *arg)
{
	struct thread_info *tinfo = arg;
	char *uargv, *p;

	printf("Thread %d: top of stack near %p; argv_string=%s\n",
			tinfo->thread_num, &p, tinfo->argv_string);

	uargv = strdup(tinfo->argv_string);
	if (uargv == NULL)
		handle_error("strdup");

	for (p = uargv; *p != '\0'; p++)
		*p = toupper(*p);

	return uargv;
}

	int
main(int argc, char *argv[])
{
	int s, tnum, opt, num_threads;
	struct thread_info *tinfo;
	pthread_attr_t attr;
	int stack_size;
	void *res;

	/* The "-s" option specifies a stack size for our threads */

	stack_size = -1;
	while ((opt = getopt(argc, argv, "s:")) != -1) {
		switch (opt) {
			case 's':
				stack_size = strtoul(optarg, NULL, 0);
				break;

			default:
				fprintf(stderr, "Usage: %s [-s stack-size] arg...\n",
						argv[0]);
				exit(EXIT_FAILURE);
		}
	}

	num_threads = argc - optind;

	/* Initialize thread creation attributes */

	s = pthread_attr_init(&attr);
	if (s != 0)
		handle_error_en(s, "pthread_attr_init");

	if (stack_size > 0) {
		s = pthread_attr_setstacksize(&attr, stack_size);
		if (s != 0)
			handle_error_en(s, "pthread_attr_setstacksize");
	}

	/* Allocate memory for pthread_create() arguments */

	tinfo = calloc(num_threads, sizeof(struct thread_info));
	if (tinfo == NULL)
		handle_error("calloc");

	/* Create one thread for each command-line argument */

	for (tnum = 0; tnum < num_threads; tnum++) {
		tinfo[tnum].thread_num = tnum + 1;
		tinfo[tnum].argv_string = argv[optind + tnum];

		/* The pthread_create() call stores the thread ID into
		   corresponding element of tinfo[] */

		s = pthread_create(&tinfo[tnum].thread_id, &attr,
				&thread_start, &tinfo[tnum]);
		if (s != 0)
			handle_error_en(s, "pthread_create");
	}

	/* Destroy the thread attributes object, since it is no
	   longer needed */

	s = pthread_attr_destroy(&attr);
	if (s != 0)
		handle_error_en(s, "pthread_attr_destroy");

	/* Now join with each thread, and display its returned value */

	for (tnum = 0; tnum < num_threads; tnum++) {
		s = pthread_join(tinfo[tnum].thread_id, &res);
		if (s != 0)
			handle_error_en(s, "pthread_join");

		printf("Joined with thread %d; returned value was %s\n",
				tinfo[tnum].thread_num, (char *) res);
		free(res);      /* Free memory allocated by thread */
	}

	free(tinfo);
	exit(EXIT_SUCCESS);
}
