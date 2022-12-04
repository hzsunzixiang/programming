-module(code_lock).
-behaviour(gen_statem).
-define(NAME, code_lock).

-export([start_link/1]).
-export([button/1,code_length/0]).
-export([init/1,callback_mode/0,terminate/3]).
-export([locked/3,open/3]).

start_link(Code) ->
    gen_statem:start_link({local,?NAME}, ?MODULE, Code, []).

button(Button) ->
    gen_statem:cast(?NAME, {button,Button}).

init(Code) ->
    do_lock(),
    Data = #{code => Code, length => length(Code), buttons => []},
    {ok, locked, Data}.

callback_mode() ->
    state_functions.

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
            {next_state, locked, Data#{buttons := NewButtons}}
    end;
locked(EventType, EventContent, Data) ->
    handle_common(EventType, EventContent, Data).

%{state_timeout, Time :: state_timeout(), EventContent :: event_content()}

open(state_timeout, lock,  Data) ->
    do_lock(),
    {next_state, locked, Data};

open(cast, {button,_}, Data) ->
    {next_state, open, Data};
open(EventType, EventContent, Data) ->
    handle_common(EventType, EventContent, Data).


do_lock() ->
    io:format("Lock~n", []).
do_unlock() ->
    io:format("Unlock~n", []).

terminate(_Reason, State, _Data) ->
    State =/= locked andalso do_lock(),
    ok.

code_length() ->
    gen_statem:call(?NAME, code_length).

handle_common({call,From}, code_length, #{code := Code} = Data) -> {keep_state, Data, [{reply,From,length(Code)}]}.



