%%%-------------------------------------------------------------------
%% @doc test02 top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(test02_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%% sup_flags() = #{strategy => strategy(),         % optional
%%                 intensity => non_neg_integer(), % optional
%%                 period => pos_integer()}        % optional
%% child_spec() = #{id => child_id(),       % mandatory
%%                  start => mfargs(),      % mandatory
%%                  restart => restart(),   % optional
%%                  shutdown => shutdown(), % optional
%%                  type => worker(),       % optional
%%                  modules => modules()}   % optional
% init([]) ->
%     SupFlags = #{strategy => one_for_all,
%                  intensity => 0,
%                  period => 1},
%     ChildSpecs = [],
%     {ok, {SupFlags, ChildSpecs}}.

%% internal functions
%%

init([]) ->
    Server = {test02_server, {test02_server, start_link, []},
          permanent, 2000, worker, [test02_server]},
    Children = [Server],
    RestartStrategy = {one_for_one, 0, 1},
    {ok, {RestartStrategy, Children}}.










