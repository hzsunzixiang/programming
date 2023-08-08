
ericksun@centos7-mq1:~/programming/erlang/my_erlang/gen_event/alarm_handler/config_template (master)$ erl -boot start_sasl -kernel logger_sasl_compatible true -config elog2
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> observer:start().
ok
2> error_logger:error_report("Serious error in my module").
ok
3> =ERROR REPORT==== 7-Aug-2023::22:46:21.369572 ===
Serious error in my module

ericksun@centos7-mq1:~/programming/erlang/my_erlang/gen_event/alarm_handler/config_template (master)$ cat test_sasl_file
=PROGRESS REPORT==== 7-Aug-2023::22:53:12.823997 ===
    supervisor: {local,sasl_safe_sup}
    started: [{pid,<0.88.0>},
              {id,alarm_handler},
              {mfargs,{alarm_handler,start_link,[]}},
              {restart_type,permanent},
              {significant,false},
              {shutdown,2000},
              {child_type,worker}]

=PROGRESS REPORT==== 7-Aug-2023::22:53:12.825777 ===
    supervisor: {local,sasl_sup}
    started: [{pid,<0.87.0>},
              {id,sasl_safe_sup},
              {mfargs,{supervisor,start_link,
                                  [{local,sasl_safe_sup},sasl,safe]}},
              {restart_type,permanent},
              {significant,false},
              {shutdown,infinity},
              {child_type,supervisor}]

=PROGRESS REPORT==== 7-Aug-2023::22:53:12.845711 ===
    supervisor: {local,sasl_sup}
    started: [{pid,<0.89.0>},
              {id,release_handler},
              {mfargs,{release_handler,start_link,[]}},
              {restart_type,permanent},
              {significant,false},
              {shutdown,2000},
              {child_type,worker}]

=PROGRESS REPORT==== 7-Aug-2023::22:53:12.846246 ===
    application: sasl
    started_at: nonode@nohost

