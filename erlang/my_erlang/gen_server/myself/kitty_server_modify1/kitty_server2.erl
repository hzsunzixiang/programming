%%%%% Abstracted version
-module(kitty_server2).
-compile(export_all).
-compile(nowarn_export_all).

-record(cat, {name, color=green, description}).

%%% Client API
start_link() -> my_server:start_link(?MODULE, []).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  这里是客户端的调用
%% Synchronous call
order_cat(ServerPid, Name, Color, Description) ->
    my_server:call(ServerPid, {order, Name, Color, Description}).

%% This call is asynchronous
return_cat(Pid, Cat = #cat{}) ->
    my_server:cast(Pid, {return, Cat}).

%% Synchronous call
close_shop(Pid) ->
    my_server:call(Pid, terminate).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Server functions 这里是服务端的调用 Cats的初始化集合
%init([]) -> []. %% no treatment of info here!
init([]) -> [make_cat(orgin, white, "origin loves to burn bridges")]. %% no treatment of info here!

%% 这里的From 其实就是客户端
handle_call({order, Name, Color, Description}, From, Cats) ->
    if Cats =:= [] ->
		{reply, make_cat(Name, Color, Description), Cats};
       Cats =/= [] ->
	    {reply, hd(Cats), tl(Cats)}
    end;

handle_call(terminate, From, Cats) ->
    my_server:reply(From, ok),
    terminate(Cats).

handle_cast({return, Cat = #cat{}}, Cats) ->
    {noreply, [Cat|Cats]}.

%%% Private functions
make_cat(Name, Col, Desc) ->
    #cat{name=Name, color=Col, description=Desc}.

terminate(Cats) ->
    [io:format("~p was set free.~n",[C#cat.name]) || C <- Cats],
    exit(normal).



start() ->
    ServerPid = kitty_server2:start_link(),
    io:format("ServerPid: ~p~n",[ServerPid]),
    Cat1 = kitty_server2:order_cat(ServerPid, carl, brown, "loves to burn bridges"),
    Cat2 = kitty_server2:order_cat(ServerPid, carl, brown, "loves to burn bridges"),
    Cat3 = kitty_server2:order_cat(ServerPid, carl, brown, "loves to burn bridges"),
    Cat4 = kitty_server2:order_cat(ServerPid, carl, brown, "loves to burn bridges"),
    Cat5 = kitty_server2:order_cat(ServerPid, carl, brown, "loves to burn bridges"),
    %kitty_server2:return_cat(Pid, Cat1),
    %kitty_server2:order_cat(Pid, jimmy, orange,"cuddly"),
    %kitty_server2:return_cat(Pid, Cat1),
    %kitty_server2:close_shop(Pid),
    %kitty_server2:close_shop(Pid),
    'this is an end'.
