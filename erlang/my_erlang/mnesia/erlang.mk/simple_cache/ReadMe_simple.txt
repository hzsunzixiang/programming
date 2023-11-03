

## 第一个节点
ericksun@centos7-mq2:~/programming/erlang/my_erlang/mnesia/erlang.mk/simple_cache (master)$ erl -sname apple
Erlang/OTP 26 [erts-14.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V14.1 (press Ctrl+G to abort, type help(). for help)
(apple@centos7-mq2)1> mnesia:start().
ok
(apple@centos7-mq2)2> %% 这一句会自动创建个数据库
                      mnesia:change_table_copy_type(schema, node(), disc_copies).
{atomic,ok}
(apple@centos7-mq2)3>
                      %-record(key_to_pid, {key, pid}).
                      rd(key_to_pid, {key, pid}).
key_to_pid
(apple@centos7-mq2)4> mnesia:create_table(key_to_pid,
                                          [{index, [pid]},
                                           {attributes, record_info(fields, key_to_pid)},
                                           {disc_copies, [node()]}
                                          ]).
{atomic,ok}
(apple@centos7-mq2)5> Function = fun(Elem) -> mnesia:dirty_write(#key_to_pid{key = Elem, pid = ELem})  end.
* 1:74: variable 'ELem' is unbound
(apple@centos7-mq2)6> L1 = lists:seq(7000,1,-1).
[7000,6999,6998,6997,6996,6995,6994,6993,6992,6991,6990,
 6989,6988,6987,6986,6985,6984,6983,6982,6981,6980,6979,6978,
 6977,6976,6975,6974,6973,6972|...]
(apple@centos7-mq2)7> Function = fun(Elem) -> mnesia:dirty_write(#key_to_pid{key = Elem, pid = Elem})  end.
#Fun<erl_eval.42.105768164>
(apple@centos7-mq2)8> L1 = lists:seq(7000,1,-1).
[7000,6999,6998,6997,6996,6995,6994,6993,6992,6991,6990,
 6989,6988,6987,6986,6985,6984,6983,6982,6981,6980,6979,6978,
 6977,6976,6975,6974,6973,6972|...]
(apple@centos7-mq2)9> lists:foreach(Function, L1).
=WARNING REPORT==== 3-Nov-2023::00:22:51.536581 ===
Mnesia('apple@centos7-mq2'): ** WARNING ** Mnesia is overloaded: {dump_log,write_threshold}

ok
(apple@centos7-mq2)10> lists:foreach(Function, L1).
=WARNING REPORT==== 3-Nov-2023::00:22:56.288091 ===
Mnesia('apple@centos7-mq2'): ** WARNING ** Mnesia is overloaded: {dump_log,write_threshold}

=WARNING REPORT==== 3-Nov-2023::00:22:56.315811 ===
Mnesia('apple@centos7-mq2'): ** WARNING ** Mnesia is overloaded: {dump_log,write_threshold}

ok


## 第二个节点
ericksun@centos7-mq1:~/programming/erlang/my_erlang/mnesia/erlang.mk/simple_cache (master)$ erl -sname apple  -pa deps/recon/ebin
Erlang/OTP 26 [erts-14.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V14.1 (press Ctrl+G to abort, type help(). for help)
(apple@centos7-mq1)1> mnesia:start().
ok
(apple@centos7-mq1)2> mnesia:delete_table(key_to_pid).
{aborted,{no_exists,key_to_pid}}
(apple@centos7-mq1)3> mnesia:change_config(extra_db_nodes, ['apple@centos7-mq2']).
{ok,['apple@centos7-mq2']}
(apple@centos7-mq1)4> mnesia:change_table_copy_type(schema, node(), disc_copies).
{atomic,ok}
(apple@centos7-mq1)5> mnesia:add_table_copy(key_to_pid, node(), disc_copies).
{atomic,ok}
(apple@centos7-mq1)6> Tables = mnesia:system_info(tables).
[key_to_pid,schema]
(apple@centos7-mq1)7> mnesia:wait_for_tables(Tables, 5000).
ok
(apple@centos7-mq1)8> [{T, mnesia:table_info(T, where_to_commit)} || T <- mnesia:system_info(tables)].
[{key_to_pid,[{'apple@centos7-mq1',disc_copies},
              {'apple@centos7-mq2',disc_copies}]},
 {schema,[{'apple@centos7-mq1',disc_copies},
          {'apple@centos7-mq2',disc_copies}]}]
(apple@centos7-mq1)9> rd(key_to_pid, {key, pid}).
key_to_pid
(apple@centos7-mq1)10> Function = fun(Elem) -> mnesia:dirty_write(#key_to_pid{key = Elem, pid = Elem})  end.
#Fun<erl_eval.42.105768164>
(apple@centos7-mq1)11> L1 = lists:seq(9000,5000,-1).
[9000,8999,8998,8997,8996,8995,8994,8993,8992,8991,8990,
 8989,8988,8987,8986,8985,8984,8983,8982,8981,8980,8979,8978,
 8977,8976,8975,8974,8973,8972|...]
(apple@centos7-mq1)12> lists:foreach(Function, L1).
=WARNING REPORT==== 3-Nov-2023::00:24:37.796521 ===
Mnesia('apple@centos7-mq1'): ** WARNING ** Mnesia is overloaded: {dump_log,write_threshold}

ok

