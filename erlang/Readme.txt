ericksun@centos7-dev:~/programming/erlang/my_erlang/release/ch11 (master)$ erl -noshell -eval 'Average= (1+2+3)/3, io:format("~p~n",[Average]), erlang:halt()'
2.0
ericksun@centos7-dev:~/programming/erlang/my_erlang/release/ch11 (master)$ erl -noshell -run io format 1 2 3
123


ericksun@centos7-dev:~/programming/erlang/my_erlang/release/ch11 (master)$ erl one -two three -pa bin/bsc -- four five -extra 6 7 eight
Erlang/OTP 19 [erts-8.3.5.3] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false]

Eshell V8.3.5.3  (abort with ^G)
1> nit:get_plain_arguments().
** exception error: undefined function nit:get_plain_arguments/0
2> init:get_plain_arguments().
["one","four","five","6","7","eight"]
3> init:get_argument(two).
{ok,[["three"]]}
4> init:get_argument(pa).
{ok,[["bin/bsc"]]}
5> init:get_argument(progname).
{ok,[["erl"]]}
6> init:get_argument(root).
{ok,[["/usr/lib64/erlang"]]}
7> init:get_argument(home).
{ok,[["/home/ericksun"]]}

