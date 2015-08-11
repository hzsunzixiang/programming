#include <sys/shm.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <semaphore.h>
#include <sys/shm.h>
#include <sys/stat.h>        /* For mode constants */
#include <fcntl.h>           /* For O_* constants */
#include <sys/types.h> // ftok
#include <sys/ipc.h>  // ftok
#include <malloc.h>  // M_MMAP_THRESHOLD


#define	ARRAY_SIZE	40000
#define	MALLOC_SIZE	100000
#define	SHM_SIZE	100000
#define	SHM_MODE	0600	/* user read/write */

#define err_sys(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)

#define ADDR(address) (void *)(address), (unsigned long)(address)/1024/1024, (unsigned long)(address)/1024/1024/1024

char	array[ARRAY_SIZE];	/* uninitialized data = bss */

int global_init_a = 1;
int global_uninit_a;
static int static_global_init_a = 1;
static int static_global_uninit_a;
const int const_global_a = 1;

int global_init_b = 1;
int global_uninit_b;
static int static_global_init_b = 1;
static int static_global_uninit_b;
const int const_global_b = 1;

	int
main(void)
{
	int		shmid;
	char	*ptr, *shmptr;

	int local_init_a = 1;
	int local_uninit_a;
	static int static_local_init_a = 1;
	static int static_local_uninit_a;
	const int const_local_a = 1;

	int local_init_b = 1;
	int local_uninit_b;
	static int static_local_init_b = 1;
	static int static_local_uninit_b;
	const int const_local_b = 1;

	int * malloc_p_a;
	int * malloc_from_mmap;

	printf(" M_MMAP_THRESHOLD = %u\n",  M_MMAP_THRESHOLD);
	malloc_p_a = malloc(sizeof(int));
	//  没实验出来
	// In Linux, if you request a large block of memory via malloc(), the C library will create such an anonymous mapping instead of using heap memory. ‘Large’ means larger than MMAP_THRESHOLD bytes, 128 kB by default and adjustable via mallopt().
	//malloc_from_mmap = malloc(M_MMAP_THRESHOLD + 1024);
	malloc_from_mmap = malloc(128 * 1024 + 1024);
	printf("globle uninitialized array[] from %p(%luM, %luG) to %p(%luM,%luG),\n", 
			ADDR(&array[0]), ADDR(&array[ARRAY_SIZE]) );
	// 比如用unsigned， 不然越界
	printf("stack around %p(%luM,%luG) \n", ADDR(&shmid));
	if ((ptr = malloc(MALLOC_SIZE)) == NULL)
		err_sys("malloc error");
	printf("malloced from %p(%luM, %luG) to %p(%luM, %luG)\n", ADDR(ptr), 
			ADDR(((void *)ptr+MALLOC_SIZE)) );
	if ((shmid = shmget(IPC_PRIVATE, SHM_SIZE, SHM_MODE)) < 0)
		err_sys("shmget error");
	if ((shmptr = shmat(shmid, 0, 0)) == (void *)-1)
		err_sys("shmat error");
	printf("shared memory attached from %p(%luM, %luG) to %p(%luM, %luG)\n", ADDR(shmptr),
			ADDR((void *)shmptr+SHM_SIZE));

	if (shmctl(shmid, IPC_RMID, 0) < 0)
		err_sys("shmctl error");
	printf("\nTop of heap 堆顶 is =%p(%luM, %luG) \n", ADDR(sbrk(0)));
	printf("\n         &global_init_a=%p(%luM, %luG) \t          global_init_a=%d\n", ADDR(&global_init_a), global_init_a);	

	printf("       &global_uninit_a=%p(%luM, %luG) \t        global_uninit_a=%d\n", ADDR(&global_uninit_a), global_uninit_a);	

	printf("  &static_global_init_a=%p(%luM, %luG) \t   static_global_init_a=%d\n", ADDR(&static_global_init_a), static_global_init_a);

	printf("&static_global_uninit_a=%p(%luM, %luG) \t static_global_uninit_a=%d\n",ADDR(&static_global_uninit_a), static_global_uninit_a);

	printf("        &const_global_a=%p(%luM, %luG) \t         const_global_a=%d\n", ADDR(&const_global_a),const_global_a);	


	printf("\n         &global_init_b=%p(%luM, %luG) \t          global_init_b=%d\n", ADDR(&global_init_b),global_init_b);	

	printf("       &global_uninit_b=%p(%luM, %luG) \t        global_uninit_b=%d\n", ADDR(&global_uninit_b), global_uninit_b);	

	printf("  &static_global_init_b=%p(%luM, %luG) \t   static_global_init_b=%d\n", ADDR(&static_global_init_b), static_global_init_b);

	printf("&static_global_uninit_b=%p(%luM, %luG) \t static_global_uninit_b=%d\n", ADDR(&static_global_uninit_b), static_global_uninit_b);

	printf("        &const_global_b=%p(%luM, %luG) \t         const_global_b=%d\n", ADDR(&const_global_b), const_global_b);

	printf("\n          &local_init_a=%p(%luM, %luG) \t          local_init_a=%d\n",ADDR(&local_init_a), local_init_a);	

	printf("        &local_uninit_a=%p(%luM, %luG) \t        local_uninit_a=%d\n", ADDR(&local_uninit_a), local_uninit_a);

	printf("   &static_local_init_a=%p(%luM, %luG) \t   static_local_init_a=%d\n", ADDR(&static_local_init_a), static_local_init_a);

	printf(" &static_local_uninit_a=%p(%luM, %luG) \t static_local_uninit_a=%d\n", ADDR(&static_local_uninit_a), static_local_uninit_a);	

	printf("         &const_local_a=%p(%luM, %luG) \t         const_local_a=%d\n", ADDR(&const_local_a), const_local_a);	

	printf("\n          &local_init_b=%p(%luM, %luG) \t          local_init_b=%d\n", ADDR(&local_init_b), local_init_b);	

	printf("        &local_uninit_b=%p(%luM, %luG) \t        local_uninit_b=%d\n", ADDR(&local_uninit_b), local_uninit_b);

	printf("   &static_local_init_b=%p(%luM, %luG) \t   static_local_init_b=%d\n", ADDR(&static_local_init_b), static_local_init_b);

	printf(" &static_local_uninit_b=%p(%luM, %luG) \t static_local_uninit_b=%d\n", ADDR(&static_local_uninit_b), static_local_uninit_b);	

	printf("         &const_local_b=%p(%luM, %luG) \t         const_local_b=%d\n", ADDR(&const_local_b), const_local_b);


	printf("             malloc_p_a=%p(%luM, %luG) \t           *malloc_p_a=%d\n", ADDR(malloc_p_a), *malloc_p_a);
	printf("             malloc_from_mmap=%p(%luM, %luG) \n", ADDR(malloc_from_mmap));

	exit(0);
}
