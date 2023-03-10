-module(my_report_handler).

%%%
%%% A handler that can be connected to the error_logger
%%% event handler.
%%% Writes all sasl_* events formatted to stdout.
%%%

-export([init/1,
	 handle_event/2, handle_call/2, handle_info/2,
	 terminate/2]).

init(Type) ->
% should link to user (or group_leader???)
    {ok, Type}.
    
handle_event({Type, GL, _Msg}, Type) when node(GL) /= node() ->
    {ok, Type};
handle_event(Event, Type) ->
    %_ = sasl_report:write_report(standard_io, Type, tag_event(Event)),
	io:format("Event:~p, Type:~p~n", [Event, Type]),
    {ok, Type}.

handle_info(_, Type) -> {ok, Type}.

handle_call(_Query, _Type) -> {error, bad_query}.

terminate(_Reason, _Type) ->
    [].

%%tag_event(Event) ->    
%%    {calendar:local_time(), Event}.

%% ericksun@centos7-mq1:~/programming/erlang/my_erlang/gen_event/error_logger (master)$ erl -boot start_sasl
%% Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]
%% 
%% Eshell V13.0.4  (abort with ^G)
%% 1> error_logger:add_report_handler(my_report_handler).
%% ok
%% 2> observer:start().
%% ok
%% 3> error_logger:error_report("Serious error in my module").
%% Event:{error_report,<0.66.0>,
%%                     {<0.89.0>,std_error,"Serious error in my module"}}, Type:[]
%% =ERROR REPORT==== 10-Mar-2023::04:54:47.020929 ===
%% Serious error in my module
%% ok


