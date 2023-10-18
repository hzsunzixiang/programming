

% [time," ", file,":",line," ",level,": ",msg,"\n"] 
2023-10-18T03:49:30.616034-04:00 metadata.erl:9 error: bar My log with foo


% [time," ", file,", ", mfa, ":", line," ",level,": ", "{{", foo, "}}\t", msg, "\n"] 
2023-10-18T04:54:32.202151-04:00 metadata.erl, metadata:start/0:9 error: {{bar}}        [My log with foo].




[{kernel,
  [{logger,
    [{handler, default, logger_std_h,
      #{ formatter => {logger_formatter,
        #{ template => 
           [time," ", file,", ", mfa, ":", line," ",level,": ", "{{", foo, "}}\t", msg, "\n"] 
		}}}}]}]}].

%metadata:
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
%                               [time," ",file,", ",mfa,":",line," ",level,
%                                ": ","{{",foo,"}}\t",msg,"\n"]}}}]
%2023-10-18T05:08:05.868331-04:00 metadata.erl, metadata:start/0:9 error: {{bar}}        [My log with foo].

