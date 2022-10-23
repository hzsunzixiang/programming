%%%-------------------------------------------------------------------
%% @doc gen_event_rebar3 top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(gen_event_rebar3_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    {ok, Pid} = supervisor:start_link({local, ?SERVER}, ?MODULE, []),
    freq_overload:add(counters_my, {}),
    freq_overload:add(logger_my, {file, "alarmlog.log"}),
    freq_overload:add(logger_my, standard_io),
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

init([]) ->
    SupFlags = #{strategy => one_for_one,
                 intensity => 5,
                 period => 3600},
    ChildSpecs = [child_static(frequency), child_dynamic(freq_overload)],
    {ok, {SupFlags, ChildSpecs}}.

child_static(Module) ->
    {Module, {Module, start_link, []},
     permanent, 5000, worker, [Module]}.

child_dynamic(Module) ->
    {Module, {Module, start_link, []},
     permanent, 5000, worker, dynamic}.

% modules is used by the release handler during code replacement to determine which processes are using a certain module. 
% As a rule of thumb, if the child process is a supervisor, gen_server or, gen_statem, this is to be a list with one element [Module],
% where Module is the callback module. 
% If the child process is an event manager (gen_event) with a dynamic set of callback modules, value dynamic must be used. 
% For more information about release handling, see Release Handling in OTP Design Principles.
%% internal functions


