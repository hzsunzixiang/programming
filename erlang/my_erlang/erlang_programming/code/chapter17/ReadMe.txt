

特别注意： 终端 要flush才能看到
###  
ericksun@centos7-dev:~/programming/erlang/my_erlang/erlang_programming/code/chapter17 (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> observer:start().
ok
2> Pid = ping:start().
<0.20890.0>
3> erlang:trace(Pid, true, [send, 'receive']).
1
4> ping:send(Pid).
pong
5> =ERROR REPORT==== 25-Oct-2022::08:39:52.914825 ===
Error in process <0.26746.3> with exit value:
{undef,[{crash,do_not_exist,[],[]}]}


5> flush().
Shell got {trace,<0.20890.0>,'receive',{<0.81.0>,ping}}
Shell got {trace,<0.20890.0>,send,pong,<0.81.0>}
ok
6> erlang:trace(Pid, false, [send, 'receive']).
1


### 
ericksun@centos7-dev:~/programming/erlang/my_erlang/erlang_programming/code/chapter17 (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> Pid = ping_normal:start().
<0.83.0>
2> erlang:trace(Pid, true, [send, 'receive']).
1
3> ping_normal:send(Pid).
begin here
end here
pong
4> flush().
Shell got {trace,<0.83.0>,'receive',{<0.81.0>,ping}}
Shell got {trace,<0.83.0>,send,
              {io_request,<0.83.0>,#Ref<0.1719710071.2609381377.169050>,
                  {put_chars,unicode,io_lib,format,["begin here ~n",[]]}},
              <0.66.0>}
Shell got {trace,<0.83.0>,'receive',
                 {io_reply,#Ref<0.1719710071.2609381377.169050>,ok}}
Shell got {trace,<0.83.0>,send,pong,<0.81.0>}
Shell got {trace,<0.83.0>,send,
              {io_request,<0.83.0>,#Ref<0.1719710071.2609381377.169052>,
                  {put_chars,unicode,io_lib,format,["end here ~n",[]]}},
              <0.66.0>}
Shell got {trace,<0.83.0>,'receive',
                 {io_reply,#Ref<0.1719710071.2609381377.169052>,ok}}
ok
5> self().
<0.81.0>

