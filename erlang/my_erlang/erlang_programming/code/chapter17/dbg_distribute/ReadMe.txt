
%% 节点foo上
Eshell V13.0.4  (abort with ^G)
1> net_kernel:start([foo, shortnames]).
{ok,<0.83.0>}
(foo@centos7-dev)2> dbg:tracer().
{ok,<0.90.0>}
(foo@centos7-dev)3> dbg:n(bar@centos7-dev).
** exception error: an error occurred when evaluating an arithmetic expression
     in operator  -/2
        called as bar@centos7 - dev
(foo@centos7-dev)4> dbg:n('bar@centos7-dev').
{ok,'bar@centos7-dev'}
(foo@centos7-dev)5> dbg:p(all, c).
{ok,[{matched,'foo@centos7-dev',51},
     {matched,'bar@centos7-dev',50}]}
(foo@centos7-dev)6> dbg:tp(traceme, foo, []).
{ok,[{matched,'foo@centos7-dev',1},
     {matched,'bar@centos7-dev',1}]}
(foo@centos7-dev)7> (<9899.81.0>) call traceme:foo('bar@centos7-dev')

(foo@centos7-dev)7> traceme:foo(node()).
in the foo 'foo@centos7-dev'
(<0.93.0>) call traceme:foo('foo@centos7-dev')
ok
(foo@centos7-dev)8>

%%%% 节点 bar上 
Eshell V13.0.4  (abort with ^G)
1> net_kernel:start([bar, shortnames]).
{ok,<0.83.0>}
(bar@centos7-dev)2> traceme:foo(node()).
in the foo 'bar@centos7-dev'
ok

