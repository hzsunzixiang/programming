%%%-------------------------------------------------------------------
%% @doc erlware_package public API
%% @end
%%%-------------------------------------------------------------------

-module(erlware_package_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    erlware_package_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
