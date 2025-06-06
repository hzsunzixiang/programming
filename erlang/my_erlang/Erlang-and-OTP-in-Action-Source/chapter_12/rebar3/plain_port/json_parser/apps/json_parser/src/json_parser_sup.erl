%%%-------------------------------------------------------------------
%% @doc json_parser top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(json_parser_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

init([]) ->
    Server = {jp_server, {jp_server, start_link, []},
              permanent, 2000, worker, [jp_server]},
    Children = [Server],
    RestartStrategy = {one_for_one, 0, 1},
    {ok, {RestartStrategy, Children}}.

%% internal functions
