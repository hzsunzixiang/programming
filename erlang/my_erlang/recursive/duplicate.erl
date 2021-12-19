-module(duplicate).
-export([start/0, duplicate/2, tail_duplicate/2]).

%% duplicates Term N times
duplicate(0,_) ->
    [];
duplicate(N,Term) when N > 0 ->
    [Term|duplicate(N-1,Term)].

%% tail recursive version of duplicate/2
tail_duplicate(N,Term) ->
    tail_duplicate(N,Term,[]).

tail_duplicate(0,_,List) ->
    List;
tail_duplicate(N,Term,List) when N > 0 ->
    tail_duplicate(N-1, Term, [Term|List]).

% start
start() ->
       %io:format("Hello, World!~p~n", [timer:tc(fib, fib, [40])]).
       %io:format("Hello, World!~p~n", [duplicate(10000000, h)]).
       io:format("Hello, World!~p~n", [tail_duplicate(10000000, h)]).
% 这个递归和尾递归差别不是很明显

%%  io:format("Hello, World!~p~n", [duplicate(10000000, hello)]).
%%  这种直接报错了 
%%  erl -s duplicate start -noshell -s init stop
%%  eheap_alloc: Cannot allocate 2733560184 bytes of memory (of type "old_heap").
%%  
%%  Crash dump is being written to: erl_crash.dump...

