proc_lib_mutex
=====

application for proc_lib

Build
-----

    $ rebar3 compile


5> sys:log(printer, {true,10}).
ok
6> sys:statistics(printer, true).
ok
7> mutex:wait(printer), mutex:signal(printer).
mutex printer: {wait,<0.142.0>}
mutex printer: {signal,<0.142.0>}
ok
8> sys:log(printer, get).
{ok,[{wait,<0.142.0>},{signal,<0.142.0>}]}
9> sys:log(printer, print).
mutex printer: {wait,<0.142.0>}
mutex printer: {signal,<0.142.0>}
ok
10> sys:get_status(printer).
{status,<0.153.0>,
        {module,mutex},
        [[{'$initial_call',{mutex,init,3}},
          {'$ancestors',[proc_lib_mutex_sup,<0.151.0>]}],
         running,<0.152.0>,
         [{statistics,{{{2022,10,8},{4,52,41}},{reductions,630},0,0}},
          {log,[8,
                {{signal,<0.142.0>},printer,#Fun<mutex.0.53770282>},
                {{wait,<0.142.0>},printer,#Fun<mutex.0.53770282>}]},
          {trace,true}],
         {free,printer}]}
11> whereis(printer).
<0.153.0>
12> exit(whereis(printer), kill).
=SUPERVISOR REPORT==== 8-Oct-2022::04:53:04.677282 ===
    supervisor: {local,proc_lib_mutex_sup}
    errorContext: child_terminated
    reason: killed
    offender: [{pid,<0.153.0>},
               {id,mutex},
               {mfargs,{mutex,start_link,[printer,[trace]]}},
               {restart_type,permanent},
               {significant,false},
               {shutdown,5000},
               {child_type,worker}]

mutex printer: init
true

