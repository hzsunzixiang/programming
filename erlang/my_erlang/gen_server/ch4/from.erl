-module(from).
-behaviour(gen_server).
-export([init/1, handle_call/3]).

init(Sum) ->
    {ok, Sum}.

handle_call({add, Data}, From, Sum) ->
    gen_server:reply(From, ok),
    timer:sleep(1000),
    NewSum = add(Data, Sum),
    io:format("From:~p, Sum:~p~n",[From, NewSum]),
    {noreply, NewSum}.

add(Data, Sum) ->
    Data + Sum.



%ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_server/ch4 (master)$ erl
%Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]
%
%Eshell V13.0.4  (abort with ^G)
%1> gen_server:start({local, from}, from, 0, []).
%{ok,<0.84.0>}
%2> gen_server:call(from, {add,10}).
%ok
%From:{<0.81.0>,[alias|#Ref<0.922850377.1312620545.93646>]}, Sum:10

