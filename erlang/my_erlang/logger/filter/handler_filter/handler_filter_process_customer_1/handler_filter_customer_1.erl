-include_lib("kernel/include/logger.hrl").

-module(handler_filter_customer_1).
-compile([export_all]).
-compile(nowarn_export_all).

-define(RMQLOG_SUPER_DOMAIN_NAME, rabbitmq).
-define(RMQLOG_DOMAIN_GLOBAL,         [?RMQLOG_SUPER_DOMAIN_NAME]).
-define(DEFINE_RMQLOG_DOMAIN(Domain), [?RMQLOG_SUPER_DOMAIN_NAME, Domain]).
-define(FILTER_NAME, rmqlog_filter).
-define(RMQLOG_DOMAIN_PRELAUNCH,  ?DEFINE_RMQLOG_DOMAIN(prelaunch)).


start() ->
	logger:set_primary_config(level, all),
	logger:add_handler_filter(default, rmqlog_filter, {fun filter_log_event/2, #{global=> all,prelaunch => all}}),
	%logger:add_handler_filter(default, rmqlog_filter, {fun filter_log_event/2, #{global=> all,prelaunch => notice}}),

    Formatter = {logger_formatter,#{template => [time," ",file,", ",mfa,":",line," ",pid," ", gl," ",level,": ","{{[", foo ,"]}}\t",msg, "\n"]}},
	logger:set_handler_config(default, formatter, Formatter),

    Metadata=
        #{pid => self(),
          gl => group_leader(), 
          time => logger:timestamp(),
          mfa => {?MODULE, ?FUNCTION_NAME, ?FUNCTION_ARITY},
          file => ?FILE,
          line => ?LINE,
          domain=> ?RMQLOG_DOMAIN_PRELAUNCH, 
		  foo => foobar},
    logger:set_primary_config(metadata, Metadata),

	HandlerConfig = logger:get_config(),
	io:format("HandlerConfig:~n~p~n", [HandlerConfig]),


    logger:debug("Logging: configured log handlers are now ACTIVE"),
    %logger:notice("Logging: configured log handlers are now ACTIVE"),
    'this is an end'.

filter_log_event(#{meta := #{domain := ?RMQLOG_DOMAIN_GLOBAL}} = LogEvent, FilterConfig) ->
    io:format("domain := ?RMQLOG_DOMAIN_GLOBAL~p~n", [LogEvent]),
    MinLevel = get_min_level(global, FilterConfig),
    do_filter_log_event(LogEvent, MinLevel);
filter_log_event(#{meta := #{domain := [?RMQLOG_SUPER_DOMAIN_NAME, CatName | _]}} = LogEvent, FilterConfig) ->
    io:format("domain := [?RMQLOG_SUPER_DOMAIN_NAME, CatName | _]~p~n", [LogEvent]),
    MinLevel = get_min_level(CatName, FilterConfig),
    do_filter_log_event(LogEvent, MinLevel);
filter_log_event(#{meta := #{domain := [CatName | _]}} = LogEvent, FilterConfig) -> MinLevel = get_min_level(CatName, FilterConfig),
    io:format("domain := [CatName | _]~p~n", [LogEvent]),
    MinLevel = get_min_level(CatName, FilterConfig),
    do_filter_log_event(LogEvent, MinLevel);
filter_log_event(LogEvent, FilterConfig) ->
    io:format("no domain...~p~n", [LogEvent]),
    MinLevel = get_min_level(global, FilterConfig),
    do_filter_log_event(LogEvent, MinLevel).

%# #{global => debug,prelaunch => notice}
get_min_level(global, FilterConfig) ->
    maps:get(global, FilterConfig, none);
get_min_level(CatName, FilterConfig) ->
	% 如果直接匹配了关键字 #{global=> all,prelaunch => notice} 比如里面有 prelaunch, 则直接 prelaunch 对应的级别
	% 否则用global级别来判断
    case maps:is_key(CatName, FilterConfig) of
        true  -> maps:get(CatName, FilterConfig);  
        false -> get_min_level(global, FilterConfig)
    end.


do_filter_log_event(_, none) ->
    stop;
do_filter_log_event(#{level := Level} = LogEvent, MinLevel) ->
    % 意思是Level 要比MinLevel 更严格，否则返回stop
    case logger:compare_levels(Level, MinLevel) of
        lt -> stop;
        _  -> LogEvent
    end.

%# 这一样匹配 LogEvent中的 level， 也就是系统默认的level :do_filter_log_event(#{level := Level} = LogEvent, MinLevel) ->
% 也就是对比系统中默认的 以及  从global中获取到的级别
%#{meta =>
%                                  #{line => 28,pid => <0.9.0>,
%                                    time => 1697879298101026,
%                                    .......
%                                 level => debug}
