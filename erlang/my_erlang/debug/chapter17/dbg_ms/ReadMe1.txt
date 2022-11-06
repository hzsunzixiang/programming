
Eshell V13.0.4  (abort with ^G)
1> dbg:tracer().
{ok,<0.83.0>}
2> dbg:p(self(), [c, timestamp]).
{ok,[{matched,nonode@nohost,1}]}
3> dbg:tp(traceme, baz, [{['_', '_', '$7000'], [{'==', {'element', 1, '$7000'}, ok}], [{message,{'element',2,'$7000'}}, {message}]}]).
{error,[{error,"Special form 'message' called with wrong number of arguments in {message}."}]}
4> dbg:tp(traceme, baz, [{['_', '_', '$7000'], [{'==', {'element', 1, '$7000'}, ok}], [{message,{'element',2,'$7000'}}, {message, caller}]}]).
{ok,[{matched,nonode@nohost,1},{saved,1}]}
5> traceme:baz(1,2,{ok, msg}).
in the foo 12{ok,msg}
(<0.81.0>) call traceme:baz(1,2,{ok,msg}) (caller) (Timestamp: {1667,223694,
                                                                537528})
ok
6> dbg:tp(traceme, baz, [{['_', '_', '$7000'], [{'==', {'element', 1, '$7000'}, ok}], [{message,{'element',2,'$7000'}}, {message, callee}]}]).
{ok,[{matched,nonode@nohost,1},{saved,2}]}
7> traceme:baz(1,2,{ok, msg}).
in the foo 12{ok,msg}
(<0.81.0>) call traceme:baz(1,2,{ok,msg}) (callee) (Timestamp: {1667,223712,
                                                                330364})
ok
8> dbg:tp(traceme, baz, [{['_', '_', '$7000'], [{'==', {'element', 1, '$7000'}, ok}], [{message,{'element',2,'$7000'}}, {message, {callee}}]}]).
{error,[{error,"Function callee/0 does_not_exist."}]}
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


