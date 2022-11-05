%% ---
%%  Excerpted from "Programming Erlang, Second Edition",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/jaerlang2 for more book information.
%%---
-module(example1_lid).
-export([start/0, stop/0]).
-export([twice/1, sum/2]).
-define(APPNAME, example1_drv).


start() ->
    start("example1_drv").

start(SharedLib) ->
    register(example1_drv, spawn(fun() -> init(SharedLib) end)).

create_port(SharedLib) ->
    case code:priv_dir(SharedLib) of
        {error, _} ->
            error_logger:format("~w priv dir not found~n", [SharedLib]),
            exit(error);
        PrivDir ->
            case erl_ddll:load(PrivDir, SharedLib) of
                ok -> ok;
                Other -> exit(Other)
            end,
            open_port({spawn, SharedLib}, [])
    end.

init(SharedLib) ->
    %Port = open_port({spawn, SharedLib}, []),
    Port = create_port(SharedLib),
    loop(Port).

stop() ->
%%  ...
%%  From here on the code is identical to that in
%%  example1.erl 
%%  ...
    ?MODULE ! stop.

twice(X) -> call_port({twice, X}).
sum(X,Y) -> call_port({sum, X, Y}).

call_port(Msg) ->
    ?MODULE ! {call, self(), Msg},
    receive
	{?MODULE, Result} ->
	    Result
    end.

loop(Port) ->
    receive
	{call, Caller, Msg} ->
	    Port ! {self(), {command, encode(Msg)}},
	    receive
		{Port, {data, Data}} ->
		    Caller ! {?MODULE, decode(Data)}
	    end,
	    loop(Port);
	stop ->
	    Port ! {self(), close},
	    receive
		{Port, closed} ->
		    exit(normal)
	    end;
	{'EXIT', Port, Reason} ->
	    exit({port_terminated, Reason})
    end.

encode({twice, X})  -> [1, X];
encode({sum, X, Y}) -> [2, X, Y].

decode([Int]) -> Int.
