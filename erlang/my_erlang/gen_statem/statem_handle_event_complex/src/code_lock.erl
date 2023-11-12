-module(code_lock).
-behaviour(gen_statem).
-define(NAME, code_lock_3).

-export([start_link/2,stop/0]).
-export([button/1,set_lock_button/1]).
-export([init/1,callback_mode/0,terminate/3]).
-export([handle_event/4]).

% 如果先执行 code_lock:button(y). 则没响应，会延迟到 set_lock_button 之后执行
%  6> code_lock:button(y).
%  ok
%  7> code_lock:set_lock_button(y).
%  Open   %%% 这里有状态变化,触发了enter分支
%  x
%  Locked  % 这里是 code_lock:button(y). 触发的。。。


start_link(Code, LockButton) ->
    gen_statem:start_link( {local,?NAME}, ?MODULE, {Code,LockButton}, []).

stop() ->
    gen_statem:stop(?NAME).

button(Button) ->
    gen_statem:cast(?NAME, {button,Button}).

set_lock_button(LockButton) ->
    gen_statem:call(?NAME, {set_lock_button,LockButton}).

init({Code,LockButton}) ->
    process_flag(trap_exit, true),
    Data = #{code => Code, length => length(Code), buttons => []},
    {ok, {locked,LockButton}, Data}.

callback_mode() ->
    [handle_event_function,state_enter].

%% State: locked
handle_event(enter, _OldState, {locked,_}, Data) ->
    do_lock(),
    {keep_state, Data#{buttons := []}};
handle_event(state_timeout, button, {locked,_}, Data) ->
    {keep_state, Data#{buttons := []}};
%% 在 {locked,LockButton} 状态下收到  {button,Button} 表示在按解锁按钮
handle_event(cast, {button,Button}, {locked,LockButton}, #{code := Code, length := Length, buttons := Buttons} = Data) ->
    NewButtons =
        if
            length(Buttons) < Length ->
                Buttons;
            true ->
                tl(Buttons)
        end ++ [Button],
    if
        NewButtons =:= Code -> % Correct
            {next_state, {open,LockButton}, Data};
	true -> % Incomplete | Incorrect
            {keep_state, Data#{buttons := NewButtons},
             [{state_timeout,30000,button}]} % Time in milliseconds
    end;
%%
%% State: open
handle_event(enter, _OldState, {open,_}, _Data) ->
    do_unlock(),
    {keep_state_and_data, [{state_timeout,10000,lock}]}; % Time in milliseconds
%%超时只有在 {open,LockButton} 这个状态下才会触发。 locked,LockButton} 会被{button,LockButton} 触发， 于是就取消了超时
handle_event(state_timeout, lock, {open,LockButton}, Data) ->
    {next_state, {locked,LockButton}, Data};
%6:22:31.929709 <0.162.0> code_lock:handle_event(cast, {button,x}, {open,x}, #{buttons=>[a,b], code=>[a,b,c], length=>3})
%% 这里是精髓， 直接匹配 LockButton , 
%%  如果在 {open,LockButton} 状态下，收到 {button,LockButton}
%%  在lock状态下收到没有用, 只能在  {open,LockButton} 状态下生效
%%  只有在{open,LockButton} 状态下，{button,LockButton} 表示要进行锁住了
handle_event(cast, {button,LockButton}, {open,LockButton}, Data) ->
    {next_state, {locked,LockButton}, Data};
handle_event(cast, {button,_}, {open,_}, _Data) ->
    {keep_state_and_data,[postpone]};
%%
%% Common events
%% 重新设置新的LockButton, 返回 OldLockButton
%% 在 lock 或者open状态下都可以 执行 set  
%% 此时状态相当于 {StateName,LockButton}
handle_event({call,From}, {set_lock_button,NewLockButton}, {StateName,OldLockButton}, Data) ->
    {next_state, {StateName,NewLockButton}, Data, [{reply,From,OldLockButton}]}.

do_lock() ->
    io:format("Locked~n", []).
do_unlock() ->
    io:format("Open~n", []).

terminate(_Reason, State, _Data) ->
    State =/= locked andalso do_lock(),
    ok.
