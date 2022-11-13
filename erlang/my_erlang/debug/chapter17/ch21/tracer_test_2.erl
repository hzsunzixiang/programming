-module(tracer_test_2).
-compile(export_all).

fib(0) -> 1;
fib(1) -> 1;
fib(N) -> fib(N-1) + fib(N-2).

% trace_module(tracer_test, fun() -> fib(4) end).
start_fun() ->
    spawn(fun() -> do_trace(fun() -> fib(4) end) end).               % 这里是被监控的进程

%% do_trace evaluates StartFun()
%%    when it is told to do so by Parent
%% 留个启动的时机
do_trace(StartFun) ->
    receive   
	{fib, start} ->
	    StartFun()
    end.



%%% 1> l(tracer_test_2).
%%% 2> erlang:trace_pattern({tracer_test_2, '_','_'},  [{'_',[],[{return_trace}]}], [local]).
%%% 3> Pid = tracer_test_2:start_fun().
%%% 4> erlang:trace(Pid, true, [call,procs]).
%%% 5> Pid ! {fib, start}.
