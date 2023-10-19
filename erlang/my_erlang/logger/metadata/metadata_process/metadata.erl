-include_lib("kernel/include/logger.hrl").

-module(metadata).
-compile([export_all]).
-compile(nowarn_export_all).


start() ->
    Metadata=
        #{pid => self(),
          gl => group_leader(), 
          time => logger:timestamp(),
          mfa => {?MODULE, ?FUNCTION_NAME, ?FUNCTION_ARITY},
          file => ?FILE,
          line => ?LINE,
          foo => bar},

    logger:set_process_metadata(Metadata),

	ProcessMeta = logger:get_process_metadata(),
	io:format("ProcessMeta:~n~p~n", [ProcessMeta]),

	HandlerConfig = logger:get_handler_config(),
	io:format("HandlerConfig:~n~p~n", [HandlerConfig]),

    logger:notice("[My log with foo]."),


    MetadataUpdate = #{foo => baz},
	logger:update_process_metadata(MetadataUpdate),
    logger:notice("[My log with foo]."),
    'this is an end'.


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

