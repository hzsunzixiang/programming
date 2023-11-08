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

% 在 locked 状态下调用触发某个事件
locked(EventType, EventContent, Data) ->
    handle_common(EventType, EventContent, Data).

%{state_timeout, Time :: state_timeout(), EventContent :: event_content()}

open(state_timeout, lock,  Data) ->
    do_lock(),
    {next_state, locked, Data};

open(cast, {button,_}, Data) ->
    {next_state, open, Data};
% 在 open 状态下调用触发某个事件
open(EventType, EventContent, Data) ->
    handle_common(EventType, EventContent, Data).


do_lock() ->
    io:format("Lock~n", []).
do_unlock() ->
    io:format("Unlock~n", []).

terminate(_Reason, State, _Data) ->
    State =/= locked andalso do_lock(),
    ok.
%% 这是一个独立调用的接口 调用的时候可能处在 locked 或者 open状态
code_length() ->
    gen_statem:call(?NAME, code_length).

%% EventType     : {call,{<0.86.0>,#Ref<0.830007774.2820407297.157966>}}
%% EventContent  : code_length
%% Data          : #{code=>[a,b,c], length=>3, buttons=>[]}

handle_common({call,From}, code_length, #{code := Code} = Data) -> 
    {keep_state, Data, [{reply,From,length(Code)}]}.


%23:7:06.234778 <0.86.0> code_lock:code_length()
%23:7:06.235180 <0.119.0> code_lock:locked({call,{<0.86.0>,#Ref<0.830007774.2820407297.157966>}}, code_length, #{code=>[a,b,c], length=>3, buttons=>[]})
%23:7:06.235519 <0.119.0> code_lock:handle_common({call,{<0.86.0>,#Ref<0.830007774.2820407297.157966>}}, code_length, #{code=>[a,b,c], length=>3, buttons=>[]})
%23:7:06.235830 <0.119.0> code_lock:handle_common/3 --> {keep_state,#{code => [a,b,c],length => 3,buttons => []},
%            [{reply,{<0.86.0>,#Ref<0.830007774.2820407297.157966>},3}]}
%
%23:7:06.236170 <0.119.0> code_lock:locked/3 --> {keep_state,#{code => [a,b,c],length => 3,buttons => []},
%            [{reply,{<0.86.0>,#Ref<0.830007774.2820407297.157966>},3}]}
%23:7:06.236606 <0.119.0>  '--> gen_statem:loop_state_callback/11
%
%
%
%The return value Reply is generated when a state callback returns with {reply,From,Reply} as one action(), 
%and that Reply becomes the return value of this function.
%
%23:14:21.339773 <0.86.0> code_lock:code_length()
%23:14:21.340123 <0.119.0> code_lock:open({call,{<0.86.0>,#Ref<0.830007774.2820407297.158061>}}, code_length, #{code=>[a,b,c], length=>3, buttons=>[]})
%23:14:21.340316 <0.119.0> code_lock:handle_common({call,{<0.86.0>,#Ref<0.830007774.2820407297.158061>}}, code_length, #{code=>[a,b,c], length=>3, buttons=>[]})
%23:14:21.340555 <0.119.0> code_lock:handle_common/3 --> {keep_state,#{code => [a,b,c],length => 3,buttons => []},
%            [{reply,{<0.86.0>,#Ref<0.830007774.2820407297.158061>},3}]}
%23:14:21.340719 <0.119.0> code_lock:open/3 --> {keep_state,#{code => [a,b,c],length => 3,buttons => []},
%            [{reply,{<0.86.0>,#Ref<0.830007774.2820407297.158061>},3}]}
%23:14:21.340828 <0.119.0>  '--> gen_statem:loop_state_callback/11
%23:14:21.340899 <0.86.0> code_lock:code_length/0 --> 3
