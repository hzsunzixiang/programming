

# 
setting primary metadata with set_primary_config/1 or through the kernel configuration parameter logger_metadata
Note


# https://www.erlang.org/doc/man/kernel_app#logger_metadata

logger_metadata = Metadata
Specifies primary metadata for log events.

Metadata = map()


Defaults to #{}.
ProcessMeta:
#{line => 15,pid => <0.9.0>,time => 1697683804236937,file => "metadata.erl",
  gl => <0.70.0>,
  mfa => {metadata,start,0}}
HandlerConfig:
[#{id => default,module => logger_std_h,
   config =>
       #{type => standard_io,burst_limit_enable => true,drop_mode_qlen => 200,
         flush_qlen => 1000,sync_mode_qlen => 10,
         overload_kill_restart_after => 5000,burst_limit_max_count => 500,
         burst_limit_window_time => 1000,overload_kill_enable => false,
         overload_kill_mem_size => 3000000,overload_kill_qlen => 20000,
         filesync_repeat_interval => no_repeat},
   level => all,filter_default => stop,
   filters =>
       [{remote_gl,{fun logger_filters:remote_gl/2,stop}},
        {domain,{fun logger_filters:domain/2,{log,super,[otp,sasl]}}},
        {no_domain,{fun logger_filters:domain/2,{log,undefined,[]}}}],
   formatter =>
       {logger_formatter,#{template =>
                               [time," ",file,", ",mfa,":",line," ",pid," ",
                                gl," ",level,": ","{{",foo,"}}\t",msg,
                                "\n"]}}}]
PrimaryConfig:
#{level => notice,
  metadata => #{foo => foobar},
  filter_default => log,filters => []}
2023-10-18T22:50:04.236937-04:00 metadata.erl, metadata:start/0:15 <0.9.0> <0.70.0> notice: {{foobar}}  [My log with foo].

