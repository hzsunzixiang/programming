


# 启动
 erl -sname apple  -noshell -s ets_deadlock start -s init stop

# 另一个shell登录
 erl -sname orange -remsh apple

再用一个shell观察内存
top -p `ps aux|grep beam |grep -v grep |awk '{print $2}'`


(apple@centos-1)30> ets:i().
 id              name              type  size   mem      owner
 ----------------------------------------------------------------------------
 ac_tab          ac_tab            set   7      968      application_controller
 code_names      code_names        set   23     2844     code_server
 file_io_servers file_io_servers   set   0      305      file_server_2
 global_locks    global_locks      set   0      305      global_name_server
 global_names    global_names      set   0      305      global_name_server
 global_names_ext global_names_ext  set   0      305      global_name_server
 global_pid_ids  global_pid_ids    bag   0      305      global_name_server
 global_pid_names global_pid_names  bag   0      305      global_name_server
 inet_cache      inet_cache        bag   0      305      inet_db
 inet_db         inet_db           set   30     587      inet_db
 inet_hosts_byaddr inet_hosts_byaddr set   0      305      inet_db
 inet_hosts_byname inet_hosts_byname set   0      305      inet_db
 inet_hosts_file_byaddr inet_hosts_file_byaddr set   0      305      inet_db
 inet_hosts_file_byname inet_hosts_file_byname set   0      305      inet_db
 inet_sockets    inet_sockets      set   0      305      inet_db
 logger          logger            set   3      1505     logger
 sys_dist        sys_dist          set   1      359      net_kernel
 #Ref<0.885367961.2395602945.146060> code              set   373    15784    code_server
 #Ref<0.885367961.2395602945.146101> rex_nodes_observer set   2      319      <0.54.0>
 #Ref<0.885367961.2395602945.146127> cookies           set   0      305      auth
 #Ref<0.885367961.2395602945.146231> table             set   219    3738     <0.9.0>
 #Ref<0.885367961.2395602945.146492> shell_records     ordered_set 0      139      <0.88.0>
ok


如果只启动一个线程 

erl +S1   -noshell -s ets_deadlock start -s init stop

Missing separate debuginfos, use: yum debuginfo-install erlang-24.2-1.el8.x86_64
(gdb) info threads
  Id   Target Id                                          Frame
* 1    Thread 0x7f4364bc9740 (LWP 7938) "beam.smp"        0x00007f436314329f in select () from /lib64/libc.so.6
  2    Thread 0x7f4322a2b700 (LWP 7942) "sys_sig_dispatc" 0x00007f4363f5c9e4 in read () from /lib64/libpthread.so.0
  3    Thread 0x7f4321dd7700 (LWP 7943) "sys_msg_dispatc" 0x00007f4363f593fc in pthread_cond_wait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0
  4    Thread 0x7f43205d6700 (LWP 7944) "async_1"         0x00007f436314652d in syscall () from /lib64/libc.so.6
  5    Thread 0x7f43205b3700 (LWP 7946) "1_scheduler"     0x00007f436314c0f7 in epoll_wait () from /lib64/libc.so.6
  6    Thread 0x7f43204b0700 (LWP 7947) "1_dirty_cpu_sch" 0x00007f436314652d in syscall () from /lib64/libc.so.6
  7    Thread 0x7f432045d700 (LWP 7948) "1_dirty_io_sche" 0x00007f436314652d in syscall () from /lib64/libc.so.6
  8    Thread 0x7f432040a700 (LWP 7949) "2_dirty_io_sche" 0x00007f436314652d in syscall () from /lib64/libc.so.6
  9    Thread 0x7f43203b7700 (LWP 7950) "3_dirty_io_sche" 0x00007f436314652d in syscall () from /lib64/libc.so.6
  10   Thread 0x7f4320364700 (LWP 7951) "4_dirty_io_sche" 0x00007f436314652d in syscall () from /lib64/libc.so.6
  11   Thread 0x7f4320311700 (LWP 7952) "5_dirty_io_sche" 0x00007f436314652d in syscall () from /lib64/libc.so.6
  12   Thread 0x7f43202be700 (LWP 7953) "6_dirty_io_sche" 0x00007f436314652d in syscall () from /lib64/libc.so.6
  13   Thread 0x7f432026b700 (LWP 7954) "7_dirty_io_sche" 0x00007f436314652d in syscall () from /lib64/libc.so.6
  14   Thread 0x7f4320218700 (LWP 7955) "8_dirty_io_sche" 0x00007f436314652d in syscall () from /lib64/libc.so.6
  15   Thread 0x7f43201c5700 (LWP 7956) "9_dirty_io_sche" 0x00007f436314652d in syscall () from /lib64/libc.so.6
  16   Thread 0x7f4320172700 (LWP 7957) "10_dirty_io_sch" 0x00007f436314652d in syscall () from /lib64/libc.so.6
  17   Thread 0x7f432011f700 (LWP 7958) "1_aux"           0x00007f4363140b36 in ppoll () from /lib64/libc.so.6
  18   Thread 0x7f43200cc700 (LWP 7959) "0_poller"        0x00007f436314c0f7 in epoll_wait () from /lib64/libc.so.6


