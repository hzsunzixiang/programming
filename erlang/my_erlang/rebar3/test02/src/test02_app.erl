%%%-------------------------------------------------------------------
%% @doc test02 public API
%% @end
%%%-------------------------------------------------------------------

-module(test02_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    test02_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
