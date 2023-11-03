mnesia:start().
mnesia:delete_table(key_to_pid).
mnesia:change_config(extra_db_nodes, ['apple@centos7-mq2']).
mnesia:change_table_copy_type(schema, node(), disc_copies).
mnesia:add_table_copy(key_to_pid, node(), disc_copies).
Tables = mnesia:system_info(tables).
mnesia:wait_for_tables(Tables, 5000).
