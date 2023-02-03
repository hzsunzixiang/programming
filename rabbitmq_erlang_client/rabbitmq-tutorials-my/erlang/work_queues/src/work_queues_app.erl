%%%-------------------------------------------------------------------
%% @doc work_queues public API
%% @end
%%%-------------------------------------------------------------------

-module(work_queues_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    work_queues_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
