
(gdb) info threads
  Id   Target Id                                            Frame
* 1    Thread 0x7fb38b13a740 (LWP 349161) "beam.smp"        0x00007fb389e7029f in select () from /lib64/libc.so.6
  2    Thread 0x7fb388eff700 (LWP 349165) "sys_sig_dispatc" 0x00007fb38a35a9e4 in read () from /lib64/libpthread.so.0
  3    Thread 0x7fb38827f700 (LWP 349166) "sys_msg_dispatc" 0x00007fb38a3573fc in pthread_cond_wait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0
  4    Thread 0x7fb3886ab700 (LWP 349167) "async_1"         0x00007fb389e7352d in syscall () from /lib64/libc.so.6
  5    Thread 0x7fb387a7e700 (LWP 349168) "async_2"         0x00007fb389e7352d in syscall () from /lib64/libc.so.6
  6    Thread 0x7fb387a5b700 (LWP 349169) "async_3"         0x00007fb389e7352d in syscall () from /lib64/libc.so.6
  7    Thread 0x7fb387a38700 (LWP 349170) "async_4"         0x00007fb389e7352d in syscall () from /lib64/libc.so.6
  8    Thread 0x7fb387a15700 (LWP 349171) "async_5"         0x00007fb389e7352d in syscall () from /lib64/libc.so.6
  9    Thread 0x7fb3879f2700 (LWP 349172) "async_6"         0x00007fb389e7352d in syscall () from /lib64/libc.so.6
  10   Thread 0x7fb3879cf700 (LWP 349173) "async_7"         0x00007fb389e7352d in syscall () from /lib64/libc.so.6
  11   Thread 0x7fb3879ac700 (LWP 349174) "async_8"         0x00007fb389e7352d in syscall () from /lib64/libc.so.6
  12   Thread 0x7fb387989700 (LWP 349175) "async_9"         0x00007fb389e7352d in syscall () from /lib64/libc.so.6
  13   Thread 0x7fb387966700 (LWP 349176) "async_10"        0x00007fb389e7352d in syscall () from /lib64/libc.so.6
  14   Thread 0x7fb38af54700 (LWP 349177) "child_waiter"    0x00007fb38a3573fc in pthread_cond_wait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0
  15   Thread 0x7fb3875ff700 (LWP 349178) "1_scheduler"     0x00007fb389e7352d in syscall () from /lib64/libc.so.6
  16   Thread 0x7fb386dfe700 (LWP 349179) "2_scheduler"     0x00007fb389e7352d in syscall () from /lib64/libc.so.6
  17   Thread 0x7fb3865fd700 (LWP 349180) "3_scheduler"     0x00007fb389e7352d in syscall () from /lib64/libc.so.6
  18   Thread 0x7fb385dfc700 (LWP 349181) "4_scheduler"     0x00007fb389e7352d in syscall () from /lib64/libc.so.6
  19   Thread 0x7fb3853fb700 (LWP 349182) "aux"             0x00007fb389e7352d in syscall () from /lib64/libc.so.6

从上面大致看出，15~18号进程是调度进程，负责干活的,也就是在这里死锁了



Thread 18 (Thread 0x7fb385dfc700 (LWP 349181)):
#0  0x00007fb389e7352d in syscall () from /lib64/libc.so.6
#1  0x000000000061967b in wait__ (timeout=-1, spincount=spincount@entry=-1997535984, e=0x7fb388f00510, e@entry=0xa) at pthread/ethr_event.c:152
#2  ethr_event_swait (e=e@entry=0x7fb388f00510, spincount=spincount@entry=990) at pthread/ethr_event.c:599
#3  0x00000000006172cb in event_wait (mtxb=mtxb@entry=0x7fb385523168, tse=tse@entry=0x7fb388f00500, spincount=spincount@entry=990, type=type@entry=1073741824, is_freq_read=is_freq_read@entry=0, is_rwmtx=1) at common/ethr_mutex.c:575
#4  0x0000000000618a54 in write_lock_wait (is_rwmtx=1, is_freq_read=0, initial=<optimized out>, mtxb=0x7fb385523168) at common/ethr_mutex.c:707
#5  rwmutex_normal_rwlock_wait (initial=<optimized out>, rwmtx=0x7fb385523168) at common/ethr_mutex.c:2308
#6  ethr_rwmutex_rwlock (rwmtx=rwmtx@entry=0x7fb385523168) at common/ethr_mutex.c:3006
#7  0x0000000000529759 in erts_rwmtx_rwlock (rwmtx=0x7fb385523168) at beam/erl_threads.h:2689
#8  erts_smp_rwmtx_rwlock (rwmtx=0x7fb385523168) at beam/erl_smp.h:1323
#9  WLOCK_HASH (hval=<optimized out>, tb=0x7fb38551f2a0) at beam/erl_db_hash.c:213
#10 grow (nactive=319, tb=0x7fb38551f2a0) at beam/erl_db_hash.c:2664
#11 grow (tb=0x7fb38551f2a0, nactive=319) at beam/erl_db_hash.c:2632
#12 0x000000000052aaa4 in db_lookup_dbterm_hash (p=0x7fb388f803d8, tbl=0x7fb38551f2a0, key=140408994217538, obj=<optimized out>, handle=0x7fb385dfbc80) at beam/erl_db_hash.c:2878
#13 0x000000000050d977 in do_update_counter (p=0x7fb388f803d8, arg1=131327, arg2=140408994217538, arg3=<optimized out>, arg4=140408994217890) at beam/erl_db.c:910
#14 0x000000000044078b in process_main () at beam/beam_emu.c:2873
#15 0x00000000004d393c in sched_thread_func (vesdp=0x7fb3885a0f00) at beam/erl_process.c:8118
#16 0x0000000000618d56 in thr_wrapper (vtwd=0x7ffd47562720) at pthread/ethread.c:114
#17 0x00007fb38a35117a in start_thread () from /lib64/libpthread.so.0
#18 0x00007fb389e78dc3 in clone () from /lib64/libc.so.6

