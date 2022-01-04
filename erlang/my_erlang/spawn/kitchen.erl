-module(kitchen).
-compile(export_all).
-compile(nowarn_export_all).

start(FoodList) ->
    spawn(?MODULE, fridge2, [FoodList]).

store(Pid, Food) ->
    Pid ! {self(), {store, Food}},
    receive
        {Pid, Msg} -> Msg,
        io:format("store:~p, receive:~p, ~n", [Food, Msg])
    end.

take(Pid, Food) ->
    Pid ! {self(), {take, Food}},
    receive
        {Pid, Msg} -> Msg,
        io:format("take:~p, receive:~p, ~n", [Food, Msg])
    end.

store2(Pid, Food) ->
    Pid ! {self(), {store, Food}},
    receive
        {Pid, Msg} -> Msg,
        io:format("store2:~p, receive:~p, ~n", [Food, Msg])
    after 3000 ->
        timeout
    end.

take2(Pid, Food) ->
    Pid ! {self(), {take, Food}},
    receive
        {Pid, Msg} -> Msg,
        io:format("take2:~p, receive:~p, ~n", [Food, Msg])
    after 3000 ->
        timeout
    end.

fridge1() ->
    receive
        {From, {store, _Food}} ->
            From ! {self(), ok},
            fridge1();
        {From, {take, _Food}} ->
            %% uh....
            From ! {self(), not_found},
            fridge1();
        terminate ->
            ok
    end.

fridge2(FoodList) ->
    receive
        {From, {store, Food}} ->
            From ! {self(), ok},
            fridge2([Food|FoodList]);
        {From, {take, Food}} ->
            case lists:member(Food, FoodList) of
                true ->
                    From ! {self(), {ok, Food}},
                    fridge2(lists:delete(Food, FoodList));
                false ->
                    From ! {self(), not_found},
                    fridge2(FoodList)
            end;
        terminate ->
            ok
    end.
%接受信息的时候是穿插着来的，接受消息不确定?
receive_from_kitchen() ->
    receive
        Msg ->
            io:format("message from dophine:~p~n", [Msg])
    end,
    receive_from_kitchen().

start() ->
   Pid=start([baking_soda]),
   store(Pid,milk ),
   store(Pid,bacon),
   take(Pid,bacon),
   take(Pid,turkey),
   %take2(pid(0,250,0),turkey),
   %Pid ! {self(), {store, milk}},
   %Pid ! {self(), {store, bacon}},
   %Pid ! {self(), {take, bacon}},
   %Pid ! {self(), {take, turkey}},
   %receive_from_kitchen(),
   'this is an end'.

