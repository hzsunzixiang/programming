-module(kitty_gen_server).
-behaviour(gen_server).

%-export([start_link/0, order_cat/4, return_cat/2, close_shop/1]).
%-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
%         terminate/2, code_change/3]).
-compile(export_all).
-compile(nowarn_export_all).

-record(cat, {name, color=green, description}).

%%% Client API
start_link() ->
    gen_server:start_link(?MODULE, [], []).

%% Synchronous call
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

handle_call({order, Name, Color, Description}, _From, Cats) ->
    if Cats =:= [] ->
        {reply, make_cat(Name, Color, Description), Cats};
       Cats =/= [] ->
        {reply, hd(Cats), tl(Cats)}
    end;

handle_call(terminate, _From, Cats) ->
    {stop, normal, ok, Cats}.

% 之所以会调用 terminate 函数，原因在于这里的返回值
% https://www.erlang.org/doc/man/gen_server.html#Module:handle_call-3
%{stop,Reason,NewState}
%{stop,Reason,Reply,NewState}
%The gen_server process will call Module:terminate(Reason,NewState) and then terminate.
%
%{stop,_,Reply,_} will create a reply to the client request just as {reply,Reply,...} while {stop,_,_} will not, so just as for {noreply,NewState,...} a reply has to be created by calling reply(From, Reply) before returning {stop,_,_}.
%
%
handle_cast({return, Cat = #cat{}}, Cats) ->
    {noreply, [Cat|Cats]}.

handle_info(Msg, Cats) ->
    io:format("Unexpected message: ~p~n",[Msg]),
    {noreply, Cats}.

terminate(normal, Cats) ->
    [io:format("here, terminate. ~p was set free.~n",[C#cat.name]) || C <- Cats],
    ok.

code_change(_OldVsn, State, _Extra) ->
    %% No change planned. The function is there for the behaviour,
    %% but will not be used. Only a version on the next
    {ok, State}. 

%%% Private functions
make_cat(Name, Col, Desc) ->
    #cat{name=Name, color=Col, description=Desc}.

start() ->
    {ok,Pid}=kitty_gen_server:start_link(),
	Pid ! <<"Test handle info">>,
	Cat =kitty_gen_server:order_cat(Pid, "Cat stevens", white, "not actually a cat"),
	kitty_gen_server:order_cat(Pid, "Kitten Mittens",  black, "look at them little paws!"), 
	kitty_gen_server:order_cat(Pid, "Kitten Mittens", black, "look at them little paws!"), 
	kitty_gen_server:return_cat(Pid,Cat),
	kitty_gen_server:close_shop(Pid),
    'this is an end'.
