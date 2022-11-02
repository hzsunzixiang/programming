-module(band_supervisor).
-behaviour(supervisor).

-export([start_link/1]).
-export([init/1]).

start_link(Type) ->
    supervisor:start_link({local,?MODULE}, ?MODULE, Type).

%% The band supervisor will allow its band members to make a few
%% mistakes before shutting down all operations, based on what
%% mood he's in. A lenient supervisor will tolerate more mistakes
%% than an angry supervisor, who'll tolerate more than a
%% complete jerk supervisor
%%
%% https://www.erlang.org/doc/man/supervisor.html#Module:init-1
%% Args is the Args argument provided to the start function.
init(lenient) ->
    init({one_for_one, 3, 60});
init(angry) ->
    init({rest_for_one, 2, 60});
init(jerk) ->
    init({one_for_all, 1, 60});
% https://www.erlang.org/doc/man/supervisor.html#Module:init-1
%Notice that when the restart strategy is simple_one_for_one, the list of child specifications must be a list with one child specification only. (The child specification identifier is ignored.) No child process is then started during the initialization phase, but all children are assumed to be started dynamically using start_child/2.
%  这种没有实验成功
init(jamband) ->
    {ok, {{simple_one_for_one, 3, 60},
         [{jam_musician,
           {musicians, start_link, []},
           temporary, 1000, worker, [musicians]}
         ]}};
init({RestartStrategy, MaxRestart, MaxTime}) ->
    {ok, {{RestartStrategy, MaxRestart, MaxTime},
         [{singer,
           {musicians, start_link, [singer, good]},  
		   % modules => modules()} 这里的参数 [singer, good] 传给 musicians:start_link, 再传给 band_supervisor
		   % 再调用 musicians:init
           permanent, 1000, worker, [musicians]},
          {bass,
           {musicians, start_link, [bass, good]},
           temporary, 1000, worker, [musicians]},
          {drum,
           {musicians, start_link, [drum, bad]},
           transient, 1000, worker, [musicians]},
          {keytar,
           {musicians, start_link, [keytar, good]},
           transient, 1000, worker, [musicians]}
         ]}}.


% band_supervisor:start_link(lenient).
% band_supervisor:start_link(angry).
% band_supervisor:start_link(jerk).
%
