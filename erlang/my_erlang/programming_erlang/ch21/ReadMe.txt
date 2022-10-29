
shell V13.0.4  (abort with ^G)
1> l(tracer_test_2).
{module,tracer_test_2}
2> erlang:trace_pattern({tracer_test_2, '_','_'},  [{'_',[],[{return_trace}]}], [local]).
8
3>  Pid = tracer_test_2:start_fun().
<0.85.0>
4> erlang:trace(Pid, true, [call,procs]).
1
5> Pid ! {fib, start}.
{fib,start}
6> flush().
Shell got {trace,<0.85.0>,call,{tracer_test_2,'-start_fun/0-fun-0-',[]}}
Shell got {trace,<0.85.0>,call,{tracer_test_2,fib,[4]}}
Shell got {trace,<0.85.0>,call,{tracer_test_2,fib,[3]}}
Shell got {trace,<0.85.0>,call,{tracer_test_2,fib,[2]}}
Shell got {trace,<0.85.0>,call,{tracer_test_2,fib,[1]}}
Shell got {trace,<0.85.0>,return_from,{tracer_test_2,fib,1},1}
Shell got {trace,<0.85.0>,call,{tracer_test_2,fib,[0]}}
Shell got {trace,<0.85.0>,return_from,{tracer_test_2,fib,1},1}
Shell got {trace,<0.85.0>,return_from,{tracer_test_2,fib,1},2}
Shell got {trace,<0.85.0>,call,{tracer_test_2,fib,[1]}}
Shell got {trace,<0.85.0>,return_from,{tracer_test_2,fib,1},1}
Shell got {trace,<0.85.0>,return_from,{tracer_test_2,fib,1},3}
Shell got {trace,<0.85.0>,call,{tracer_test_2,fib,[2]}}
Shell got {trace,<0.85.0>,call,{tracer_test_2,fib,[1]}}
Shell got {trace,<0.85.0>,return_from,{tracer_test_2,fib,1},1}
Shell got {trace,<0.85.0>,call,{tracer_test_2,fib,[0]}}
Shell got {trace,<0.85.0>,return_from,{tracer_test_2,fib,1},1}
Shell got {trace,<0.85.0>,return_from,{tracer_test_2,fib,1},2}
Shell got {trace,<0.85.0>,return_from,{tracer_test_2,fib,1},5}
Shell got {trace,<0.85.0>,return_from,
                 {tracer_test_2,'-start_fun/0-fun-0-',0},
                 5}
Shell got {trace,<0.85.0>,exit,normal}
ok
