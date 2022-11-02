-module(bsc_sup).
-behaviour(supervisor).

-export([start/0, start_link/0, init/1]).
-export([stop/0]).

start_link() ->
    supervisor:start_link({local,?MODULE}, ?MODULE, []).

stop() -> exit(whereis(?MODULE), shutdown).

init(_) ->
    ChildSpecList = [child(freq_overload), child(frequency), child(simple_phone_sup)],
    {ok,{{rest_for_one, 2, 3600}, ChildSpecList}}.

child(Module) ->
    {Module, {Module, start_link, []},
     permanent, 2000, worker, [Module]}.
start() ->
    bsc_sup:start_link(),
    phone:start_test(150, 500),
    counters:get_counters(freq_overload),
    'this is an end'.



% Module:init(Args) -> Result
% Types
% Args = term()
% Result = {ok,{SupFlags,[ChildSpec]}} | ignore
%  SupFlags = sup_flags()
%  ChildSpec = child_spec()
% 
% 
% sup_flags() =
%     #{strategy => strategy(),
%       intensity => integer() >= 0,
%       period => integer() >= 1,
%       auto_shutdown => auto_shutdown()} |
%     {RestartStrategy :: strategy(),
%      Intensity :: integer() >= 0,
%      Period :: integer() >= 1}
% The tuple format is kept for backward compatibility only. A map is preferred; see more details above.
% 
% 
% 
% child_spec() =
%     #{id := child_id(),
%       start := mfargs(),
%       restart => restart(),
%       significant => significant(),
%       shutdown => shutdown(),
%       type => worker(),
%       modules => modules()} |
%     {Id :: child_id(),
%      StartFunc :: mfargs(),
%      Restart :: restart(),
%      Shutdown :: shutdown(),
%      Type :: worker(),
%      Modules :: modules()}
% The tuple format is kept for backward compatibility only. A map is preferred; see more details above.



