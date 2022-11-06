

%% case 
Eshell V13.0.4  (abort with ^G)
1> dbg:tracer().
{ok,<0.83.0>}
2> dbg:p(self(), [c, arity, timestamp]).
{ok,[{matched,nonode@nohost,1}]}
3> dbg:tp(traceme, foo, [{['$1'], [{'>', '$1', 5}], []}]).
{ok,[{matched,nonode@nohost,1},{saved,1}]}
4> traceme:foo(1).
in the foo 1
ok
5> traceme:foo(6).
in the foo 6
(<0.81.0>) call traceme:foo/1 (Timestamp: {1667,205970,600806})
ok
%% case 
ericksun@centos7-dev:~/programming/erlang/my_erlang/erlang_programming/code/chapter17/dbg_ms (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> dbg:tracer().
{ok,<0.83.0>}
2> dbg:p(self(), [c]).
{ok,[{matched,nonode@nohost,1}]}
3> dbg:tp(traceme, bar, [{['$1', '$2'], [{'andalso', {'>=', '$1', 5}, {'not',{'is_list', '$2'}}}], []}]).
{ok,[{matched,nonode@nohost,1},{saved,1}]}
4> traceme:bar(6, {hej}).
in the foo 6{hej}
(<0.81.0>) call traceme:bar(6,{hej})
ok
5> traceme:bar(6, []).
in the foo 6[]
ok
6>

1> dbg:tracer().
{ok,<0.83.0>}
2> dbg:p(self(), [c, timestamp]).
{ok,[{matched,nonode@nohost,1}]}
3> dbg:tp(traceme, baz, [{['_', '_', '$7000'], [{'==', {'element', 1, '$7000'}, ok}], [{message,{'element',2,'$7000'}}, {return_trace}]}]).
{ok,[{matched,nonode@nohost,1},{saved,1}]}
4> traceme:baz(1,2,3).
in the foo 123
ok
5> traceme:baz(1,2,{ok, msg}).
in the foo 12{ok,msg}
(<0.81.0>) call traceme:baz(1,2,{ok,msg}) (msg) (Timestamp: {1667,206620,
                                                             416383})
(<0.81.0>) returned from traceme:baz/3 -> ok (Timestamp: {1667,206620,416542})
ok



%% 对比

9> dbg:tp(traceme, baz, [{['_', '_', '$7000'], [{'==', {'element', 1, '$7000'}, ok}], [{message,{'element',2,'$7000'}}, {message, {caller}}]}]).
{ok,[{matched,nonode@nohost,1},{saved,3}]}
10> traceme:baz(1,2,{ok, msg}).
in the foo 12{ok,msg}
(<0.81.0>) call traceme:baz(1,2,{ok,msg}) ({erl_eval,do_apply,7}) (Timestamp: {1667,
                                                                               223814,
                                                                               541727})
ok
11> dbg:tp(traceme, baz, [{['_', '_', '$7000'], [{'==', {'element', 1, '$7000'}, ok}], [{message,{'element',2,'$7000'}}, {return_trace}]}]).
{ok,[{matched,nonode@nohost,1},{saved,4}]}
12> traceme:baz(1,2,{ok, msg}).
in the foo 12{ok,msg}
(<0.81.0>) call traceme:baz(1,2,{ok,msg}) (msg) (Timestamp: {1667,223861,
                                                             996928})
(<0.81.0>) returned from traceme:baz/3 -> ok (Timestamp: {1667,223861,997029})
ok

