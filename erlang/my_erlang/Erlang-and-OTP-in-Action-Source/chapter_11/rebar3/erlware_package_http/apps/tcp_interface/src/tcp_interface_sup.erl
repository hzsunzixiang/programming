%%%-------------------------------------------------------------------
%% @doc tcp_interface top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(tcp_interface_sup).

-behaviour(supervisor).

-export([start_link/1, start_child/0]).


-export([init/1]).

-define(SERVER, ?MODULE).

start_link(LSock) ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, [LSock]).



%% sup_flags() = #{strategy => strategy(),         % optional
%%                 intensity => non_neg_integer(), % optional
%%                 period => pos_integer()}        % optional
%% child_spec() = #{id => child_id(),       % mandatory
%%                  start => mfargs(),      % mandatory
%%                  restart => restart(),   % optional
%%                  shutdown => shutdown(), % optional
%%                  type => worker(),       % optional
%%                  modules => modules()}   % optional

start_child() ->
    supervisor:start_child(?SERVER, []). % 在这里创建一个进程，参数为LSock

init([LSock]) ->
    Server = {ti_server, {ti_server, start_link, [LSock]},
              temporary, brutal_kill, worker, [ti_server]},
    Children = [Server],
    RestartStrategy = {simple_one_for_one, 0, 1},
    {ok, {RestartStrategy, Children}}.

%% internal functions
