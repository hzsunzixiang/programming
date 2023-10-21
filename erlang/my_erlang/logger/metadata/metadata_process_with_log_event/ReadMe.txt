
%set_primary_config(Key :: metadata, Meta) -> ok | {error, term()}
%OTP 24.0
%Types
%Level = level() | all | none
%FilterDefault = log | stop
%Filters = [{filter_id(), filter()}]
%Meta = metadata()
%Add or update primary configuration data for Logger. If the given Key already exists, its associated value will be changed to the given value. If it does not exist, it will be added.
%

%ProcessMeta:
%#{line => 15,pid => <0.9.0>,time => 1697681563658640,file => "metadata.erl",
%  gl => <0.70.0>,
%  mfa => {metadata,start,0},
%  foo => bar}
%HandlerConfig:
%[#{id => default,module => logger_std_h,
%   config =>
%       #{type => standard_io,burst_limit_enable => true,drop_mode_qlen => 200,
%         flush_qlen => 1000,sync_mode_qlen => 10,
%         overload_kill_restart_after => 5000,burst_limit_max_count => 500,
%         burst_limit_window_time => 1000,overload_kill_enable => false,
%         overload_kill_mem_size => 3000000,overload_kill_qlen => 20000,
%         filesync_repeat_interval => no_repeat},
%   level => all,filter_default => stop,
%   filters =>
%       [{remote_gl,{fun logger_filters:remote_gl/2,stop}},
%        {domain,{fun logger_filters:domain/2,{log,super,[otp,sasl]}}},
%        {no_domain,{fun logger_filters:domain/2,{log,undefined,[]}}}],
%   formatter =>
%       {logger_formatter,#{template =>
%                               [time," ",file,", ",mfa,":",line," ",pid," ",
%                                gl," ",level,": ","{{",foo,"}}\t",msg,
%                                "\n"]}}}]
%2023-10-18T22:12:43.658640-04:00 metadata.erl, metadata:start/0:15 <0.9.0> <0.70.0> notice: {{bar}}     [My log with foo].
%2023-10-18T22:12:43.658640-04:00 metadata.erl, metadata:start/0:15 <0.9.0> <0.70.0> notice: {{baz}}     [My log with foo].

