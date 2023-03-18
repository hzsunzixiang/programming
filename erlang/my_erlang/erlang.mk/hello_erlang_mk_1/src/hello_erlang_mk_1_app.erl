-module(hello_erlang_mk_1_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	hello_erlang_mk_1_sup:start_link().

stop(_State) ->
	ok.
