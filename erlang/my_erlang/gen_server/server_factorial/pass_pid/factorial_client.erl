%%Copyright
-module(factorial_client). 
-author("ola").
-compile(export_all).
-compile(nowarn_export_all).

start(Para)->
    factorial_server:start_link().

stop(Pid)->
    factorial_server:stop().

factorial(Pid, Val)->
    factorial_server:factorial(Pid, Val).

factorialRecorder(Pid, Val, IoDevice)->
    factorial_server:factorial(Pid, Val, IoDevice).



start() -> 
    {ok, Pid} = start(123),
    Result = factorial_client:factorial(Pid, 35),
    io:format("Factorial Result: ~p~n",[Result]),
    'this is an end'.

