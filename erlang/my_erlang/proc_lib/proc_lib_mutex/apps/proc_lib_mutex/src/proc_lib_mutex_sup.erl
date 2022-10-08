%%%-------------------------------------------------------------------
%% @doc proc_lib_mutex top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(proc_lib_mutex_sup).

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
    SupFlags = #{strategy => one_for_one,
                 intensity => 5,
                 period => 3600},
    ChildSpecs = [child(mutex)],
    {ok, {SupFlags, ChildSpecs}}.

child(Module) ->
    {Module, {Module, start_link, [printer, [trace]]},
     permanent, 5000, worker, [Module]}.

%% internal functions




%mutex_sup:start_link().
%supervisor:start_child(mutex_sup, ChildSpec).
%sys:log(printer, {true,10}).
%sys:statistics(printer, true).
%mutex:wait(printer), mutex:signal(printer).
%sys:log(printer, get).
%sys:log(printer, print).
%sys:get_status(printer).
%whereis(printer).
%exit(whereis(printer), kill).

