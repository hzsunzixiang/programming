-include_lib("kernel/include/logger.hrl").

-module(primary_filter_level).
-compile([export_all]).
-compile(nowarn_export_all).


start() ->
    %% Initial setup to use a filter for the level filter instead of the primary level
    %% #{level => notice,filters => [],filter_default => log,metadata => #{}}

    PrimaryLevel = maps:get(level, logger:get_primary_config()),
    %% TODO  多一行 打印和少一行的输出竟然不一样
	%io:format("PrimaryLevel:~p~n", [PrimaryLevel]),
    logger:set_primary_config(level, all),
    ok = logger:add_primary_filter(primary_level,
        {fun logger_filters:level/2, {log, gteq, PrimaryLevel}}),
    logger:set_primary_config(filter_default, stop),

	%HandlerConfig = logger:get_config(),
	%io:format("HandlerConfig:~n~p~n", [HandlerConfig]),
    
    %% Test that things work as they should
    logger:notice("Notice should be logged"),
    logger:debug("Should not be logged"),
    
    'this is an end'.


% The filter fun is called with the log event as the first parameter, and the specified filter_args() as the second parameter.

% filter() =
%     {fun((log_event(), filter_arg()) -> filter_return()),
%      filter_arg()}
% A filter which can be installed as a handler filter, or as a primary filter in Logger.



% log_event() =
%     #{level := level(),
%       msg :=
%           {io:format(), [term()]} |
%           {report, report()} |
%           {string, unicode:chardata()},
%       meta := metadata()}
