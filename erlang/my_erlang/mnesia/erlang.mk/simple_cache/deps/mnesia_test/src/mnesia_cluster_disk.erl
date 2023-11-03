-module(mnesia_cluster_disk).

-compile(export_all).
-compile(nowarn_export_all).

-define(TABLE_ID, ?MODULE).
-define(WAIT_FOR_TABLES, 5000).

-record(key_to_pid, {key, pid}).

init() ->
    mnesia:stop(),
    mnesia:delete_schema([node()]),
    
	%ok = mnesia:create_schema([node()]),
    mnesia:start(),
    mnesia:delete_table(key_to_pid),
    %% 第一个启动的节点不需要链接
    %% CacheNodes = ['apple@centos7-mq2'],
    CacheNodes = ['apple@centos7-mq1', 'apple@centos7-mq2'],
    dynamic_db_init(lists:delete(node(), CacheNodes)).


%2:22:58.079266 <0.130.0> rd_server:fetch_resources/1 --> {ok,['contactx@centos7-mq1','contactx@centos7-mq2']}
%
%2:22:58.079351 <0.130.0> resource_discovery:fetch_resources/1 --> {ok,['contactx@centos7-mq1','contactx@centos7-mq2']}
%
%2:22:58.079431 <0.130.0>  '--> sc_store:init/0
%
%2:22:58.079484 <0.130.0> sc_store:dynamic_db_init(['contactx@centos7-mq1'])
%
%2:22:58.079563 <0.130.0> sc_store:add_extra_nodes(['contactx@centos7-mq1'])
%
%2:22:58.079684 <0.130.0> mnesia:change_config(extra_db_nodes, ['contactx@centos7-mq1'])

%% Internal Functions

dynamic_db_init([]) ->
    mnesia:create_table(key_to_pid,
                        [{index, [pid]},
                         {attributes, record_info(fields, key_to_pid)},
                         {disc_copies, [node()]}
                        ]);

dynamic_db_init(CacheNodes) ->
    add_extra_nodes(CacheNodes).

add_extra_nodes([Node|T]) ->
    %% 这里只能是RAM模式的，需要 change_table_copy_type 改为disc_copies 模式的
    case mnesia:change_config(extra_db_nodes, [Node]) of
        {ok, [Node]} ->
            %mnesia:add_table_copy(key_to_pid, node(), ram_copies),
			mnesia:change_table_copy_type(schema, node(), disc_copies),
			% 必须先改 scheme，不然这一句不生效
            mnesia:add_table_copy(key_to_pid, node(), disc_copies),

            Tables = mnesia:system_info(tables),
            mnesia:wait_for_tables(Tables, ?WAIT_FOR_TABLES);
        _ ->
            add_extra_nodes(T)
    end.



insert(Key, Pid) ->
    mnesia:dirty_write(#key_to_pid{key = Key, pid = Pid}).

lookup(Key) ->
    case mnesia:dirty_read(key_to_pid, Key) of
        [{key_to_pid, Key, Pid}] ->
		{ok, Pid};
        [] ->
	    {error, not_found}
    end.

delete(Pid) ->
    case mnesia:dirty_index_read(key_to_pid, Pid, #key_to_pid.pid) of
        [#key_to_pid{} = Record] ->
            mnesia:dirty_delete_object(Record);
        _ ->
            ok
    end.
