ericksun@centos7-dev:~/programming/erlang/my_erlang/errors (master)$ erl




Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> spawn_link(fun() -> linkmon_1:chain(3) end).
<0.83.0>
** exception error: "chain dies here"
2> process_flag(trap_exit, true).
false
3> spawn_link(fun() -> linkmon_1:chain(3) end).
<0.90.0>
4> receive X -> X end.
{'EXIT',<0.90.0>,"chain dies here"}
5>


-----------------------


# Exception source: spawn_link(fun() -> ok end)
Untrapped Result: - nothing -
Trapped Result: {'EXIT', <0.61.0>, normal}
The process exited normally, without a problem. Note that this looks a bit like the result of catch exit(normal), except a PID is added to the tuple to know what processed failed.



ericksun@centos7-dev:~/programming/erlang/my_erlang/errors (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> spawn_link(fun() -> ok end).
<0.83.0>
2> receive  X -> X end.


ericksun@centos7-dev:~/programming/erlang/my_erlang/errors (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> process_flag(trap_exit, true).
false
2> spawn_link(fun() -> ok end).
<0.84.0>
3> receive  X -> X end.
{'EXIT',<0.84.0>,normal}
4>







# Exception source: spawn_link(fun() -> exit(reason) end)
Untrapped Result: ** exception exit: reason
Trapped Result: {'EXIT', <0.55.0>, reason}
The process has terminated for a custom reason. In this case, if there is no trapped exit, the process crashes. Otherwise, you get the above message.

ericksun@centos7-dev:~/programming/erlang/my_erlang/errors (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> spawn_link(fun() -> exit(reason) end).
** exception exit: reason
2> receive  X -> X end.



ericksun@centos7-dev:~/programming/erlang/my_erlang/errors (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> process_flag(trap_exit, true).
false
2> spawn_link(fun() -> exit(reason) end).
<0.84.0>
3> receive  X -> X end.
{'EXIT',<0.84.0>,reason}




# Exception source: spawn_link(fun() -> exit(normal) end)
Untrapped Result: - nothing -
Trapped Result: {'EXIT', <0.58.0>, normal}
This successfully emulates a process terminating normally. In some cases, you might want to kill a process as part of the normal flow of a program, without anything exceptional going on. This is the way to do it.



ericksun@centos7-dev:~/programming/erlang/my_erlang/errors (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> spawn_link(fun() -> exit(normal) end).
<0.83.0>
2>  receive  X -> X end.

ericksun@centos7-dev:~/programming/erlang/my_erlang/errors (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> process_flag(trap_exit, true).
false
2> spawn_link(fun() -> exit(normal) end).
<0.84.0>
3>  receive  X -> X end.
{'EXIT',<0.84.0>,normal}



# Exception source: spawn_link(fun() -> 1/0 end)
Untrapped Result: Error in process <0.44.0> with exit value: {badarith, [{erlang, '/', [1,0]}]}
Trapped Result: {'EXIT', <0.52.0>, {badarith, [{erlang, '/', [1,0]}]}}
The error ({badarith, Reason}) is never caught by a try ... catch block and bubbles up into an 'EXIT'. At this point, it behaves exactly the same as exit(reason) did, but with a stack trace giving more details about what happened.



ericksun@centos7-dev:~/programming/erlang/my_erlang/errors (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> spawn_link(fun() -> 1/0 end).
=ERROR REPORT==== 25-Sep-2022::23:03:48.902276 ===
Error in process <0.83.0> with exit value:
{badarith,[{erlang,'/',[1,0],[{error_info,#{module => erl_erts_errors}}]}]}

** exception exit: badarith
     in operator  '/'/2
        called as 1 / 0
2> process_flag(trap_exit, true).
false
3> spawn_link(fun() -> 1/0 end).
<0.87.0>
4> =ERROR REPORT==== 25-Sep-2022::23:04:21.597809 ===
Error in process <0.87.0> with exit value:
{badarith,[{erlang,'/',[1,0],[{error_info,#{module => erl_erts_errors}}]}]}


4>  receive  X -> X end.
{'EXIT',<0.87.0>,
        {badarith,[{erlang,'/',
                           [1,0],
                           [{error_info,#{module => erl_erts_errors}}]}]}}



# Exception source: spawn_link(fun() -> erlang:error(reason) end)
Untrapped Result: Error in process <0.47.0> with exit value: {reason, [{erlang, apply, 2}]}
Trapped Result: {'EXIT', <0.74.0>, {reason, [{erlang, apply, 2}]}}
Pretty much the same as with 1/0. That's normal, erlang:error/1 is meant to allow you to do just that.



ericksun@centos7-dev:~/programming/erlang/my_erlang/errors (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> spawn_link(fun() -> erlang:error(reason) end).
=ERROR REPORT==== 25-Sep-2022::23:09:39.628797 ===
Error in process <0.83.0> with exit value:
{reason,[{shell,apply_fun,3,[{file,"shell.erl"},{line,912}]}]}

** exception exit: reason
2>  process_flag(trap_exit, true).
false
3> spawn_link(fun() -> erlang:error(reason) end).
=ERROR REPORT==== 25-Sep-2022::23:10:03.612755 ===
Error in process <0.87.0> with exit value:
{reason,[{shell,apply_fun,3,[{file,"shell.erl"},{line,912}]}]}

<0.87.0>
4> receive  X -> X end.
{'EXIT',<0.87.0>,
        {reason,[{shell,apply_fun,3,
                        [{file,"shell.erl"},{line,912}]}]}}

# Exception source: spawn_link(fun() -> throw(rocks) end)
Untrapped Result: Error in process <0.51.0> with exit value: {{nocatch, rocks}, [{erlang, apply, 2}]}
Trapped Result: {'EXIT', <0.79.0>, {{nocatch, rocks}, [{erlang, apply, 2}]}}
Because the throw is never caught by a try ... catch, it bubbles up into an error, which in turn bubbles up into an EXIT. Without trapping exit, the process fails. Otherwise it deals with it fine.



ericksun@centos7-dev:~/programming/erlang/my_erlang/errors (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> spawn_link(fun() -> throw(rocks) end).
** exception exit: {nocatch,rocks}
=ERROR REPORT==== 25-Sep-2022::23:12:05.658973 ===
Error in process <0.83.0> with exit value:
{{nocatch,rocks},[{shell,apply_fun,3,[{file,"shell.erl"},{line,912}]}]}

2> process_flag(trap_exit, true).
false
3> spawn_link(fun() -> throw(rocks) end).
<0.87.0>
=ERROR REPORT==== 25-Sep-2022::23:12:14.583550 ===
Error in process <0.87.0> with exit value:
{{nocatch,rocks},[{shell,apply_fun,3,[{file,"shell.erl"},{line,912}]}]}

4> receive  X -> X end.
{'EXIT',<0.87.0>,
        {{nocatch,rocks},
         [{shell,apply_fun,3,[{file,"shell.erl"},{line,912}]}]}}


# Exception source: exit(self(), normal)
Untrapped Result: ** exception exit: normal
Trapped Result: {'EXIT', <0.31.0>, normal}
When not trapping exits, exit(self(), normal) acts the same as exit(normal). Otherwise, you receive a message with the same format you would have had by listening to links from foreign processes dying.


ericksun@centos7-dev:~/programming/erlang/my_erlang/errors (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> exit(self(), normal).
** exception exit: normal
2>  process_flag(trap_exit, true).
false
3> exit(self(), normal).
true
4>  receive  X -> X end.
{'EXIT',<0.83.0>,normal}



# Exception source: exit(spawn_link(fun() -> timer:sleep(50000) end), normal)   无任何反映
Untrapped Result: - nothing -
Trapped Result: - nothing -
This basically is a call to exit(Pid, normal). This command doesn't do anything useful, because a process can not be remotely killed with the reason normal as an argument.



ericksun@centos7-dev:~/programming/erlang/my_erlang/errors (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> process_flag(trap_exit, true).
false
2> exit(spawn_link(fun() -> timer:sleep(2000) end), normal).
true
3> receive  X -> X end.
{'EXIT',<0.84.0>,normal}
4> process_flag(trap_exit, false).
true
5> exit(spawn_link(fun() -> timer:sleep(2000) end), normal).
true
6> receive  X -> X end.

# Exception source: exit(spawn_link(fun() -> timer:sleep(50000) end), reason)
Untrapped Result: ** exception exit: reason
Trapped Result: {'EXIT', <0.52.0>, reason}
This is the foreign process terminating for reason itself. Looks the same as if the foreign process called exit(reason) on itself.


ericksun@centos7-dev:~/programming/erlang/my_erlang/errors (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> exit(spawn_link(fun() -> timer:sleep(2000) end), reason).
** exception exit: reason
2> process_flag(trap_exit, true).
false
3>  exit(spawn_link(fun() -> timer:sleep(2000) end), reason).
true
4> receive  X -> X end.
{'EXIT',<0.87.0>,reason}




# Exception source: exit(spawn_link(fun() -> timer:sleep(50000) end), kill)
Untrapped Result: ** exception exit: killed
Trapped Result: {'EXIT', <0.58.0>, killed}
Surprisingly, the message gets changed from the dying process to the spawner. The spawner now receives killed instead of kill. That's because kill is a special exit signal. More details on this later.



ericksun@centos7-dev:~/programming/erlang/my_erlang/errors (master)$ erl

Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1>
1> exit(spawn_link(fun() -> timer:sleep(50000) end), kill).
** exception exit: killed
2>  process_flag(trap_exit, true).
false
3> exit(spawn_link(fun() -> timer:sleep(50000) end), kill).
true
4> receive  X -> X end.
{'EXIT',<0.87.0>,killed}

# Exception source: exit(self(), kill)
Untrapped Result: ** exception exit: killed
Trapped Result: ** exception exit: killed
Oops, look at that. It seems like this one is actually impossible to trap. Let's check something.


ericksun@centos7-dev:~/programming/erlang/my_erlang/errors (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> exit(self(), kill).
** exception exit: killed
2> process_flag(trap_exit, true).
false
3> exit(self(), kill).
** exception exit: killed
4> receive  X -> X end.


# Exception source: spawn_link(fun() -> exit(kill) end)
Untrapped Result: ** exception exit: killed
Trapped Result: {'EXIT', <0.67.0>, kill}
Now that's getting confusing. When another process kills itself with exit(kill) and we don't trap exits, our own process dies with the reason killed. However, when we trap exits, things don't happen that way.



ericksun@centos7-dev:~/programming/erlang/my_erlang/errors (master)$ erl

Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1>
1> spawn_link(fun() -> exit(kill) end).
** exception exit: kill
2> process_flag(trap_exit, true).
false
3> spawn_link(fun() -> exit(kill) end).
<0.87.0>
4>

