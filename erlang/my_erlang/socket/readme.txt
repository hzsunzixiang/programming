
    {ok, Listen} = gen_tcp:listen(2345, [binary, {packet, 4},  %% (6)


# 服务端
strace -f -s99999 erl -noshell -s nano_server_active_true start -s init stop


# 客户端
strace -f -s99999 erl -noshell -s nano_server_active_true start client -s init stop > client.strace 2>&1


https://www.erlang.org/doc/man/gen_tcp.html
 {packet, 0 | 1 | 2 | 4 | raw | sunrm | asn1 | cdr | fcgi | line | tpkt | http | httph | http_bin | httph_bin}

# packet 为 4  时的系统调用
可见这里有四个字节发送
20619 [pid 42787] writev(18, [{iov_base="\0\0\0\5", iov_len=4}, {iov_base="hello", iov_len=5}], 2) = 9

# 客户端发送
[pid 46097] socket(AF_INET, SOCK_STREAM, IPPROTO_TCP) = 18
[pid 46097] fcntl(18, F_GETFL)          = 0x2 (flags O_RDWR)
[pid 46097] fcntl(18, F_SETFL, O_RDWR|O_NONBLOCK) = 0
[pid 46097] connect(18, {sa_family=AF_INET, sin_port=htons(2345), sin_addr=inet_addr("127.0.0.1")}, 16) = -1 EINPROGRESS (Operation now in progress)
[pid 46097] epoll_ctl(4, EPOLL_CTL_ADD, 18, {EPOLLOUT|EPOLLONESHOT, {u32=18, u64=18}}) = 0
[pid 46097] timerfd_settime(9, 0, {it_interval={tv_sec=0, tv_nsec=0}, it_value={tv_sec=47, tv_nsec=563975903}},  <unfinished ...>
[pid 46097] epoll_wait(6, [{EPOLLIN, {u32=7, u64=140720308486151}}], 512, -1) = 1
[pid 46097] timerfd_settime(9, 0, {it_interval={tv_sec=0, tv_nsec=0}, it_value={tv_sec=0, tv_nsec=0}}, NULL) = 0
....
[pid 46097] getsockopt(18, SOL_SOCKET, SO_ERROR, [0], [4]) = 0
[pid 46097] epoll_ctl(4, EPOLL_CTL_MOD, 18, {EPOLLIN|EPOLLONESHOT, {u32=18, u64=18}}) = 0

## packet 为4
[pid 46097] writev(18, [{iov_base="\0\0\0\5", iov_len=4}, {iov_base="hello", iov_len=5}], 2) = 9

然后再从服务端接受
[pid 46097] recvfrom(18, "\0\0\0\5hello", 1460, 0, NULL, NULL) = 9


## packet 为2
[pid 46313] writev(18, [{iov_base="\0\5", iov_len=2}, {iov_base="hello", iov_len=5}], 2) = 7

然后再从服务端接受
 [pid 46313] recvfrom(18, "\0\5hello", 1460, 0, NULL, NULL) = 7

## packet 为1

[pid 46582] writev(18, [{iov_base="\5", iov_len=1}, {iov_base="hello", iov_len=5}], 2) = 6
然后再从服务端接受
[pid 46582] recvfrom(18, "\5hello", 1460, 0, NULL, NULL) = 6

## packet 为0  这里可见 虽然为0 但是仍然还有一个writev

[pid 46860] writev(18, [{iov_base=NULL, iov_len=0}, {iov_base="hello", iov_len=5}], 2) = 5
然后再从服务端接受
[pid 46860] recvfrom(18, "hello", 1460, 0, NULL, NULL) = 5




## 服务端接收
[pid 46063] accept(17, {sa_family=AF_INET, sin_port=htons(52828), sin_addr=inet_addr("127.0.0.1")}, [112->16]) = 18
[pid 46063] epoll_ctl(4, EPOLL_CTL_MOD, 17, {EPOLLONESHOT, {u32=17, u64=17}}) = 0
[pid 46063] fcntl(18, F_GETFL)          = 0x2 (flags O_RDWR)
[pid 46063] fcntl(18, F_SETFL, O_RDWR|O_NONBLOCK) = 0
...
[pid 46063] setsockopt(18, SOL_SOCKET, SO_PRIORITY, [0], 4) = 0
[pid 46063] epoll_ctl(4, EPOLL_CTL_ADD, 18, {EPOLLIN|EPOLLONESHOT, {u32=18, u64=515396075538}} <unfinished ...>
    ....
[pid 46063] getsockopt(17, SOL_SOCKET, SO_LINGER,  <unfinished ...>
[pid 46082] epoll_wait(4,  <unfinished ...>
[pid 46063] epoll_ctl(4, EPOLL_CTL_DEL, 17, 0x7fe7f5486a3c) = 0
[pid 46063] close(17)                   = 0

## packet 为 4  时服务端的系统调用
[pid 46063] recvfrom(18, "\0\0\0\5hello", 1460, 0, NULL, NULL) = 9

然后再发送给客户端
[pid 46063] writev(18, [{iov_base="\0\0\0\5", iov_len=4}, {iov_base="hello", iov_len=5}], 2 <unfinished ...>

# packet 为 2  时服务端的系统调用
[pid 46280] recvfrom(18, "\0\5hello", 1460, 0, NULL, NULL) = 7

然后再发送给客户端
[pid 46280] writev(18, [{iov_base="\0\5", iov_len=2}, {iov_base="hello", iov_len=5}], 2 <unfinished ...>

# packet 为 1  时服务端的系统调用

[pid 46549] recvfrom(18, "\5hello", 1460, 0, NULL, NULL) = 6
然后再发送给客户端
[pid 46549] writev(18, [{iov_base="\5", iov_len=1}, {iov_base="hello", iov_len=5}], 2 <unfinished ...>



# packet 为 0  时服务端的系统调用
[pid 46827] recvfrom(18, "hello", 1460, 0, NULL, NULL) = 5

然后再发送给客户端
[pid 46827] writev(18, [{iov_base=NULL, iov_len=0}, {iov_base="hello", iov_len=5}], 2 <unfinished ...>



