%%%%% Abstracted version
-module(kitty_server2).

-behavior(my_server).

-compile(export_all).
-compile(nowarn_export_all).

-record(cat, {name, color=green, description}).

%%% Client API
start_link() -> my_server:start_link(?MODULE, [], [trace,log,statistics]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  这里是客户端的调用
%% Synchronous call
order_cat(ServerPid, Name, Color, Description) ->
    my_server:call(ServerPid, {order, Name, Color, Description}).

%% This call is asynchronous
return_cat(ServerPid, Cat = #cat{}) ->
    my_server:cast(ServerPid, {return, Cat}).

%% Synchronous call
close_shop(ServerPid) ->
    my_server:call(ServerPid, terminate).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Server functions 这里是服务端的调用 Cats的初始化集合
init([]) -> []. %% no treatment of info here!


% 这里的init必须跟 behavior中的一致， 不然一致报错:
%     exception error: undefined function kitty_server2:init/4
%init([]) -> [make_cat(orgin, white, "origin loves to burn bridges")]. %% no treatment of info here!

%% 这里的From 其实就是客户端
handle_call({order, Name, Color, Description}, From, Cats) ->
    if Cats =:= [] ->
		{reply, make_cat(Name, Color, Description), Cats};
       Cats =/= [] ->
	    {reply, hd(Cats), tl(Cats)}
    end;

handle_call(terminate, _From, Cats) ->
    {stop, normal, ok, Cats}.

handle_cast({return, Cat = #cat{}}, Cats) ->
    {noreply, [Cat|Cats]}.

stop(ServerPid) -> 
    my_server:stop(ServerPid),
	ok.

%%% Private functions
make_cat(Name, Col, Desc) ->
    #cat{name=Name, color=Col, description=Desc}.

terminate(normal, Cats) ->
    [io:format("here, terminate. ~p was set free.~n",[C#cat.name]) || C <- Cats],
    ok.


start() ->
    {ok, ServerPid} = kitty_server2:start_link(),
    io:format("ServerPid: ~p~n",[ServerPid]),
    Cat1 = kitty_server2:order_cat(ServerPid, carl_1, brown, "loves to burn bridges"),
    Cat2 = kitty_server2:order_cat(ServerPid, carl_2, brown, "loves to burn bridges"),
    Cat3 = kitty_server2:order_cat(ServerPid, carl_3, brown, "loves to burn bridges"),
    Cat4 = kitty_server2:order_cat(ServerPid, carl_4, brown, "loves to burn bridges"),
    Cat5 = kitty_server2:order_cat(ServerPid, carl_5, brown, "loves to burn bridges"),
    kitty_server2:return_cat(ServerPid, Cat1),
    kitty_server2:return_cat(ServerPid, Cat2),
    kitty_server2:return_cat(ServerPid, Cat3),
    kitty_server2:return_cat(ServerPid, Cat4),
    Cat6 = kitty_server2:order_cat(ServerPid, jimmy, orange,"cuddly"),
    io:format("Cat6: ~p~n",[Cat6]),
    %kitty_server2:return_cat(Pid, Cat1),
    %kitty_server2:close_shop(ServerPid),
    kitty_server2:stop(ServerPid),
    %Cat7 = kitty_server2:order_cat(ServerPid, carl_7, brown, "loves to burn bridges"),
    %kitty_server2:close_shop(Pid),
    'this is an end'.
