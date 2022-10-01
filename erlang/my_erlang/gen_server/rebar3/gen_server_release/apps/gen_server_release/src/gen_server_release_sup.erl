%%%-------------------------------------------------------------------
%% @doc gen_server_release top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(gen_server_release_sup).

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

%init(_) ->
%    ChildSpecList = [child(freq_overload), child(frequency), child(simple_phone_sup)],
%    {ok,{{rest_for_one, 2, 3600}, ChildSpecList}}.

child(Module) ->
    {Module, {Module, start_link, []},
     permanent, 2000, worker, [Module]}.

init([]) ->
    SupFlags = #{strategy => one_for_all,
                 intensity => 0,
                 period => 1},
    %ChildSpecs = [],
    ChildSpecs = [child(frequency)],
    {ok, {SupFlags, ChildSpecs}}.

%% internal functions



