-module(hello_release_apps_dir_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	hello_release_apps_dir_sup:start_link().

stop(_State) ->
	ok.
