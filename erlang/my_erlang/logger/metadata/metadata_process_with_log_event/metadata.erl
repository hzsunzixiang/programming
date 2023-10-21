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

    % set_primary_config
    logger:set_primary_config(metadata, Metadata),

	ProcessMeta = logger:get_process_metadata(),
	io:format("ProcessMeta:~n~p~n", [ProcessMeta]),

	HandlerConfig = logger:get_handler_config(),
	io:format("HandlerConfig:~n~p~n", [HandlerConfig]),

	PrimaryConfig = logger:get_primary_config(),
	io:format("PrimaryConfig:~n~p~n", [PrimaryConfig]),
    logger:notice("[My log with foo]."),

    add_primary_filters(),
%primary_config() =
%    #{level => level() | all | none,
%      metadata => metadata(),
%      filter_default => log | stop,
%      filters => [{filter_id(), filter()}]}

    logger:notice("[My log with foo]."),


    'this is an end'.

add_primary_filters() ->
    ok = logger:add_primary_filter(
          discarded_messages, {fun filter_discarded_message/2, stop}).

filter_discarded_message(LogEvent, OnMatch) ->
    io:format("in filter_discarded_message  LogEvent:~p~n", [LogEvent]).

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
%PrimaryConfig:
%#{level => notice,
%  metadata =>
%      #{line => 24,pid => <0.9.0>,time => 1697877413847177,
%        file => "metadata.erl",gl => <0.70.0>,
%        mfa => {metadata,start,0},
%        foo => bar},
%  filter_default => log,filters => []}
%2023-10-21T04:36:53.847177-04:00 metadata.erl, metadata:start/0:24 <0.9.0> <0.70.0> notice: {{bar}}     [My log with foo].
%in filter_discarded_message  LogEvent:#{meta =>
%                                            #{line => 24,pid => <0.9.0>,
%                                              time => 1697877413847177,
%                                              file => "metadata.erl",
%                                              gl => <0.70.0>,
%                                              mfa => {metadata,start,0},
%                                              foo => bar},
%                                        msg => {string,"[My log with foo]."},
%                                        level => notice}
%Logger - error: {removed_failing_filter,discarded_messages}
%2023-10-21T04:36:53.847177-04:00 metadata.erl, metadata:start/0:24 <0.9.0> <0.70.0> notice: {{bar}}     [My log with foo].
%
