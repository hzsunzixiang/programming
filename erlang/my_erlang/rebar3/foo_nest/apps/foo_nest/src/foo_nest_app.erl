%%%-------------------------------------------------------------------
%% @doc foo_nest public API
%% @end
%%%-------------------------------------------------------------------

-module(foo_nest_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    foo_nest_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
