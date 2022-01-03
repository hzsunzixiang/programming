-module(records_5).
-compile(export_all).
-compile(nowarn_export_all).
-include("records.hrl").


%%  -record(included, {some_field,
%%                     some_default = "yeah!",
%%                     unimaginative_name}).
included() -> #included{some_field="Some value"}.

start() ->
	X = included(),
    io:format("the X data= ~p~n",[X]).


%% 预编译之后
%% -file("records_5.erl", 1).
%% 
%% -module(records_5).
%% 
%% -compile(export_all).
%% 
%% -compile(nowarn_export_all).
%% 
%% -file("records.hrl", 1).
%% 
%% -record(included,{some_field,
%%                   some_default = "yeah!",
%%                   unimaginative_name}).
%% 
%% -file("records_5.erl", 4).
%% 
%% included() ->
%%     {included, "Some value", "yeah!", undefined}.
%% 
%% start() ->
%%     X = included(),
%%     io:format("the X data= ~p~n", [X]).

