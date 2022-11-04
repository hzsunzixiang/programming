%%%-------------------------------------------------------------------
%% @doc http_interface top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(http_interface_sup).

-behaviour(supervisor).


%% API
-export([start_link/1, start_child/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

start_link(Port) ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, [Port]).

start_child() ->
    supervisor:start_child(?SERVER, []).  %% 是一个one_for_one 动态启动的进程 对应于 gws_connection_sup

init([Port]) ->
    Server = {hi_server, {hi_server, start_link, [Port]},
              permanent, 2000, worker, [hi_server]},
    Children = [Server],
    RestartStrategy = {one_for_one, 0, 1},
    {ok, {RestartStrategy, Children}}.
%% internal functions
