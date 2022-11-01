-module(resource_discovery).

-behaviour(gen_server).

-export([
         start_link/0,
         add_target_resource_type/1,
         add_local_resource/2,
         fetch_resources/1,
         trade_resources/0
        ]).

-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

-record(state, {target_resource_types,    % 所需资源的类型的列表，存放着类型
                local_resource_tuples,    % 供给列表，能够提供的资源，资源元组，保存在本地的所有资源
                found_resource_tuples}).  % 缓存探测到的资源实例

%% API

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

%% 将新数据写入服务器状态
add_target_resource_type(Type) ->
    gen_server:cast(?SERVER, {add_target_resource_type, Type}).

add_local_resource(Type, Resource) ->
    gen_server:cast(?SERVER, {add_local_resource, {Type, Resource}}).

fetch_resources(Type) ->
    gen_server:call(?SERVER, {fetch_resources, Type}).

trade_resources() ->
    gen_server:cast(?SERVER, trade_resources).

%% Callbacks

init([]) ->
    {ok, #state{target_resource_types = [],
                local_resource_tuples = dict:new(),
                found_resource_tuples = dict:new()}}.

handle_call({fetch_resources, Type}, _From, State) ->
    {reply, dict:find(Type, State#state.found_resource_tuples), State}.

handle_cast({add_target_resource_type, Type}, State) ->
    TargetTypes = State#state.target_resource_types,
    NewTargetTypes = [Type | lists:delete(Type, TargetTypes)],
    {noreply, State#state{target_resource_types = NewTargetTypes}};
handle_cast({add_local_resource, {Type, Resource}}, State) ->
    ResourceTuples = State#state.local_resource_tuples,
    NewResourceTuples = add_resource(Type, Resource, ResourceTuples),
    {noreply, State#state{local_resource_tuples = NewResourceTuples}};
handle_cast(trade_resources, State) ->   % 这里是发送
    ResourceTuples = State#state.local_resource_tuples,   % 把所有的本地资源交换给其他节点
    AllNodes = [node() | nodes()],
    io:format("AllNodes:~p~n", [AllNodes]),
    lists:foreach(
        fun(Node) ->
            gen_server:cast({?SERVER, Node},  % {Name :: atom(), Node :: atom()}
                            {trade_resources, {node(), ResourceTuples}}) % 把当前节点 node() 的本地资源，发送给Node
        end,
        AllNodes),
    {noreply, State};
handle_cast({trade_resources, {ReplyTo, Remotes}}, % 这里是接收，  Remotes 来自远程节点的资源 
           #state{local_resource_tuples = Locals,
		  target_resource_types = TargetTypes,
		  found_resource_tuples = OldFound} = State) ->
    FilteredRemotes = resources_for_types(TargetTypes, Remotes), % TargetTypes 保存着当前节点需要的资源类型; 如果Remotes当中有，则加入进来
    NewFound = add_resources(FilteredRemotes, OldFound),         % 把获取到的 远程资源列表，放入 found_resource_tuples 中
    io:format("FilteredRemotes:~p, TargetTypes:~p, Remotes:~p, ~n", [FilteredRemotes, TargetTypes, Remotes]),
    case ReplyTo of
        noreply ->
            ok;
        _ ->
            gen_server:cast({?SERVER, ReplyTo},
                            {trade_resources, {noreply, Locals}})   % 同样的，把本地节点的资源给到对方
    end,
    {noreply, State#state{found_resource_tuples = NewFound}}.

handle_info(ok = _Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Utilities

add_resources([{Type, Identifier}|T], Dict) ->
    add_resources(T, add_resource(Type, Identifier, Dict));
add_resources([], Dict) ->
    Dict.

add_resource(Type, Resource, Dict) ->
    case dict:find(Type, Dict) of
        {ok, ResourceList} ->
            NewList = [Resource | lists:delete(Resource, ResourceList)],
            dict:store(Type, NewList, Dict);
        error ->
            dict:store(Type, [Resource], Dict)
    end.

resources_for_types(Types, ResourceTuples) ->
    Fun =
        fun(Type, Acc) ->
            case dict:find(Type, ResourceTuples) of
                {ok, List} ->
                    [{Type, Resource} || Resource <- List] ++ Acc;
                error ->
                    Acc
            end
        end,
    lists:foldl(Fun, [], Types).
