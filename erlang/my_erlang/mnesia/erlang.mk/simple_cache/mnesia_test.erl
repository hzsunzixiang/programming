

%%  率先启动的节点
%%  先要把数据库删除 rm Mnesia.apple@centos7-mq2/ -rf

%% ok = mnesia:create_schema([node()]).
mnesia:start().
%% 这一句会自动创建个数据库
mnesia:change_table_copy_type(schema, node(), disc_copies).

%-record(key_to_pid, {key, pid}).
rd(key_to_pid, {key, pid}).
mnesia:create_table(key_to_pid,
                    [{index, [pid]},
                     {attributes, record_info(fields, key_to_pid)},
                     {disc_copies, [node()]}
                    ]).

Function = fun(Elem) -> mnesia:dirty_write(#key_to_pid{key = Elem, pid = Elem})  end.
L1 = lists:seq(7000,1,-1).
lists:foreach(Function, L1).



%% 第二个启动的节点
mnesia:start().
mnesia:delete_table(key_to_pid).
mnesia:change_config(extra_db_nodes, ['apple@centos7-mq2']).
mnesia:change_table_copy_type(schema, node(), disc_copies).
mnesia:add_table_copy(key_to_pid, node(), disc_copies).
[{T, mnesia:table_info(T, where_to_commit)} || T <- mnesia:system_info(tables)].
Tables = mnesia:system_info(tables).
mnesia:wait_for_tables(Tables, 5000).


rd(key_to_pid, {key, pid}).
Function = fun(Elem) -> mnesia:dirty_write(#key_to_pid{key = Elem, pid = Elem})  end.
L1 = lists:seq(9000,5000,-1).
lists:foreach(Function, L1).
