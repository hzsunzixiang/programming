-module(code_lock).
-behaviour(gen_statem).
-define(NAME, code_lock).

-export([start_link/1]).
-export([button/1,code_length/0]).
-export([init/1,callback_mode/0,terminate/3]).
-export([handle_event/4]).

start_link(Code) ->
    gen_statem:start_link({local,?NAME}, ?MODULE, Code, []).

button(Button) ->
    gen_statem:cast(?NAME, {button,Button}).

init(Code) ->
    do_lock(),
    Data = #{code => Code, length => length(Code), buttons => []},
    {ok, locked, Data}.

% If callback mode handle_event_function is used, all events are handled in Module:handle_event/4 
% and we can (but do not have to) use an event-centered approach where we first branch depending on event and then depending on state:
callback_mode() ->
    handle_event_function.


%{state_timeout, Time :: state_timeout(), EventContent :: event_content()}

do_lock() ->
    io:format("Lock~n", []).
do_unlock() ->
    io:format("Unlock~n", []).

terminate(_Reason, State, _Data) ->
    State =/= locked andalso do_lock(),
    ok.

code_length() ->
    gen_statem:call(?NAME, code_length).

%%% 
%%% 先 event 匹配 ，再state 匹配
handle_event(cast, {button,Button}, State, #{code := Code} = Data) ->
    case State of
	locked ->
            #{length := Length, buttons := Buttons} = Data,
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
                    {keep_state, Data#{buttons := NewButtons}}
            end;
	open ->
            keep_state_and_data
    end;
handle_event(state_timeout, lock, open, Data) ->
    do_lock(),
    {next_state, locked, Data};
handle_event({call,From}, code_length, _State, #{code := Code} = Data) ->
    {keep_state, Data, [{reply,From,length(Code)}]}.

%4:21:09.899306 <0.178.0> code_lock:handle_event(state_timeout, lock, open, #{buttons=>[], code=>[a,b,c], length=>3})


