

不通过配置文件，通过API 设置 logger_formatter
ProcessMeta:
#{line => 29,pid => <0.9.0>,time => 1697685186098942,file => "metadata.erl",
  gl => <0.70.0>,
  mfa => {metadata,start,0},
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
   level => all,filters => [],filter_default => log,
   formatter =>
       {logger_formatter,#{template =>
                               [time," ",file,", ",mfa,":",line," ",pid," ",
                                gl," ",level,": ","{{[",foo,"]}}\t",msg,
                                "\n"]}}}]
PrimaryConfig:
#{level => notice,metadata => #{},filters => [],filter_default => log}
2023-10-18T23:13:06.098942-04:00 metadata.erl, metadata:start/0:29 <0.9.0> <0.70.0> notice: {{[foobar]}}        [My log with foo].

