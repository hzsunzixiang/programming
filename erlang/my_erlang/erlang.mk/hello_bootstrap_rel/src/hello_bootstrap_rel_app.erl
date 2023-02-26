-module(hello_bootstrap_rel_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	hello_bootstrap_rel_sup:start_link().

stop(_State) ->
	ok.
