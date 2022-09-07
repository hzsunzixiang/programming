6> application:which_applications().
[{stdlib,"ERTS  CXC 138 10","3.3"},
 {kernel,"ERTS  CXC 138 10","5.2"}]

7> application:start(sasl).

=PROGRESS REPORT==== 7-Sep-2022::03:16:03 ===
          supervisor: {local,sasl_safe_sup}
             started: [{pid,<0.79.0>},
                       {id,alarm_handler},
                       {mfargs,{alarm_handler,start_link,[]}},
                       {restart_type,permanent},
                       {shutdown,2000},
                       {child_type,worker}]

=PROGRESS REPORT==== 7-Sep-2022::03:16:03 ===
          supervisor: {local,sasl_sup}
             started: [{pid,<0.78.0>},
                       {id,sasl_safe_sup},
                       {mfargs,
                           {supervisor,start_link,
                               [{local,sasl_safe_sup},sasl,safe]}},
                       {restart_type,permanent},
                       {shutdown,infinity},
                       {child_type,supervisor}]

=PROGRESS REPORT==== 7-Sep-2022::03:16:03 ===
          supervisor: {local,sasl_sup}
             started: [{pid,<0.80.0>},
                       {id,release_handler},
                       {mfargs,{release_handler,start_link,[]}},
                       {restart_type,permanent},
                       {shutdown,2000},
                       {child_type,worker}]

=PROGRESS REPORT==== 7-Sep-2022::03:16:03 ===
         application: sasl
          started_at: nonode@nohost

8> application:which_applications().
[{sasl,"SASL  CXC 138 11","3.0.3"},
 {stdlib,"ERTS  CXC 138 10","3.3"},
 {kernel,"ERTS  CXC 138 10","5.2"}]


9> application:stop(sasl).

=INFO REPORT==== 7-Sep-2022::03:16:52 ===
    application: sasl
    exited: stopped
    type: temporary
ok

