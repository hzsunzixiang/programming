%%Copyright
-module(factorial_client). 
-author("ola").
-export([start/0, stop/0, factorial/1, factorialRecorder/2]).

start(Para)->
    factorial_server:start_link().

stop()->
    factorial_server:stop().

factorial(Val)->
    factorial_server:factorial(Val).

factorialRecorder(Val, IoDevice)->
    factorial_server:factorial(Val, IoDevice).



start() -> 
    start(123),
    Result = factorial_client:factorial(35),
    io:format("Factorial Result: ~p~n",[Result]),
    'this is an end'.

