


不通过配置文件，通过API 设置 logger_formatter

logger_level = Level
Specifies the primary log level for Logger. Log events with the same, or a more severe level, pass through the primary log level check. See section Logging in the Kernel User's Guide for more information about Logger and log levels.

Level = emergency | alert | critical | error | warning | notice | info | debug | all | none

To change the primary log level at runtime, use logger:set_primary_config(level, Level).

Defaults to notice.

ProcessMeta:
#{line => 26,pid => <0.9.0>,time => 1697696065004109,
  file => "handler_level.erl",gl => <0.70.0>,
  mfa => {handler_level,start,0},
  foo => foobar}
HandlerConfig:
[#{id => default,module => logger_std_h,
   config =>
       #{type => standard_io,burst_limit_enable => true,drop_mode_qlen => 200,
         flush_qlen => 1000,sync_mode_qlen => 10,
         overload_kill_restart_after => 5000,burst_limit_max_count => 500,
         burst_limit_window_time => 1000,overload_kill_enable => false,
         overload_kill_mem_size => 3000000,overload_kill_qlen => 20000,
         filesync_repeat_interval => no_repeat},
   level => debug,
   filters =>
       [{remote_gl,{fun logger_filters:remote_gl/2,stop}},
        {domain,{fun logger_filters:domain/2,{log,super,[otp,sasl]}}},
        {no_domain,{fun logger_filters:domain/2,{log,undefined,[]}}}],
   filter_default => stop,
   formatter =>
       {logger_formatter,#{template =>
                               [time," ",file,", ",mfa,":",line," ",pid," ",
                                gl," ",level,": ","{{[",foo,"]}}\t",msg,
                                "\n"]}}}]
PrimaryConfig:
#{level => notice,filters => [],filter_default => log,metadata => #{}}
2023-10-19T02:14:25.004109-04:00 handler_level.erl, handler_level:start/0:26 <0.9.0> <0.70.0> notice: {{[foobar]}}      [My log with foo].

