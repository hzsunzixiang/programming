-module(gen_happy).
-export([behaviour_info/1]).

 behaviour_info(callbacks) ->
     [{get_happy, 0}, {get_ecstatic, 0}];
 behaviour_info(_) ->
     undefined.

% 这种方式能运行，但是dialyzer检测报错
% callback的方式比behaviour_info 更新
% ericksun@centos7-dev:~/programming/erlang/my_erlang/custom_behavior/callback4 (master)$ dialyzer *.erl
%   Checking whether the PLT /home/ericksun/.cache/erlang/.dialyzer_plt is up-to-date... yes
%   Proceeding with analysis...
% my_module.erl:2:2: Callback info about the gen_happy behaviour is not available
%  done in 0m0.22s
% done (warnings were emitted)

% 
% -callback init_request() -> {'ok', Reply :: term()}.
% -callback get_request(Data :: term(), LoopData :: term()) -> {'ok', Reply :: term()} | 
% 							     {'stop', Reason :: atom(), LoopData :: term()}.
% -callback stop_request(Reason :: term(), LoopData :: term()) -> term().
% 


% 限制是生效，  但是通过dialyzer能检测出来
% -callback get_happy() -> {'ok', Reply :: term(), 'stop'}.
% -callback get_ecstatic() -> Reply :: term(). 

