-module(spawn). 
-compile(export_all).
-compile(nowarn_export_all).

start() ->
   spawn(fun() -> server("Hello") end). 

server(Message) ->
   io:fwrite("~p~n",[Message]).



%% strace -f -s9999 -p 1885
%% 
%% [pid 18862] <... epoll_wait resumed>[{EPOLLIN, {u32=0, u64=47244640256}}], 512, -1) = 1
%% [pid 18862] timerfd_settime(9, 0, {it_interval={tv_sec=0, tv_nsec=0}, it_value={tv_sec=0, tv_nsec=0}}, NULL) = 0
%% [pid 18862] read(0, "\33[A", 1024)      = 3
%% [pid 18862] writev(0, [{iov_base="\10\10\10", iov_len=3}, {iov_base="   \10\10\10", iov_len=6}], 2) = 9
%% [pid 18862] writev(0, [{iov_base="5> ", iov_len=3}], 1) = 3
%% [pid 18862] writev(0, [{iov_base="spawn:start().", iov_len=14}], 1) = 14
%% [pid 18862] timerfd_settime(9, 0, {it_interval={tv_sec=0, tv_nsec=0}, it_value={tv_sec=11, tv_nsec=905209128}}, NULL) = 0
%% [pid 18862] epoll_wait(6, [{EPOLLIN, {u32=0, u64=47244640256}}], 512, -1) = 1
%% [pid 18862] timerfd_settime(9, 0, {it_interval={tv_sec=0, tv_nsec=0}, it_value={tv_sec=0, tv_nsec=0}}, NULL) = 0
%% [pid 18862] read(0, "\r", 1024)         = 1
%% [pid 18862] writev(0, [{iov_base="\r\n", iov_len=2}], 1) = 2
%% [pid 18862] ioctl(0, TIOCGWINSZ, {ws_row=46, ws_col=158, ws_xpixel=0, ws_ypixel=0}) = 0
%% [pid 18862] writev(0, [{iov_base="\"Hello\"", iov_len=7}], 1) = 7
%% [pid 18862] epoll_wait(6, [], 512, 0)   = 0
%% [pid 18862] writev(0, [{iov_base="<0.90.0>", iov_len=8}], 1) = 8
%% [pid 18862] writev(0, [{iov_base="\r\n", iov_len=2}], 1) = 2
%% [pid 18862] writev(0, [{iov_base="6> ", iov_len=3}], 1) = 3
%% [pid 18862] timerfd_settime(9, 0, {it_interval={tv_sec=0, tv_nsec=0}, it_value={tv_sec=0, tv_nsec=999370983}}, NULL) = 0

