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
