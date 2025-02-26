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
            %{next_state, open, Data#{buttons := []}, [{state_timeout,10000,lock}]}; % Time in milliseconds
            %{{timeout, Name}, Time, EventContent}
            %{{timeout, Name}, Time, EventContent, Opts}
            %{{timeout, Name}, update, EventContent}
            %{next_state, open, Data#{buttons := []}, [{{timeout,open},10000,lock}]}; % Time in milliseconds
            Tref = erlang:start_timer(10000, self(), lock), % Time in milliseconds
            {next_state, open, Data#{buttons := [], timer => Tref}};
	    true -> % Incomplete | Incorrect
            {next_state, locked, Data#{buttons := NewButtons}}
    end.

%[{state_timeout,10000,lock}] % Time in milliseconds
% lock 为 EventContent
%{state_timeout, Time :: state_timeout(), EventContent :: event_content()}

% Module:StateName(EventType, EventContent, Data) -> StateFunctionResult

%open(state_timeout, lock,  Data) ->
%    do_lock(),
%    {next_state, locked, Data};

% 2:51:27.039387 <0.119.0> code_lock:open({timeout,open}, lock, #{code=>[a,b,c], length=>3, buttons=>[]})
%open({timeout,open}, lock, Data) ->
%    do_lock(),
%    {next_state,locked,Data};

%2:58:02.934438 <0.119.0> code_lock:open(info, {timeout,#Ref<0.3791089385.2319450113.9732>,lock}, #{code=>[a,b,c], length=>3, timer=>#Ref<0.3791089385.2319450113.9732>, buttons=>[]})

open(info, {timeout,Tref,lock}, #{timer := Tref} = Data) ->
    do_lock(),
    {next_state,locked,maps:remove(timer, Data)};
open(cast, {button,_}, Data) ->
    {next_state, open, Data}.

do_lock() ->
    io:format("Lock~n", []).
do_unlock() ->
    io:format("Unlock~n", []).

terminate(_Reason, State, _Data) ->
    State =/= locked andalso do_lock(),
    ok.