Thread 17 (Thread 0x7fb3865fd700 (LWP 349180)):
#0  0x00007fb389e7352d in syscall () from /lib64/libc.so.6
#1  0x00000000006197ae in wait__ (timeout=86399999673709, spincount=0, e=0x7fb388f004d0) at pthread/ethr_event.c:152
#2  ethr_event_twait (e=0x7fb388f004d0, timeout=86399999673709) at pthread/ethr_event.c:605
#3  0x00000000004db0e0 in erts_tse_twait (tmo=<optimized out>, ep=<optimized out>) at beam/erl_threads.h:3509
#4  scheduler_wait (fcalls=fcalls@entry=0x7fb3865fcc84, esdp=esdp@entry=0x7fb388596c00, rq=rq@entry=0x7fb388581d40) at beam/erl_process.c:3142
#5  0x00000000004e3606 in schedule (p=<optimized out>, calls=0) at beam/erl_process.c:9642
#6  0x00000000004397c2 in process_main () at beam/beam_emu.c:1254
#7  0x00000000004d393c in sched_thread_func (vesdp=0x7fb388596c00) at beam/erl_process.c:8118
#8  0x0000000000618d56 in thr_wrapper (vtwd=0x7ffd47562720) at pthread/ethread.c:114
#9  0x00007fb38a35117a in start_thread () from /lib64/libpthread.so.0
#10 0x00007fb389e78dc3 in clone () from /lib64/libc.so.6

Thread 16 (Thread 0x7fb386dfe700 (LWP 349179)):
#0  0x00007fb389e7352d in syscall () from /lib64/libc.so.6
#1  0x00000000006197ae in wait__ (timeout=86399999426826, spincount=0, e=0x7fb388f00490) at pthread/ethr_event.c:152
#2  ethr_event_twait (e=0x7fb388f00490, timeout=86399999426826) at pthread/ethr_event.c:605
#3  0x00000000004db0e0 in erts_tse_twait (tmo=<optimized out>, ep=<optimized out>) at beam/erl_threads.h:3509
#4  scheduler_wait (fcalls=fcalls@entry=0x7fb386dfdc84, esdp=esdp@entry=0x7fb38858c900, rq=rq@entry=0x7fb388581bc0) at beam/erl_process.c:3142
#5  0x00000000004e3606 in schedule (p=<optimized out>, calls=0) at beam/erl_process.c:9642
#6  0x00000000004397c2 in process_main () at beam/beam_emu.c:1254
#7  0x00000000004d393c in sched_thread_func (vesdp=0x7fb38858c900) at beam/erl_process.c:8118
#8  0x0000000000618d56 in thr_wrapper (vtwd=0x7ffd47562720) at pthread/ethread.c:114
#9  0x00007fb38a35117a in start_thread () from /lib64/libpthread.so.0
#10 0x00007fb389e78dc3 in clone () from /lib64/libc.so.6

Thread 15 (Thread 0x7fb3875ff700 (LWP 349178)):
#0  0x00007fb389e7352d in syscall () from /lib64/libc.so.6
#1  0x00000000006197ae in wait__ (timeout=1000912230, spincount=0, e=0x7fb388f00450) at pthread/ethr_event.c:152
#2  ethr_event_twait (e=0x7fb388f00450, timeout=1000912230) at pthread/ethr_event.c:605
#3  0x00000000004db0e0 in erts_tse_twait (tmo=<optimized out>, ep=<optimized out>) at beam/erl_threads.h:3509
#4  scheduler_wait (fcalls=fcalls@entry=0x7fb3875fec84, esdp=esdp@entry=0x7fb388582600, rq=rq@entry=0x7fb388581a40) at beam/erl_process.c:3142
#5  0x00000000004e3606 in schedule (p=<optimized out>, calls=0) at beam/erl_process.c:9642
#6  0x00000000004397c2 in process_main () at beam/beam_emu.c:1254
#7  0x00000000004d393c in sched_thread_func (vesdp=0x7fb388582600) at beam/erl_process.c:8118
#8  0x0000000000618d56 in thr_wrapper (vtwd=0x7ffd47562720) at pthread/ethread.c:114
#9  0x00007fb38a35117a in start_thread () from /lib64/libpthread.so.0
#10 0x00007fb389e78dc3 in clone () from /lib64/libc.so.6

