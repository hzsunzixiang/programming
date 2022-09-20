-module(my_abstract).
-export([start/0, start/1]).

start(CallbackMod)->                
    spawn(fun() -> loop(CallbackMod) end).

loop(CBM) ->
    receive
        {Sender, {do_it, A}} ->
            Sender ! CBM:fn(A),
            loop(CBM);
        stop ->
            io:format("~p (~p): Farewell!~n",
                      [self(), ?MODULE]);
        Message ->
            io:format("~p (~p): Received silliness: ~tp~n",
                      [self(), ?MODULE, Message]),
            loop(CBM)
    end.

start()->
    Service = my_abstract:start(my_callbacks),
	Service ! {self(), {do_it, 5}},
	Service ! {self(), {do_it, 41}},
	Service ! stop,
    'this is the end'.

