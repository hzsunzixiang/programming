%%%-------------------------------------------------------------------
%% @doc recon_use public API
%% @end
%%%-------------------------------------------------------------------

-module(recon_use_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    recon_use_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
