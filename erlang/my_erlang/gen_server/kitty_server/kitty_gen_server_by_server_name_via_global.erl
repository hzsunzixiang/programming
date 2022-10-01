-module(kitty_gen_server_by_server_name_via_global).
-behaviour(gen_server).

%-export([start_link/0, order_cat/4, return_cat/2, close_shop/1]).
%-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
%         terminate/2, code_change/3]).
-compile(export_all).
-compile(nowarn_export_all).

-record(cat, {name, color=green, description}).

%%% Client API
%%% {via,RegMod,ViaName}
%%%
%%% Register the gen_server process with the registry represented by RegMod. 
%%% The RegMod callback is to export the functions register_name/2, unregister_name/1,
%%%  whereis_name/1, and send/2, which are to behave like the corresponding functions in global. 
%%%  Thus, {via,global,GlobalName} is a valid reference equivalent to {global,GlobalName}.
start_link() ->
    gen_server:start_link({via, global, ?MODULE}, ?MODULE, [], []).

%% Synchronous call : 这里是客户端发送响应到服务端
%%
%% call(ServerRef :: server_ref(), Request :: term()) ->     Reply :: term()
%% Request is any term that is passed as the first argument to Module:handle_call/3.
%%
%% server_ref() =
%%     pid() |
%%     (LocalName :: atom()) |
%%     {Name :: atom(), Node :: atom()} |
%%     {global, GlobalName :: term()} |
%%     {via, RegMod :: module(), ViaName :: term()}

%% 返回值Reply是从 Module:handle_call/3 的返回值来的:  {reply,Reply,NewState}
%% The return value Reply is passed from the return value of Module:handle_call/3.

order_cat(Pid, Name, Color, Description) ->
   gen_server:call(Pid, {order, Name, Color, Description}).

%% This call is asynchronous
return_cat(Pid, Cat = #cat{}) ->
    gen_server:cast(Pid, {return, Cat}).

%% Synchronous call
close_shop(Pid) ->
    gen_server:call(Pid, terminate).

%%% Server functions
init([]) -> {ok, []}. %% no treatment of info here!

%% 这里是服务端收到请求开始处理
%% 第一个参数跟call/2,call/3调用中的Request参数保持一致
%% 返回值传递给 call/2,call/3
%% Request is passed from the same argument provided to call or multi_call.

%% 返回值
%% {reply,Reply,NewState}
%% {reply,Reply,NewState,_}
%% The Reply value is sent back to the client request and there becomes its return value.
%% 
%% The gen_server process continues executing with the possibly updated internal state NewState.
handle_call({order, Name, Color, Description}, _From, Cats) ->
    if Cats =:= [] ->
        {reply, make_cat(Name, Color, Description), Cats};
       Cats =/= [] ->
        {reply, hd(Cats), tl(Cats)}
    end;

handle_call(terminate, _From, Cats) ->
    {stop, normal, ok, Cats}.

handle_cast({return, Cat = #cat{}}, Cats) ->
    {noreply, [Cat|Cats]}.

handle_info(Msg, Cats) ->
    io:format("Unexpected message: ~p~n",[Msg]),
    {noreply, Cats}.

terminate(normal, Cats) ->
    [io:format("~p was set free.~n",[C#cat.name]) || C <- Cats],
    ok.

code_change(_OldVsn, State, _Extra) ->
    %% No change planned. The function is there for the behaviour,
    %% but will not be used. Only a version on the next
    {ok, State}. 

%%% Private functions
make_cat(Name, Col, Desc) ->
    #cat{name=Name, color=Col, description=Desc}.

start() ->
    {ok,Pid} = kitty_gen_server_by_server_name_global:start_link(),
	Pid ! <<"Test handle info">>,
    io:format("global,The Pid:: ~p~n",[Pid]),
	Cat = kitty_gen_server_by_server_name_global:order_cat(Pid, "Cat stevens", white, "not actually a cat"),
	kitty_gen_server_by_server_name_global:order_cat(Pid, "Kitten Mittens",  black, "look at them little paws!"), 
	kitty_gen_server_by_server_name_global:order_cat(Pid, "Kitten Mittens", black, "look at them little paws!"), 
	kitty_gen_server_by_server_name_global:return_cat(Pid,Cat),
	kitty_gen_server_by_server_name_global:close_shop(Pid),
    'this is an end'.
