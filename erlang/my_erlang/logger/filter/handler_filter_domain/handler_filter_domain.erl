-include_lib("kernel/include/logger.hrl").

-module(handler_filter_domain).
-compile([export_all]).
-compile(nowarn_export_all).


start() ->
    logger:add_handler_filter(default,sasl_domain, {fun logger_filters:domain/2,{log,sup,[otp,sasl]}}),
    application:ensure_all_started(sasl),

	HandlerConfig = logger:get_config(),
	io:format("HandlerConfig:~n~p~n", [HandlerConfig]),

    %ssl:connect("www.erlang.org",443,[{log_level,debug}]),
    'this is an end'.



%HandlerConfig:
%#{primary =>
%      #{level => notice,filter_default => log,filters => [],metadata => #{}},
%  proxy =>
%      #{burst_limit_enable => false,drop_mode_qlen => 1000,flush_qlen => 5000,
%        sync_mode_qlen => 500,overload_kill_restart_after => 5000,
%        burst_limit_max_count => 500,burst_limit_window_time => 1000,
%        overload_kill_enable => false,overload_kill_mem_size => 3000000,
%        overload_kill_qlen => 20000},
%  handlers =>
%      [#{id => default,module => logger_std_h,
%         config =>
%             #{type => standard_io,burst_limit_enable => true,
%               drop_mode_qlen => 200,flush_qlen => 1000,sync_mode_qlen => 10,
%               overload_kill_restart_after => 5000,
%               burst_limit_max_count => 500,burst_limit_window_time => 1000,
%               overload_kill_enable => false,
%               overload_kill_mem_size => 3000000,overload_kill_qlen => 20000,
%               filesync_repeat_interval => no_repeat},
%         level => all,filter_default => stop,
%         filters =>
%             [{sasl_domain,{fun logger_filters:domain/2,{log,sup,[otp,sasl]}}},
%              {remote_gl,{fun logger_filters:remote_gl/2,stop}},
%              {domain,{fun logger_filters:domain/2,{log,super,[otp,sasl]}}},
%              {no_domain,{fun logger_filters:domain/2,{log,undefined,[]}}}],
%         formatter =>
%             {logger_formatter,#{single_line => false,
%                                 legacy_header => true}}}],
%  module_levels => []}

