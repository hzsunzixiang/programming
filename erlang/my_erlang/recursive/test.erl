
-module(test).
-export([fib_tail/1, start/0]).


fib_tail(N) -> fib_iter(N, 0, 1).


fib_iter(0, Result, _Next) -> Result;     

fib_iter(Iter, Result, Next) when Iter > 0 ->
    fib_iter(Iter-1, Next, Result + Next). 



%fib_tail(N) -> fib_iter(N, 0, 1).
%
%fib_iter(0, Result, _Next) -> Result;
%
%fib_iter(Iter, Result, Next) when Iter > 0 ->
%
%fib_iter(Iter-1, Next, Result+Next).

start() ->
       %io:format("Hello, World!~B~n", [fib(100)]).
       %io:format("Hello, World!~B~n", [fib_tail(1000)]).
       io:format("Hello, World!~p~n", [fib_tail(10)]).


