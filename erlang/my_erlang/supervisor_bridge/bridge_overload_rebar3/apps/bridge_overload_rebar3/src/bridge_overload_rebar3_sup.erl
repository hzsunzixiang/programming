%%%-------------------------------------------------------------------
%% @doc bridge_overload_rebar3 top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(bridge_overload_rebar3_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    {ok, Pid} = supervisor:start_link({local,?MODULE},?MODULE, []),
    freq_overload:add(my_counters, {}),
    freq_overload:add(my_logger, {file, "log.txt"}),
    freq_overload:add(my_logger, standard_io),

    {ok, Pid}.

%% sup_flags() = #{strategy => strategy(),         % optional
%%                 intensity => non_neg_integer(), % optional
%%                 period => pos_integer()}        % optional
%% child_spec() = #{id => child_id(),       % mandatory
%%                  start => mfargs(),      % mandatory
%%                  restart => restart(),   % optional
%%                  shutdown => shutdown(), % optional
%%                  type => worker(),       % optional
%%                  modules => modules()}   % optional
init(_) ->
    hlr:new(),
    SupFlags = #{strategy => one_for_all,
                 intensity => 2,
                 period => 3600},
    ChildSpecList = [child(frequency_sup_bridge), child(freq_overload)],
    {ok,{SupFlags, ChildSpecList}}.

child(Module) ->
    {Module, {Module, start_link, []},
     permanent, 2000, worker, [Module]}.

%% internal functions
