
PROGS =	testcancel incr_rwlock1 test1 rwlock
FUNCS = pthread_rwlock_destroy.o pthread_rwlock_init.o \
		pthread_rwlock_rdlock.o pthread_rwlock_tryrdlock.o \
		pthread_rwlock_trywrlock.o pthread_rwlock_unlock.o \
		pthread_rwlock_wrlock.o
#
all:	${PROGS}

test1:	test1.o ${FUNCS}
		${CC} ${CFLAGS} -o $@ test1.o ${FUNCS} -lpthread 

testcancel:	testcancel.o ${FUNCS}
		${CC} ${CFLAGS} -o $@ testcancel.o ${FUNCS}  -lpthread
#
incr_rwlock1:	incr_rwlock1.o ${FUNCS}
		${CC} ${CFLAGS} -o $@ incr_rwlock1.o ${FUNCS} -lpthread
rwlock:	rwlock.o ${FUNCS}
		${CC} ${CFLAGS} -o $@ rwlock.o ${FUNCS} -lpthread

clean:
		rm -f ${PROGS} ${CLEANFILES} ${FUNCS} *.o
