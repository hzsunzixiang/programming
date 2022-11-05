%% ---
%%  Excerpted from "Programming Erlang, Second Edition",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/jaerlang2 for more book information.
%%---
-module(example1).
-export([start/0, stop/0]).
-export([twice/1, sum/2]).

-define(APPNAME, example1).

start() ->
    register(example1, 
	     spawn(fun() ->
		     process_flag(trap_exit, true),
             Port = create_port(),
		     loop(Port)

		   end)).


stop() ->
    ?MODULE ! stop.

create_port() ->
    case code:priv_dir(?APPNAME) of
        {error, _} ->
            error_logger:format("~w priv dir not found~n", [?APPNAME]),
            exit(error);
        PrivDir ->
            open_port({spawn, filename:join([PrivDir, "example1"])},
                      [{packet, 2}, exit_status])
		    %Port = open_port({spawn, "./example1"}, [{packet, 2}]),
    end.

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
	
encode({sum, X, Y}) -> [1, X, Y];
encode({twice, X})  -> [2, X].

decode([Int]) -> Int.
