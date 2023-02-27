-module(hello_apps_dir_deps_out_release_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	hello_apps_dir_deps_out_release_sup:start_link().

stop(_State) ->
	ok.
