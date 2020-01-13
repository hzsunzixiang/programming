


# 查看线程

ericksun@192.168.56.103:~/programming/rabbitmq_study/threaded (master)$ ps -efL |grep 20237

会看到两个线程

# strace跟踪
ericksun@192.168.56.103:~/programming/rabbitmq_study/threaded (master)$ strace -f -p 20237
strace: Process 20237 attached with 2 threads
[pid 20245] select(0, NULL, NULL, NULL, {tv_sec=42, tv_usec=942959} <unfinished ...>
[pid 20237] epoll_wait(3, [], 1023, 483) = 0
[pid 20237] epoll_ctl(3, EPOLL_CTL_MOD, 6, {EPOLLIN|EPOLLOUT|EPOLLERR, {u32=6, u64=6}}) = 0
[pid 20237] epoll_wait(3, [{EPOLLOUT, {u32=6, u64=6}}], 1023, 2465) = 1
[pid 20237] sendto(6, "\10\0\0\0\0\0\0\316", 8, 0, NULL, 0) = 8
[pid 20237] epoll_ctl(3, EPOLL_CTL_MOD, 6, {EPOLLIN, {u32=6, u64=6}}) = 0
[pid 20237] epoll_wait(3, [], 1023, 2464) = 0
[pid 20237] epoll_wait(3, [{EPOLLIN, {u32=6, u64=6}}], 1023, 33) = 1
[pid 20237] recvfrom(6, "\10\0\0\0\0\0\0\316", 4096, 0, NULL, NULL) = 8
[pid 20237] recvfrom(6, 0x55e5188d7d50, 4096, 0, NULL, NULL) = -1 EAGAIN (Resource temporarily unavailable)
[pid 20237] epoll_wait(3, [], 1023, 25) = 0

