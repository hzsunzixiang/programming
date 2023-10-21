erlc -W handler_filter_customer.erl
erl -noshell -s handler_filter_customer start -s init stop
HandlerConfig:
#{primary =>
      #{level => all,filter_default => log,filters => [],
        metadata =>
            #{line => 28,pid => <0.9.0>,time => 1697879298101026,
              file => "handler_filter_customer.erl",gl => <0.70.0>,
              domain => [rabbitmq],
              mfa => {handler_filter_customer,start,0},
              foo => foobar}},
  proxy =>
      #{burst_limit_enable => false,drop_mode_qlen => 1000,flush_qlen => 5000,
        sync_mode_qlen => 500,overload_kill_restart_after => 5000,
        burst_limit_max_count => 500,burst_limit_window_time => 1000,
        overload_kill_enable => false,overload_kill_mem_size => 3000000,
        overload_kill_qlen => 20000},
  handlers =>
      [#{id => default,module => logger_std_h,
         config =>
             #{type => standard_io,burst_limit_enable => true,
               drop_mode_qlen => 200,flush_qlen => 1000,sync_mode_qlen => 10,
               overload_kill_restart_after => 5000,
               burst_limit_max_count => 500,burst_limit_window_time => 1000,
               overload_kill_enable => false,
               overload_kill_mem_size => 3000000,overload_kill_qlen => 20000,
               filesync_repeat_interval => no_repeat},
         level => all,filter_default => stop,
         filters =>
             [{rmqlog_filter,{#Fun<handler_filter_customer.0.82358962>,
                              #{global => all,prelaunch => notice}}},
              {remote_gl,{fun logger_filters:remote_gl/2,stop}},
              {domain,{fun logger_filters:domain/2,{log,super,[otp,sasl]}}},
              {no_domain,{fun logger_filters:domain/2,{log,undefined,[]}}}],
         formatter =>
             {logger_formatter,#{template =>
                                     [time," ",file,", ",mfa,":",line," ",pid,
                                      " ",gl," ",level,": ","{{[",foo,"]}}\t",
                                      msg,"\n"]}}}],
  module_levels => []}
domain := ?RMQLOG_DOMAIN_GLOBAL#{meta =>
                                  #{line => 28,pid => <0.9.0>,
                                    time => 1697879298101026,
                                    file => "handler_filter_customer.erl",
                                    gl => <0.70.0>,
                                    domain => [rabbitmq],
                                    mfa => {handler_filter_customer,start,0},
                                    foo => foobar},
                                 msg =>
                                  {string,
                                   "Logging: configured log handlers are now ACTIVE"},
                                 level => debug}
2023-10-21T05:08:18.101026-04:00 handler_filter_customer.erl, handler_filter_customer:start/0:28 <0.9.0> <0.70.0> debug: {{[foobar]}}	Logging: configured log handlers are now ACTIVE
