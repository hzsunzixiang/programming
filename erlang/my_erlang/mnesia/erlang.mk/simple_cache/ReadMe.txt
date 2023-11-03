

* 
wget https://erlang.mk/erlang.mk
make -f erlang.mk bootstrap 



## 获取所有的表
(apple@centos7-mq1)2> [{T, mnesia:table_info(T, where_to_commit)} || T <- mnesia:system_info(tables)].
[{schema,[{'apple@centos7-mq1',disc_copies},
          {'apple@centos7-mq2',disc_copies}]},
 {key_to_pid,[{'apple@centos7-mq1',disc_copies},
              {'apple@centos7-mq2',disc_copies}]}]


## 批量插入
Function = fun(Elem) -> mnesia_cluster_disk:insert(Elem,Elem) end.
L1 = lists:seq(7000,1,-1).
lists:foreach(Function, L1).


## 同步所有的 表
[{Tb, mnesia:add_table_copy(Tb, node(), Type)}
 || {Tb, [{'a@node', Type}]} <- [{T, mnesia:table_info(T, where_to_commit)}
                                || T <- mnesia:system_info(tables)]].


[{Tb, mnesia:add_table_copy(Tb, node(), Type)} || {Tb, [{'apple@centos7-mq2', Type}]} <- 
 [{T, mnesia:table_info(T, where_to_commit)} || T <- mnesia:system_info(tables)]
 ].



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


