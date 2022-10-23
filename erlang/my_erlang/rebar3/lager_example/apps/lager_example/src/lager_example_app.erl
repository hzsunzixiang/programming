%%%-------------------------------------------------------------------
%% @doc lager_example public API
%% @end
%%%-------------------------------------------------------------------

-module(lager_example_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    lager_example_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
