gen_event_rebar3
=====

gen_event by rebar3

Build
-----

    $ rebar3 compile


2> regs().

** Registered procs on node nonode@nohost **
Name                  Pid          Initial Call                      Reds Msgs
alarm_handler         <0.175.0>    gen_event:init_it/6                 55    0
.....
freq_overload         <0.168.0>    gen_event:init_it/6                264    0
frequency             <0.167.0>    frequency:init/1                    62    0
gen_event_rebar3_sup  <0.166.0>    supervisor:gen_event_reba          302    0

5> frequency:allocate().
{ok,10}
6> frequency:allocate().
{ok,11}
7> frequency:allocate().
{ok,12}
8> frequency:allocate().
{ok,13}
9> frequency:allocate().
{ok,14}
10> frequency:allocate().
Id:1 Time:{9,42,6} Date:{2022,10,23}
Event:{set_alarm,{no_frequency,<0.167.0>}}
{ok,15}
11> frequency:allocate().
Id:2 Time:{9,42,6} Date:{2022,10,23}
Event:{event,{frequency_denied,<0.167.0>}}
{error,no_frequency}

## 不能对work 进行 which_children 
# 设置成worker
16> supervisor:which_children(gen_event_rebar3_sup).
[{freq_overload,<0.168.0>,worker,dynamic},
{frequency,<0.167.0>,worker,[frequency]}]
17> supervisor:which_children(freq_overload).
Id:4 Time:{9,43,50} Date:{2022,10,23}
Unknown:{'$gen_call',{<0.1941.4>,#Ref<0.1778556609.3780378625.142485>},which_children}


# 设置成supervisor 也不行， 就应该是一个worker,里面只是其的handler
2> supervisor:which_children(gen_event_rebar3_sup).
[{freq_overload,<0.168.0>,supervisor,dynamic},
 {frequency,<0.167.0>,worker,[frequency]}]
3> supervisor:which_children(freq_overload).
Id:1 Time:{9,45,46} Date:{2022,10,23}
Unknown:{'$gen_call',{<0.155.0>,#Ref<0.1182063513.2170814465.204495>},which_children}



