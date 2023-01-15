-module(ppool_sup).
-export([start_link/3, init/1]).
-behaviour(supervisor).

start_link(Name, Limit, MFA) ->
    supervisor:start_link(?MODULE, {Name, Limit, MFA}).

init({Name, Limit, MFA}) ->
    MaxRestart = 1,
    MaxTime = 3000,
    {ok, {{one_for_all, MaxRestart, MaxTime},
          [{serv,  % 这个  ChildSpec 可以为空，如果不为空则直接启动，为空时，通过start_child 启动
             {ppool_serv, start_link, [Name, Limit, self(), MFA]},
             permanent,
             5000, 
             worker,
             [ppool_serv]}]}}.

% 启动一个 ppool_worker_sup 子进程 
% handle_info({start_worker_supervisor, Sup, MFA}, S = #state{}) ->
%     {ok, Pid} = supervisor:start_child(Sup, ?SPEC(MFA)),
%     link(Pid),
%     {noreply, S#state{sup=Pid}};

% {state,{<0.107.0>,ppool_sup},
%        one_for_all,
%        {[worker_sup,serv],
%         #{serv =>
%               {child,<0.108.0>,serv,
%                      {ppool_serv,start_link,
%                                  [nagger,2,<0.107.0>,
%                                   {ppool_nagger,start_link,[]}]},
%                      permanent,false,5000,worker,
%                      [ppool_serv]},
%           worker_sup =>
%               {child,<0.110.0>,worker_sup,
%                      {ppool_worker_sup,start_link,undefined},
%                      temporary,false,10000,supervisor,
%                      [ppool_worker_sup]}}},
%        undefined,1,3000,[],0,never,ppool_sup,
%        {nagger,2,{ppool_nagger,start_link,[]}}}