一个线程的时候也会死锁，跟线程个数没有关系
从这里基本就能看清楚调用关系

Thread 3 (Thread 0x7fb5cd8ff700 (LWP 290)):
#0  syscall () at ../sysdeps/unix/sysv/linux/x86_64/syscall.S:38
#1  0x0000000000626405 in wait__ (timeout=<optimized out>, spincount=<optimized out>, e=<optimized out>) at pthread/ethr_event.c:152
#2  ethr_event_swait (e=0x7fb5d7e80450, spincount=128, spincount@entry=840) at pthread/ethr_event.c:599
#3  0x0000000000623992 in event_wait (mtxb=mtxb@entry=0x7fb5cc5c7f98, tse=tse@entry=0x7fb5d7e80440, spincount=840, type=type@entry=1073741824, is_freq_read=is_freq_read@entry=0, is_rwmtx=1) at common/ethr_mutex.c:575
#4  0x000000000062539e in write_lock_wait (is_rwmtx=1, is_freq_read=0, initial=<optimized out>, mtxb=0x7fb5cc5c7f98) at common/ethr_mutex.c:707
#5  rwmutex_normal_rwlock_wait (initial=<optimized out>, rwmtx=0x7fb5cc5c7f98) at common/ethr_mutex.c:2308
#6  ethr_rwmutex_rwlock (rwmtx=rwmtx@entry=0x7fb5cc5c7f98) at common/ethr_mutex.c:3006
#7  0x0000000000537e7e in erts_rwmtx_rwlock (rwmtx=0x7fb5cc5c7f98) at beam/erl_threads.h:2689
#8  erts_smp_rwmtx_rwlock (rwmtx=0x7fb5cc5c7f98) at beam/erl_smp.h:1323
#9  WLOCK_HASH (hval=69, tb=0x7fb5cc5c73b8) at beam/erl_db_hash.c:213
#10 grow (tb=0x7fb5cc5c73b8, nactive=325) at beam/erl_db_hash.c:2664
#11 0x000000000053943f in db_lookup_dbterm_hash (p=0x7fb5d7fc03d8, tbl=0x7fb5cc5c73b8, key=140418795929778, obj=<optimized out>, handle=0x7fb5cd8fecf0) at beam/erl_db_hash.c:2878
#12 0x000000000051c0f4 in do_update_counter (arg4=140418795930130, arg3=<optimized out>, arg2=<optimized out>, arg1=<optimized out>, p=<optimized out>) at beam/erl_db.c:910
#13 ets_update_counter_4 (A__p=0x7fb5d7fc03d8, BIF__ARGS=<optimized out>) at beam/erl_db.c:1080
#14 0x0000000000442e45 in process_main () at beam/beam_emu.c:2873
#15 0x00000000004d4d37 in sched_thread_func (vesdp=0x7fb5d7540fc0) at beam/erl_process.c:8118
#16 0x0000000000625b09 in thr_wrapper (vtwd=0x7ffefc4212f0) at pthread/ethread.c:114
#17 0x00007fb5d8eb8064 in start_thread (arg=0x7fb5cd8ff700) at pthread_create.c:309
#18 0x00007fb5d89e562d in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:111
