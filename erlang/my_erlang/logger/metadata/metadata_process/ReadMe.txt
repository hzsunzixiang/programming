

set_process_metadata(Meta) -> ok
Types
Meta = metadata()
Set metadata which Logger shall automatically insert in all log events produced on the current process.

Location data produced by the log macros, and/or metadata given as argument to the log call (API function or macro), are merged with the process metadata. If the same keys occur, values from the metadata argument to the log call overwrite values from the process metadata, which in turn overwrite values from the location data.

Subsequent calls to this function overwrites previous data set. To update existing data instead of overwriting it, see update_process_metadata/1.


% [time," ", file,", ", mfa, ":", line," ", pid, " ", gl, " ", level,": ", "{{", foo, "}}\t", msg, "\n"] 
 2023-10-18T06:07:38.378949-04:00 metadata.erl, metadata:start/0:15 <0.9.0> <0.70.0> notice: {{bar}}     [My log with foo].


[{kernel,
  [{logger,
    [{handler, default, logger_std_h,
      #{ formatter => {logger_formatter,
        #{ template => 
           [time," ", file,", ", mfa, ":", line," ", pid, " ", gl, " ", level,": ", "{{", foo, "}}\t", msg, "\n"] 
		}}}}]}]}].

%
%metadata:
%[#{id => default,module => logger_std_h,
%   config =>
%       #{type => standard_io,burst_limit_enable => true,drop_mode_qlen => 200,
%         flush_qlen => 1000,sync_mode_qlen => 10,
%         overload_kill_restart_after => 5000,burst_limit_max_count => 500,
%         burst_limit_window_time => 1000,overload_kill_enable => false,
%         overload_kill_mem_size => 3000000,overload_kill_qlen => 20000,
%         filesync_repeat_interval => no_repeat},
%   level => all,
%   filters =>
%       [{remote_gl,{fun logger_filters:remote_gl/2,stop}},
%        {domain,{fun logger_filters:domain/2,{log,super,[otp,sasl]}}},
%        {no_domain,{fun logger_filters:domain/2,{log,undefined,[]}}}],
%   filter_default => stop,
%   formatter =>
%       {logger_formatter,#{template =>
%                               [time," ",file,", ",mfa,":",line," ",pid," ",
%                                gl," ",level,": ","{{",foo,"}}\t",msg,
%                                "\n"]}}}]
%2023-10-18T06:07:38.378949-04:00 metadata.erl, metadata:start/0:15 <0.9.0> <0.70.0> notice: {{bar}}     [My log with foo].

update_process_metadata(Meta) when is_map(Meta) ->
    case get_process_metadata() of
        undefined ->
            set_process_metadata(Meta);
        Meta0 when is_map(Meta0) ->
            set_process_metadata(maps:merge(Meta0,Meta)),
            ok
    end;

