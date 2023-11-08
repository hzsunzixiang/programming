-module(code_lock).
-behaviour(gen_statem).
-define(NAME, code_lock).

-export([start_link/1]).
-export([button/1]).
-export([init/1,callback_mode/0,terminate/3]).
-export([locked/3,open/3]).

start_link(Code) ->
    gen_statem:start_link({local,?NAME}, ?MODULE, Code, []).

button(Button) ->
    gen_statem:cast(?NAME, {button,Button}).

% do_lock() and Clear Buttons
init(Code) ->
    process_flag(trap_exit, true),
    Data = #{code => Code, length => length(Code)},
    {ok, locked, Data}.

callback_mode() ->
    [state_functions,state_enter].

locked(enter, _OldState, Data) ->
    do_lock(),
    {keep_state,Data#{buttons => []}};
locked(cast, {button,Button}, #{code := Code, length := Length, buttons := Buttons} = Data) ->
    NewButtons =
        if
            length(Buttons) < Length ->
                Buttons;
            true ->
                tl(Buttons)
        end ++ [Button],
    if
        NewButtons =:= Code -> % Correct
            {next_state, open, Data};
	        %do_unlock(),
            %{next_state, open, Data#{buttons := []}, [{state_timeout,10000,lock}]}; % Time in milliseconds
	    true -> % Incomplete | Incorrect
            {next_state, locked, Data#{buttons := NewButtons}}
    end.

%[{state_timeout,10000,lock}] % Time in milliseconds
% lock 为 EventContent
%{state_timeout, Time :: state_timeout(), EventContent :: event_content()}

% Module:StateName(EventType, EventContent, Data) -> StateFunctionResult


open(enter, _OldState, _Data) ->
    do_unlock(),
    {keep_state_and_data, [{state_timeout,10000,lock}]}; % Time in milliseconds

open(state_timeout, lock,  Data) ->
    do_lock(),
    {next_state, locked, Data};

open(cast, {button,_}, Data) ->
    {next_state, open, Data}.

do_lock() ->
    io:format("Lock~n", []).
do_unlock() ->
    io:format("Unlock~n", []).

terminate(_Reason, State, _Data) ->
    State =/= locked andalso do_lock(),
    ok.
%You can repeat the state enter code by returning one of {repeat_state, ...}, {repeat_state_and_data,_} or repeat_state_and_data that otherwise behaves exactly like their keep_state siblings. See the type state_callback_result() in the reference manual.



