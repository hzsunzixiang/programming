%%%-------------------------------------------------------------------
%% @doc kitty_server_proc_lib_rebar3 top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(kitty_server_proc_lib_rebar3_sup).

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


child(Module) ->
    {Module, {Module, start_link, []},
     permanent, 2000, worker, [Module]}.

init([]) ->
    SupFlags = #{strategy => one_for_all,
                 intensity => 0,
                 period => 1},
    ChildSpecs = [child(kitty_server2)],
    {ok, {SupFlags, ChildSpecs}}.


%% internal functions
