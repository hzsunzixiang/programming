-include_lib("kernel/include/logger.hrl").

-module(handler_filter_customer).
-compile([export_all]).
-compile(nowarn_export_all).

-define(RMQLOG_SUPER_DOMAIN_NAME, rabbitmq).
-define(RMQLOG_DOMAIN_GLOBAL,         [?RMQLOG_SUPER_DOMAIN_NAME]).
-define(DEFINE_RMQLOG_DOMAIN(Domain), [?RMQLOG_SUPER_DOMAIN_NAME, Domain]).
-define(FILTER_NAME, rmqlog_filter).
-define(RMQLOG_DOMAIN_PRELAUNCH,  ?DEFINE_RMQLOG_DOMAIN(prelaunch)).


start() ->
	logger:add_handler_filter(default, rmqlog_filter, {fun filter_log_event/2, #{global => debug,prelaunch => notice}}),

	HandlerConfig = logger:get_config(),
	io:format("HandlerConfig:~n~p~n", [HandlerConfig]),

    % 这里比较便利的地方在于，可以对于某条日志设置 domain
    ?LOG_NOTICE("\n== Logging ==......", #{domain => ?RMQLOG_DOMAIN_PRELAUNCH}),

    ?LOG_NOTICE( "Logging: configured log handlers are now ACTIVE", #{domain => ?RMQLOG_DOMAIN_GLOBAL}),


    'this is an end'.

filter_log_event(
  #{meta := #{domain := ?RMQLOG_DOMAIN_GLOBAL}} = LogEvent,
  FilterConfig) ->
    MinLevel = get_min_level(global, FilterConfig),
    do_filter_log_event(LogEvent, MinLevel);
filter_log_event(
  #{meta := #{domain := [?RMQLOG_SUPER_DOMAIN_NAME, CatName | _]}} = LogEvent,
  FilterConfig) ->
    MinLevel = get_min_level(CatName, FilterConfig),
    do_filter_log_event(LogEvent, MinLevel);
filter_log_event(
  #{meta := #{domain := [CatName | _]}} = LogEvent,
  FilterConfig) ->
    MinLevel = get_min_level(CatName, FilterConfig),
    do_filter_log_event(LogEvent, MinLevel);
filter_log_event(LogEvent, FilterConfig) ->
    MinLevel = get_min_level(global, FilterConfig),
    do_filter_log_event(LogEvent, MinLevel).

get_min_level(global, FilterConfig) ->
    maps:get(global, FilterConfig, none);
get_min_level(CatName, FilterConfig) ->
    case maps:is_key(CatName, FilterConfig) of
        true  -> maps:get(CatName, FilterConfig);
        false -> get_min_level(global, FilterConfig)
    end.


do_filter_log_event(_, none) ->
    stop;
do_filter_log_event(#{level := Level} = LogEvent, MinLevel) ->
    case logger:compare_levels(Level, MinLevel) of
        lt -> stop;
        _  -> LogEvent
    end.

