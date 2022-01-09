-module(ets_named_set).
%-import(ets, [new/2, insert/2]).  % built-int 无须import
-compile([export_all]).
-compile(nowarn_export_all).

start() ->
    NamedEts = ets:new(ingredients, [set, named_table]),
	io:format("lookup Result:~p~n", [NamedEts]),
	io:format("lookup Result:~p~n", [ets:i()]),
    ets:insert(ingredients, {bacon, great}),
    ets:lookup(ingredients, bacon),
    ets:insert(ingredients, [{bacon, awesome}, {cabbage, alright}]),
    ets:lookup(ingredients, bacon),
    Result0 = ets:lookup(ingredients, cabbage),
	io:format("lookup Result:~p~n", [Result0]),
    ets:delete(ingredients, cabbage),
    Result1 = ets:lookup(ingredients, cabbage),
	io:format("lookup Result:~p~n", [Result1]),
    'this is an end'.


%    ets:new(ingredients, [set, named_table]).
%    ets:insert(ingredients, {bacon, great}).
%    ets:lookup(ingredients, bacon).
%    ets:insert(ingredients, [{bacon, awesome}, {cabbage, alright}]).
%    ets:lookup(ingredients, bacon).
%    ets:lookup(ingredients, cabbage).
%    ets:delete(ingredients, cabbage).
%    ets:lookup(ingredients, cabbage).
% lookup Resultingredients
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
%  ingredients     ingredients       set   0      305      <0.9.0>
%  logger          logger            set   3      1505     logger
%  #Ref<0.3169426210.3875143682.150277> code              set   353    13528    code_server
%  #Ref<0.3169426210.3875143682.150318> rex_nodes_observer set   0      305      <0.54.0>
% lookup Resultok
% lookup Result[{cabbage,alright}]
% lookup Result[]

