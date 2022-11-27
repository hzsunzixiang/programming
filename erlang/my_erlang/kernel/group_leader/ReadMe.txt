
4> erlang:length(erlang:processes()).
40
5> io:format("hello,world!~n").
hello,world!
ok


Cericksun@centos7-dev:~/programming/erlang/my_erlang/kernel/group_leader (master)$ erl -mode interactive
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> crypto:strong_rand_bytes(1).
<<21>>
2>
──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
ericksun@centos7-dev:~/programming/erlang/my_erlang/kernel/group_leader (master)$ erl -mode embedded
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> crypto:strong_rand_bytes(1).
** exception error: undefined function crypto:strong_rand_bytes/1
2>


%% embedded 模式下只有两个路径被导入
ericksun@centos7-dev:~/programming/erlang/my_erlang/kernel/group_leader (master)$ erl -mode embedded
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> crypto:strong_rand_bytes(1).
** exception error: undefined function crypto:strong_rand_bytes/1
2> code:get_mode().
embedded
3> code:get_path().
["/home/ericksun/program/otp-25.0.4/lib/erlang/lib/kernel-8.4.2/ebin",
 "/home/ericksun/program/otp-25.0.4/lib/erlang/lib/stdlib-4.0.1/ebin"]
4>



Cericksun@centos7-dev:~/programming/erlang/my_erlang/kernel/group_leader (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> spawn(fun()-> io:format("hello,world~n") end).
hello,world
<0.83.0>


[begin io:format("shell 1 ~p~n", [erlang:universaltime()]), timer:sleep(1000) end || _ <- lists:seq(1, 1000)].

Eshell V13.0.4  (abort with ^G)
1> [begin io:format("shell 1 ~p~n", [erlang:universaltime()]), timer:sleep(1000) end || _ <- lists:seq(1, 1000)].
shell 1 {{2022,11,27},{11,46,27}}
shell 1 {{2022,11,27},{11,46,28}}
shell 1 {{2022,11,27},{11,46,29}}
shell 1 {{2022,11,27},{11,46,30}}
shell 1 {{2022,11,27},{11,46,31}}
shell 1 {{2022,11,27},{11,46,32}}

User switch command
 --> s
 --> c
Eshell V13.0.4  (abort with ^G)
1> [begin io:format("shell 2 ~p~n", [erlang:universaltime()]), timer:sleep(1000) end || _ <- lists:seq(1, 1000)].
shell 2 {{2022,11,27},{11,48,45}}
shell 2 {{2022,11,27},{11,48,46}}
shell 2 {{2022,11,27},{11,48,47}}
shell 2 {{2022,11,27},{11,48,48}}
shell 2 {{2022,11,27},{11,48,49}}
shell 2 {{2022,11,27},{11,48,50}}
shell 2 {{2022,11,27},{11,48,51}}
shell 2 {{2022,11,27},{11,48,52}}
shell 2 {{2022,11,27},{11,48,53}}

User switch command
 --> c 1
shell 1 {{2022,11,27},{11,48,54}}
shell 1 {{2022,11,27},{11,48,59}}
shell 1 {{2022,11,27},{11,49,0}}

User switch command

