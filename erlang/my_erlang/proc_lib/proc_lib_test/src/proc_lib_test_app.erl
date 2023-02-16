%%%-------------------------------------------------------------------
%% @doc proc_lib_test public API
%% @end
%%%-------------------------------------------------------------------

-module(proc_lib_test_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    proc_lib_test_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
