-include_lib("kernel/include/logger.hrl").

-module(primary_filter_customer).
-compile([export_all]).
-compile(nowarn_export_all).


start() ->
    %% #{level => notice,filters => [],filter_default => log,metadata => #{}}
    logger:set_primary_config(level, all),
    logger:set_primary_config(filter_default, stop),


	HandlerConfig = logger:get_config(),
	io:format("HandlerConfig:~n~p~n", [HandlerConfig]),
    
    
    %% Add the filter to allow PidToLog to send debug events
    PidToLog = self(),
    %% PidFilter 第一个参数是 log_event() ， 第二个参数是 filter_args()
    PidFilter = fun(LogEvent, _) when PidToLog =:= self() -> LogEvent;
                   (_LogEvent, _) -> ignore end,

    ok = logger:add_primary_filter(pid, {PidFilter,[]}),

    logger:debug("PID match Debug should be logged"),
    %logger:notice("PID Notice should be logged"),
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
