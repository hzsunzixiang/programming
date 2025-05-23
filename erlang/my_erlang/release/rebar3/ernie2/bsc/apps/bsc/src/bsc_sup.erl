-module(bsc_sup).
-behaviour(supervisor).

-export([start_link/0, init/1]).
-export([stop/0]).

start_link() ->
    supervisor:start_link({local,?MODULE}, ?MODULE, []).

stop() -> exit(whereis(?MODULE), shutdown).

init(_) ->
    ChildSpecList = [child(freq_overload, worker), child(frequency, woker), child(simple_phone_sup, supervisor)],
    {ok,{{rest_for_one, 2, 3600}, ChildSpecList}}.

child(Module, Type) ->
    {Module, {Module, start_link, []},
     permanent, 2000, worker, [Module]}.
