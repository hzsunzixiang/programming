-module(ppool_worker_sup).
-export([start_link/1, init/1]).
-behaviour(supervisor).

start_link(MFA = {_,_,_}) ->
    supervisor:start_link(?MODULE, MFA).

init({M,F,A}) ->
    MaxRestart = 5,
    MaxTime = 3600,
    {ok, {{simple_one_for_one, MaxRestart, MaxTime},
          [{ppool_worker,
            {M,F,A},
            temporary, 5000, worker, [M]}]}}.
    
% {state,{<0.110.0>,ppool_worker_sup},
%        simple_one_for_one,
%        {[ppool_worker],
%         #{ppool_worker =>
%               {child,undefined,ppool_worker,
%                      {ppool_nagger,start_link,[]},
%                      temporary,false,5000,worker,
%                      [ppool_nagger]}}},
%        {mapsets,#{<0.584.0> => [],<0.596.0> => []}},
%        5,3600,[],0,never,ppool_worker_sup,
%        {ppool_nagger,start_link,[]}}
