


# 启动
 erl -sname apple  -noshell -s ets_deadlock start -s init stop

# 另一个shell登录
 erl -sname orange -remsh apple

再用一个shell观察内存
top -p `ps aux|grep beam |grep -v grep |awk '{print $2}'`


(apple@centos-1)30> ets:i().
 id              name              type  size   mem      owner
 ----------------------------------------------------------------------------
 ac_tab          ac_tab            set   7      968      application_controller
 code_names      code_names        set   23     2844     code_server
 file_io_servers file_io_servers   set   0      305      file_server_2
 global_locks    global_locks      set   0      305      global_name_server
 global_names    global_names      set   0      305      global_name_server
 global_names_ext global_names_ext  set   0      305      global_name_server
 global_pid_ids  global_pid_ids    bag   0      305      global_name_server
 global_pid_names global_pid_names  bag   0      305      global_name_server
 inet_cache      inet_cache        bag   0      305      inet_db
 inet_db         inet_db           set   30     587      inet_db
 inet_hosts_byaddr inet_hosts_byaddr set   0      305      inet_db
 inet_hosts_byname inet_hosts_byname set   0      305      inet_db
 inet_hosts_file_byaddr inet_hosts_file_byaddr set   0      305      inet_db
 inet_hosts_file_byname inet_hosts_file_byname set   0      305      inet_db
 inet_sockets    inet_sockets      set   0      305      inet_db
 logger          logger            set   3      1505     logger
 sys_dist        sys_dist          set   1      359      net_kernel
 #Ref<0.885367961.2395602945.146060> code              set   373    15784    code_server
 #Ref<0.885367961.2395602945.146101> rex_nodes_observer set   2      319      <0.54.0>
 #Ref<0.885367961.2395602945.146127> cookies           set   0      305      auth
 #Ref<0.885367961.2395602945.146231> table             set   219    3738     <0.9.0>
 #Ref<0.885367961.2395602945.146492> shell_records     ordered_set 0      139      <0.88.0>
ok

