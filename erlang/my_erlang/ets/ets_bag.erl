-module(ets_bag).
-compile([export_all]).
-compile(nowarn_export_all).

start() ->

    TabId = ets:new(ingredients, [bag]),
	io:format("lookup Result:~p~n", [TabId]),
	io:format("lookup Result:~p~n", [ets:i()]),
    ets:insert(TabId, {bacon, delicious}),
    ets:insert(TabId, {bacon, fat}),
    ets:insert(TabId, {bacon, fat}),
    Result1 = ets:lookup(TabId, bacon),
	io:format("lookup Result:~p~n", [Result1]),
    'this is an end'.


% lookup Result:#Ref<0.2251137332.1191837700.107792>
%  id              name              type  size   mem      owner
%  ----------------------------------------------------------------------------
%  ac_tab          ac_tab            set   7      968      application_controller
%  code_names      code_names        set   23     2844     code_server
%  file_io_servers file_io_servers   set   0      305      file_server_2
%  global_locks    global_locks      set   0      305      global_name_server
%  global_names    global_names      set   0      305      global_name_server
%  global_names_ext global_names_ext  set   0      305      global_name_server
%  global_pid_ids  global_pid_ids    bag   0      305      global_name_server
%  global_pid_names global_pid_names  bag   0      305      global_name_server
%  inet_cache      inet_cache        bag   0      305      inet_db
%  inet_db         inet_db           set   30     587      inet_db
%  inet_hosts_byaddr inet_hosts_byaddr set   0      305      inet_db
%  inet_hosts_byname inet_hosts_byname set   0      305      inet_db
%  inet_hosts_file_byaddr inet_hosts_file_byaddr set   0      305      inet_db
%  inet_hosts_file_byname inet_hosts_file_byname set   0      305      inet_db
%  inet_sockets    inet_sockets      set   0      305      inet_db
%  logger          logger            set   3      1505     logger
%  #Ref<0.2251137332.1191837698.107859> code              set   353    13532    code_server
%  #Ref<0.2251137332.1191837698.107900> rex_nodes_observer set   0      305      <0.54.0>
%  #Ref<0.2251137332.1191837700.107792> ingredients       bag   0      305      <0.9.0>
% lookup Result:ok
% lookup Result:[{bacon,delicious},{bacon,fat}]

