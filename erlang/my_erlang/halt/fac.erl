-module(fac).
-export([sum/1, fac/1, start/0, tail_sum/1]).

%% basic recursive factorial function
fac(0) -> 1;
fac(N) when N > -1 -> N*fac(N-1).

%% tail recursive version of sum/1
tail_sum(N) -> tail_sum(N,1).
tail_sum(0,Acc) -> Acc;
tail_sum(N,Acc) when N > 0 -> tail_sum(N-1,N+Acc).


sum(0) -> 0;
sum(N) when N > 0 -> N + sum(N-1).

start() ->
       %io:format("Hello, World!~B~n", [fac(10)]).
       %io:format("Hello, World!~B~n", [tail_sum(10000000)]).
       io:format("Hello, World!~B~n", [sum(200)]),
	   erlang:halt(0).

	   
%io:format("Hello, World!~B~n", [sum(20000000)]).
% 占用很大的内存
% 94119 ericksun  20   0 5888140   3.2g   4692 S  22.9  83.8   0:01.29 beam.smp

% sum(100000010) 内存占用过大，被杀掉了
% erl -s fac start -noshell -s init stop
% make: *** [Makefile:11: run] Killed

% 尾递归 很快就能算出来
% io:format("Hello, World!~B~n", [tail_sum(30000000)]).
