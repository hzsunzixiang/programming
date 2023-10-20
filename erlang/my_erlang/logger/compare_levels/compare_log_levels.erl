-include_lib("kernel/include/logger.hrl").

-module(compare_log_levels).
-compile([export_all]).
-compile(nowarn_export_all).


start() ->

%compare_levels(Level1, Level2) -> eq | gt | lt
%Level1 = Level2 = level() | all | none
%Compare the severity of two log levels. Returns gt if Level1 is more severe than Level2, lt if Level1 is less severe, and eq if the levels are equal.
%
%level() =
%    emergency | alert | critical | error | warning | notice |
%    info | debug
%% 大小顺序为: none | emergency | alert | critical | error | warning | notice | info | debug | all

%The severity level for the message to be logged.
    io:format("compare_levels(none, emergency):~p~n", [logger:compare_levels(none, emergency)]),
    io:format("compare_levels(emergency, alert):~p~n", [logger:compare_levels(emergency, alert)]),
    io:format("compare_levels(debug, all):~p~n", [logger:compare_levels(debug, all)]),

    'this is an end'.

