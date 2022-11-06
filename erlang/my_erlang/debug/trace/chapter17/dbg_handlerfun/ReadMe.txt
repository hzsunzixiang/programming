
Eshell V13.0.4  (abort with ^G)
1> dbg:tracer(process, {fun(Trace, N) -> io:format("TRACE (#~p): ~p~n", [N, Trace]), N+1 end, 0}).
{ok,<0.83.0>}
2> dbg:p(self(), [c]).
{ok,[{matched,nonode@nohost,1}]}
3> dbg:tp(traceme, foo, []).
{ok,[{matched,nonode@nohost,1}]}
4> traceme:foo(1).
in the foo 1
TRACE (#0): {trace,<0.81.0>,call,{traceme,foo,[1]}}
ok
5> traceme:foo(2).
in the foo 2
TRACE (#1): {trace,<0.81.0>,call,{traceme,foo,[2]}}
ok
6> dbg:p(all,clear).
{ok,[{matched,nonode@nohost,45}]}
7> dbg:p(self(), [c, timestamp]).
{ok,[{matched,nonode@nohost,1}]}
8> traceme:foo(10).
in the foo 10
TRACE (#2): {trace_ts,<0.81.0>,call,{traceme,foo,"\n"},{1667,209016,603695}}
ok

