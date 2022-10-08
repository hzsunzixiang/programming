%%%-------------------------------------------------------------------
%% @doc gen_fsm_app public API
%% @end
%%%-------------------------------------------------------------------

-module(gen_fsm_app_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    gen_fsm_app_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
