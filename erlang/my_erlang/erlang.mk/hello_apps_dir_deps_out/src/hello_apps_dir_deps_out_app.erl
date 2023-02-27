-module(hello_apps_dir_deps_out_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	hello_apps_dir_deps_out_sup:start_link().

stop(_State) ->
	ok.
