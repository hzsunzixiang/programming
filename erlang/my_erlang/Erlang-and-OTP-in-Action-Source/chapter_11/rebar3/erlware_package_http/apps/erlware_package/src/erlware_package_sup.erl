%%%-------------------------------------------------------------------
%% @doc erlware_package top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(erlware_package_sup).

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
    ElementSup = {sc_element_sup, {sc_element_sup, start_link, []},
                  permanent, 2000, supervisor, [sc_element]},

    EventManager = {sc_event, {sc_event, start_link, []},
                    permanent, 2000, worker, [sc_event]},

    Children = [ElementSup, EventManager],
    RestartStrategy = {one_for_one, 4, 3600},
    {ok, {RestartStrategy, Children}}.

%% internal functions
