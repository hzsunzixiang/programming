%%%%% Naive version
-module(kitty_server).
-compile(export_all).
-compile(nowarn_export_all).

%-export([start_link/0, order_cat/4, return_cat/2, close_shop/1]).

-record(cat, {name, color=green, description}).

%%% Client API
start_link() -> spawn_link(fun init/0).

%% Synchronous call
order_cat(Pid, Name, Color, Description) ->
    Ref = erlang:monitor(process, Pid),
    Pid ! {self(), Ref, {order, Name, Color, Description}},
    receive
        {Ref, Cat = #cat{}} ->
            erlang:demonitor(Ref, [flush]),
            Cat;
        {'DOWN', Ref, process, Pid, Reason} ->
            erlang:error(Reason)
    after 5000 ->
        erlang:error(timeout)
    end.

%% This call is asynchronous
return_cat(Pid, Cat = #cat{}) ->
    Pid ! {return, Cat},
    ok.

%% Synchronous call
close_shop(Pid) ->
    Ref = erlang:monitor(process, Pid),
    Pid ! {self(), Ref, terminate},
    receive
        {Ref, ok} ->
            erlang:demonitor(Ref, [flush]),
            ok;
        {'DOWN', Ref, process, Pid, Reason} ->
            erlang:error(Reason)
    after 5000 ->
        erlang:error(timeout)
    end.
    
%%% Server functions
init() -> loop([]).

loop(Cats) ->
    receive
        {Pid, Ref, {order, Name, Color, Description}} ->
            if Cats =:= [] ->
                Pid ! {Ref, make_cat(Name, Color, Description)},
                loop(Cats); 
               Cats =/= [] -> % got to empty the stock
                Pid ! {Ref, hd(Cats)},
                loop(tl(Cats))
            end;
        {return, Cat = #cat{}} ->
            loop([Cat|Cats]);
        {Pid, Ref, terminate} ->
            Pid ! {Ref, ok},
            terminate(Cats);
        Unknown ->
            %% do some logging here too
            io:format("Unknown message: ~p~n", [Unknown]),
            loop(Cats)
    end.

%%% Private functions
make_cat(Name, Col, Desc) ->
    #cat{name=Name, color=Col, description=Desc}.

terminate(Cats) ->
    [io:format("~p was set free.~n",[C#cat.name]) || C <- Cats],
    ok.

start() ->
    Pid = kitty_server:start_link(),
    Cat1 = kitty_server:order_cat(Pid, carl, brown, "loves to burn bridges"),
    kitty_server:return_cat(Pid, Cat1),
    kitty_server:order_cat(Pid, jimmy, orange,"cuddly"),
    kitty_server:order_cat(Pid, jimmy, orange,"cuddly"),
    kitty_server:return_cat(Pid, Cat1),
    kitty_server:close_shop(Pid),
    %kitty_server:close_shop(Pid),
    'this is an end'.
% Eshell V12.2  (abort with ^G)
% 1> Pid = kitty_server:start_link().
% <0.82.0>
% 2> Cat1 = kitty_server:order_cat(Pid, carl, brown, "loves to burn bridges").
% {cat,carl,brown,"loves to burn bridges"}
% 3> kitty_server:return_cat(Pid, Cat1).
% ok
% 4> kitty_server:order_cat(Pid, jimmy, orange,"cuddly").
% {cat,carl,brown,"loves to burn bridges"}
% 5> kitty_server:order_cat(Pid, jimmy, orange,"cuddly").
% {cat,jimmy,orange,"cuddly"}
% 6> kitty_server:return_cat(Pid, Cat1).
% ok
% 7> kitty_server:close_shop(Pid).
% carl was set free.
% ok
% 
% Pid = kitty_server:start_link().
% Cat1 = kitty_server:order_cat(Pid, carl, brown, "loves to burn bridges").
% kitty_server:return_cat(Pid, Cat1).
% kitty_server:order_cat(Pid, jimmy, orange,"cuddly").
% kitty_server:order_cat(Pid, jimmy, orange,"cuddly").
% kitty_server:return_cat(Pid, Cat1).
% kitty_server:close_shop(Pid).
