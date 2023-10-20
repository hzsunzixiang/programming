-include_lib("kernel/include/logger.hrl").

-module(primay_filter_log_event_error_logger).
-compile([export_all]).
-compile(nowarn_export_all).


start() ->
    %% Initial setup to use a filter for the level filter instead of the primary level
    %% #{level => notice,filters => [],filter_default => log,metadata => #{}}
    ok = logger:set_primary_config(level, all),

    % 如果修改，filter_default 默认为 default
    %logger:set_primary_config(filter_default, stop),
    add_primary_filters(),

    %% Test that things work as they should
    %%logger:error("error should be logged: Discarding message~n"),
    %%logger:error("~s~n", "error should not be logged"),
    %%error_logger("~s~n", "error should not be logged"),
    %error_logger:error_msg("~s~n", "Something strange happened"),
    error_logger:error_msg("~s~n", "error should not be logged: Discarding message"),
    error_logger:error_msg("~s~n", "error should be logged"),
    
    'this is an end'.

add_primary_filters() ->
    ok = logger:add_primary_filter(
          discarded_messages, {fun filter_discarded_message/2, stop}).


%filter_discarded_message(#{level := error,
%                           meta := #{error_logger := #{emulator := true, tag := error}},
%                           msg := {"~s~n", Msg}}, OnMatch) ->
filter_discarded_message(#{level:= error,
                           meta := #{error_logger := #{tag := error}},
                           msg  := {report, #{args := Msg, format := "~s~n"}}}=LogEvent, OnMatch) ->
    %io:format("in filter_discarded_message  LogEvent:~p~n", [LogEvent]),
    %io:format("in filter_discarded_message  Msg:~p~n", [Msg]),
    case string:find(Msg, "Discarding message") of
        nomatch ->
            io:format("ignore Msg:~p~n", [Msg]),
            ignore;
        _ ->
            io:format("match Msg:~p~n", [Msg]),
            OnMatch
    end.

% 用  error_logger:error_msg 抓到的LogEvent 为:
%filter_discarded_message(LogEvent, OnMatch) ->

%in filter_discarded_message  LogEvent:#{meta =>
%                                         #{error_logger => #{tag => error},
%                                           pid => <0.9.0>,
%                                           time => 1697769103584295,
%                                           gl => <0.70.0>,
%                                           report_cb =>
%                                            #Fun<error_logger.0.17945318>},
%                                        msg =>
%                                         {report,
%                                          #{args =>
%                                             "Something strange happened",
%                                            label => {error_logger,error_msg},
%                                            format => "~s~n"}},
%                                        level => error}
%

% 返回值 跟这一句是联动的: logger:set_primary_config(filter_default, stop),
%ok = logger:add_primary_filter(
%      discarded_messages, {fun filter_discarded_message/2, ignore}).
%1. 如果 filter_default 设置为log, filter_discarded_message/2 返回ignore 则打印
%2. 如果 filter_default 设置为stop, filter_discarded_message/2 返回ignore 则忽略

%filter_discarded_message(_LogEvent, _OnMatch) ->
%    ignore.
%


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
