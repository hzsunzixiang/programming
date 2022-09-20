-module(my_behavior).
-export([behaviour_info/1, function_in_behavior/0]).

%The callback functions of the module can be specified either directly by the exported function behaviour_info/1:
%
%behaviour_info(callbacks) -> Callbacks.
%or by a -callback attribute for each callback function:
%
%-callback Name(Arguments) -> Result.


% behaviour_info 和 callback 是互斥的
% -callback fn(A :: term()) -> B :: term().

behaviour_info(callbacks) ->
    [{fn, 1}, {bar, 1}, {baz, 2}];
behaviour_info(_) ->
    undefined.

% 实际的情况是类似 gen_server 一样通过init初始化来获取module信息的，而不是这里的直接获取
function_in_behavior() ->
   my_callbacks:fn(1).



%-callback init(term()) -> {ok, term()} | {stop, term()}.

%-callback init(Args :: term()) -> {ok, State :: term()} | {stop, Reason :: term()}.

%-callback init(init_arg()) -> {ok, callback_state()} | {error, reason()}.
%
%https://medium.com/erlang-battleground/erlang-behaviors-d5bb30d5412b
