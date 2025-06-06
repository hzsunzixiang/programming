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
    do_lock(),
    Data = #{code => Code, length => length(Code), buttons => []},
    {ok, locked, Data}.

%% state_functions  : each state has got its own handler function:
callback_mode() ->
    state_functions.

% It is ordered by the transition action {timeout,Time,EventContent}, or just an integer Time, 
% even without the enclosing actions list (the latter is a form inherited from gen_fsm.
% 2:41:51.553172 <0.119.0> code_lock:locked(timeout, 20000, #{code=>[a,b,c], length=>3, buttons=>[a,b]})
locked(timeout, _, Data) ->
    {next_state, locked, Data#{buttons := []}};
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
	        do_unlock(),
            {next_state, open, Data#{buttons := []}, [{state_timeout,10000,lock}]}; % Time in milliseconds
	    true -> % Incomplete | Incorrect
                {next_state, locked, Data#{buttons := NewButtons}, 20000} % Time in milliseconds
    end.
% {next_state,NextState,NewData,Time}
%A time-out feature inherited from gen_statem's predecessor gen_fsm, is an event time-out, 
%that is, if an event arrives the timer is cancelled. You get either an event or a time-out, but not both

%[{state_timeout,10000,lock}] % Time in milliseconds
% lock 为 EventContent
%{state_timeout, Time :: state_timeout(), EventContent :: event_content()}

% Module:StateName(EventType, EventContent, Data) -> StateFunctionResult

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
