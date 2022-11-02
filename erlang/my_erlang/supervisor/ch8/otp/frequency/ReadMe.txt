
Eshell V13.0.4  (abort with ^G)
1> frequency_sup:start_link().
{ok,<0.83.0>}
2> observer:start().
ok
3> whereis(frequency).
<0.85.0>
4> whereis(freq_overload).
<0.84.0>
5> frequency:stop().
=SUPERVISOR REPORT==== 12-Oct-2022::05:12:50.552705 ===
    supervisor: {local,frequency_sup}
    errorContext: child_terminated
    reason: normal
    offender: [{pid,<0.85.0>},
               {id,frequency},
               {mfargs,{frequency,start_link,[]}},
               {restart_type,permanent},
               {significant,false},
               {shutdown,2000},
               {child_type,worker}]

ok
6> whereis(frequency).
<0.24416.0>
7> exit(whereis(frequency),kill).
=SUPERVISOR REPORT==== 12-Oct-2022::05:13:19.260627 ===
    supervisor: {local,frequency_sup}
    errorContext: child_terminated
    reason: killed
    offender: [{pid,<0.24416.0>},
               {id,frequency},
               {mfargs,{frequency,start_link,[]}},
               {restart_type,permanent},
               {significant,false},
               {shutdown,2000},
               {child_type,worker}]

true
8> whereis(frequency).
<0.24420.0>
9> supervisor:which_children(frequency_sup).
[{frequency,<0.24420.0>,worker,[frequency]},
 {freq_overload,<0.84.0>,worker,[freq_overload]}]
10> supervisor:count_children(frequency_sup).
[{specs,2},{active,2},{supervisors,0},{workers,2}]



# 运行一下
shell V13.0.4  (abort with ^G)
1> frequency_sup:start_link().
{ok,<0.83.0>}
2> frequency:allocate().
{ok,10}
3> frequency:allocate().
{ok,11}
4> frequency:allocate().
{ok,12}
5> frequency:allocate().
{ok,13}
6> frequency:allocate().
{ok,14}
7> frequency:allocate().
Id:1 Time:{5,17,10} Date:{2022,10,12}
Event:{set_alarm,{no_frequency,<0.85.0>}}
{ok,15}
8> frequency:allocate().
Id:2 Time:{5,17,12} Date:{2022,10,12}
Event:{event,{frequency_denied,<0.85.0>}}
{error,no_frequency}
9> frequency:allocate().
Id:3 Time:{5,17,12} Date:{2022,10,12}
Event:{event,{frequency_denied,<0.85.0>}}
{error,no_frequency}
10> frequency:allocate().
Id:4 Time:{5,17,13} Date:{2022,10,12}
Event:{event,{frequency_denied,<0.85.0>}}
{error,no_frequency}

