

ericksun@centos7-dev:~/programming/erlang/my_erlang/supervisor_bridge/frequency_supervisor_bridge (master)$ erl
freErlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> frequency_sup:start_link().
{ok,<0.83.0>}
2> frequency:allocate().
{ok,10}
3> frequency:allocate().
{ok,11}
4> frequency:deallocate(10).
ok

5> supervisor:which_children(frequency_sup).
[{frequency_sup_bridge,<0.84.0>,worker,
                       [frequency_sup_bridge]}]
6> supervisor:which_children(frequency_sup_bridge).
[]

