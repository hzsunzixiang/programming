-module(frequency_sup_bridge).

-behaviour(supervisor_bridge).

-export([start_link/0]).
-export([init/1, terminate/2]).

-define(PROCESS_NAME, frequency).
%% Creates a supervisor bridge for vshlr_1
start_link() ->
    supervisor_bridge:start_link({local, ?MODULE}, ?MODULE, []).

%% This function is supposed to start the vshlr server
init([]) ->
    ?PROCESS_NAME:start_link(),
    case whereis(?PROCESS_NAME) of
        Pid when pid(Pid) -> {ok, Pid, []};
        undefined -> {error, start_error}
    end.

%% This function is supposed to stop the vshlr server
terminate(_Reason, []) ->
    ?PROCESS_NAME:stop().
