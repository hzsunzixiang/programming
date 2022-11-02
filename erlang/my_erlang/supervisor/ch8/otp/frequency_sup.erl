-module(frequency_sup).
-behaviour(supervisor).

-export([start/0, start_link/0, init/1]).
-export([stop/0]).

start_link() ->
    supervisor:start_link({local,?MODULE},?MODULE, []).

stop() -> exit(whereis(?MODULE), shutdown).

init(_) ->
    ChildSpecList = [child(freq_overload), child(frequency)],
    {ok,{{rest_for_one, 2, 3600}, ChildSpecList}}.

child(Module) ->
    {Module, {Module, start_link, []},
     permanent, 2000, worker, [Module]}.

%% init/1 and child/1 returning SupervisorSpec as a map rather than a
%% tuple, for Erlang 18.0 or newer:
%%init(_) ->
%%    ChildSpecList = [child(freq_overload), child(frequency)],
%%    SupFlags = #{strategy => rest_for_one,
%%                 intensity => 2, period => 3600},
%%    {ok, {SupFlags, ChildSpecList}}.
%%
%%child(Module) ->
%%    #{id => Module,
%%      start => {Module, start_link, []},
%%      restart => permanent,
%%      shutdown => 2000,
%%      type => worker,
%%      modules => [Module]}.
%%
start()->
    frequency_sup:start_link(),
    whereis(frequency),
    whereis (freq_overload),
    frequency:stop(),
    whereis(frequency),
    exit(whereis(frequency), kill),
    whereis(frequency),
    supervisor:which_children(frequency_sup),
    supervisor:count_children(frequency_sup),
	'this is an end'.

% Eshell V8.3.5.3  (abort with ^G)
% 1> frequency_sup:start_link().
% {ok,<0.60.0>}
% 2> whereis(frequency).
% <0.62.0>
% 3> whereis (freq_overload)
% 3> .
% <0.61.0>
% 4> frequency:stop().
% ok
% 5> whereis(frequency).
% <0.66.0>
% 6> exit(whereis(frequency), kill).
% true
% 7> whereis(frequency).
% <0.69.0>
% 8> supervisor:which_children(frequency_sup).
% [{frequency,<0.69.0>,worker,[frequency]},
%  {freq_overload,<0.61.0>,worker,[freq_overload]}]
% 9> supervisor:count_children(frequency_sup).
% [{specs,2},{active,2},{supervisors,0},{workers,2}]

