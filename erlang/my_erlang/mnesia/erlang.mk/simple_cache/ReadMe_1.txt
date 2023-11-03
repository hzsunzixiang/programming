




erl -config config/sys  -sname mynode3  -pa deps/recon/ebin -pa deps/resource_discovery/ebin -pa deps/simple_cache/ebin

(mynode3@centos7-mq1)22> application:ensure_all_started(simple_cache).
{ok,[resource_discovery,simple_cache]}
(mynode3@centos7-mq1)23> simple_cache:insert(abc,def).
ok
=INFO REPORT==== 31-Oct-2023::08:44:58.811606 ===
create(abc, def)

(mynode3@centos7-mq1)24> simple_cache:insert(ab,de).
=INFO REPORT==== 31-Oct-2023::08:44:58.812645 ===
create(ab, de)

ok
(mynode3@centos7-mq1)25> simple_cache:insert(a,d).
ok
=INFO REPORT==== 31-Oct-2023::08:44:58.813332 ===
create(a, d)

(mynode3@centos7-mq1)26>
                         %Function = fun(Elem) -> simple_cache:insert(Elem,Elem) end.
                         %L = [a,b,c,d,e,f,g].
                         %lists:foreach(Function, L).
                         %L1 = lists:seq(70,10,-5).
                         %lists:foreach(Function, L1).

                         simple_cache:lookup(abc).
=INFO REPORT==== 31-Oct-2023::08:44:58.814149 ===
lookup(abc)

{ok,def}
(mynode3@centos7-mq1)27>

