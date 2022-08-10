-module(earth).
%-export([start/0, init/0]).
-compile(export_all).
-compile(nowarn_export_all).

start_link() ->
    {ok, spawn_link(?MODULE, init, [])}.

init() ->
    register(?MODULE, self()),
    create_earth(),
    day().

day() ->
    io:format("in day\n"),
    receive
	eclipse -> day();
	sunset  -> night()
    end.

night() ->
    io:format("in night\n"),
    receive
	sunrise ->
	    make_roosters_crow(),
	    day()
    end.

create_earth() -> ok.
make_roosters_crow() -> ok.

to_night() -> ?MODULE ! sunset.
to_day() -> ?MODULE ! sunrise.
to_eclipse() -> ?MODULE ! eclipse.

start() ->
    {ok,Pid} = earth:start_link(),
    io:format("local,The Pid:: ~p~n",[Pid]),
	to_night(),
	to_day(),
	to_eclipse(),
    'this is an end'.
