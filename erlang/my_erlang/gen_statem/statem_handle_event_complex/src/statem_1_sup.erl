%%%-------------------------------------------------------------------
%% @doc statem_1 top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(statem_1_sup).

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
init([]) ->
    SupFlags = #{strategy => one_for_all,
                 intensity => 0,
                 period => 1},
    ChildSpecList = [child(code_lock)],
    {ok, {SupFlags, ChildSpecList}}.

child(Module) ->
    {Module, {Module, start_link, [[a,b,c], x]},
     permanent, 2000, worker, [Module]}.

%% internal functions


