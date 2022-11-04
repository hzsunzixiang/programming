-module(gws_connection_sup).

-behaviour(supervisor).

%% API
-export([start_link/4, start_child/1]).

%% Supervisor callbacks
-export([init/1]).

%%%===================================================================
%%% API functions

start_link(Callback, IP, Port, UserArgs) ->
    % 这里使用的是：	
	% start_link(Module, Args) -> startlink_ret()
	% 可以启动多个实例, 为此 gws_server进程必须知道自己隶属于哪个监督者
	% 没有使用，所以没有展示注册名
    % start_link(SupName, Module, Args) -> startlink_ret()
	%
	%
	% 方式之一 
    % {ok, Pid} = supervisor:start_link(?MODULE, [Callback, IP,
    %                                             Port, UserArgs]),
    % start_child(Pid),  %% 这里没有用 SupName,所以没有展示 进程信息 
    % {ok, Pid}.


	% 换个方式，只启动一个实例
    supervisor:start_link({local, ?MODULE}, ?MODULE, [Callback, IP,
                                                Port, UserArgs]),
    Pid = whereis(?MODULE),
    start_child(?MODULE),  %% 这里没有用 SupName,所以没有展示 进程信息 
    {ok, Pid}.

start_child(Server) ->
    supervisor:start_child(Server, []).


%%%===================================================================
%%% Supervisor callbacks

init([Callback, IP, Port, UserArgs]) ->
    BasicSockOpts = [binary,
                     {active, false},
                     {packet, http_bin},
                     {reuseaddr, true}],
    SockOpts = case IP of
                   undefined -> BasicSockOpts;
                   _         -> [{ip,IP} | BasicSockOpts]
               end,
    {ok, LSock} = gen_tcp:listen(Port, SockOpts),  %% 监听套接字赋值的地方
    Server = {gws_server, {gws_server, start_link,
                           [Callback, LSock, UserArgs]},   % 调用 gws_server 的参数，
              temporary, brutal_kill, worker, [gws_server]},
    RestartStrategy = {simple_one_for_one, 1000, 3600},
    {ok, {RestartStrategy, [Server]}}.
