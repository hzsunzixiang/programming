-include_lib("kernel/include/logger.hrl").

-module(primary_filter_log_event).
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
    logger:error("~p~n", ["error should not be logged: Discarding message"]),
    %%logger:error("~p~n", ["error should be logged"]),
    
    'this is an end'.

add_primary_filters() ->
    ok = logger:add_primary_filter(
          discarded_messages, {fun filter_discarded_message/2, stop}).

%filter_discarded_message(LogEvent, OnMatch) ->
%    io:format("in filter_discarded_message  LogEvent:~p~n", [LogEvent]),
%	OnMatch.
%
filter_discarded_message(#{level := error,
                           meta  := #{pid := ProcessId, time := TimeStamp, gl := GroupLeader}, 
                           msg   := {"~p~n", [Msg]}}=LogEvent, OnMatch) ->
    io:format("in filter_discarded_message  LogEvent:~p~n", [LogEvent]),
    io:format("in filter_discarded_message  Info:~p\t~p\t~p\t~p~n", [Msg, ProcessId, TimeStamp, GroupLeader]),
    case string:find(Msg, "Discarding message") of
        nomatch ->
            io:format("ignore Msg:~p~n", [Msg]),
            ignore;
        _ ->
            io:format("match Msg:~p~n", [Msg]),
            OnMatch
    end.
% 用 logger:error("~p~n", ["error should be logged"]) 抓到的 LogEvent
%in filter_discarded_message  LogEvent:#{meta =>
%                                            #{pid => <0.9.0>,
%                                              time => 1697774217942825,
%                                              gl => <0.70.0>},
%                                        msg =>
%                                            {"~p~n",
%                                             ["error should be logged"]},
%                                        level => error}
%

%
%filter_discarded_message(#{level := error,
%                           meta := #{error_logger := #{emulator := true, tag := error}},
%                           msg := {"~s~n", Msg}}, OnMatch) ->
%
%filter_discarded_message(#{level:= error,
%                           meta := #{error_logger := #{tag := error}},
%                           msg  := {report, #{args := Msg, format := "~s~n"}}}=LogEvent, OnMatch) ->
%    %io:format("in filter_discarded_message  LogEvent:~p~n", [LogEvent]),
%    %io:format("in filter_discarded_message  Msg:~p~n", [Msg]),
%    case string:find(Msg, "Discarding message") of
%        nomatch ->
%            io:format("ignore Msg:~p~n", [Msg]),
%            ignore;
%        _ ->
%            io:format("match Msg:~p~n", [Msg]),
%            OnMatch
%    end.

