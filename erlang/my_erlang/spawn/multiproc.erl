-module(multiproc).
-compile([export_all]).
-compile(nowarn_export_all).

sleep(T) ->
    receive
    after T -> ok
    end.

flush() ->
    receive
        _ -> flush()
    after 0 ->
        ok
    end.

important() ->
    receive
        {Priority, Message} when Priority > 10 ->
            [Message | important()]
    after 0 ->
        normal()
    end.

normal() ->
    receive
        {_, Message} ->
            [Message | normal()]
    after 0 ->
        []
    end.

%% optimized in R14A
optimized(Pid) ->
    Ref = make_ref(),
    Pid ! {self(), Ref, hello},
    receive
        {Pid, Ref, Msg} ->
            io:format("~p~n", [Msg])
    end.

start() ->
   self() ! {15, high },
   self() ! {7, low},
   self() ! {1, low},
   self() ! {17, high },
   self() ! {19, high },
   Msg=important(),
   io:format(" receive:~p, ~n", [Msg]),
   'this is an end'.



