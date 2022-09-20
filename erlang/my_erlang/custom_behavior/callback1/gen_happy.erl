-module(gen_happy).
%-export([behaviour_info/1]).

% behaviour_info(callbacks) ->
%     [{get_happy, 0}, {get_ecstatic, 0}];
% behaviour_info(_) ->
%     undefined.
% 
% -callback init_request() -> {'ok', Reply :: term()}.
% -callback get_request(Data :: term(), LoopData :: term()) -> {'ok', Reply :: term()} | 
% 							     {'stop', Reason :: atom(), LoopData :: term()}.
% -callback stop_request(Reason :: term(), LoopData :: term()) -> term().
% 


% 好像限制不生效， stackoverflow上提个问题
%-callback get_happy() ->  Reply :: term().
%-callback get_happy() -> {'ok', Reply :: term(), 'stop'}.
-callback get_happy() -> {'ok'}.
-callback get_ecstatic() -> Reply :: term(). 

