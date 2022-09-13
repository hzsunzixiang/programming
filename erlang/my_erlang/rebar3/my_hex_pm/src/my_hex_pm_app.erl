%%%-------------------------------------------------------------------
%% @doc my_hex_pm public API
%% @end
%%%-------------------------------------------------------------------

-module(my_hex_pm_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    my_hex_pm_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
