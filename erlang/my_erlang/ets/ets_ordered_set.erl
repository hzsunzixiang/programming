-module(ets_ordered_set).
-compile([export_all]).
-compile(nowarn_export_all).

start() ->

    TabId = ets:new(ingredients, [ordered_set, named_table]),
	io:format("lookup Result:~p~n", [TabId]),
    ets:insert(ingredients, [{ketchup, "not much"}, {mustard, "a lot"}, {cheese, "yes", "goat"}, {patty, "moose"}, {onions, "a lot", "caramelized"}]),
	io:format("lookup Result:~p~n", [ets:i()]),
    
    Res1 = ets:first(ingredients),
    Res2 = ets:next(ingredients, Res1),
    Res3 = ets:next(ingredients, Res2),
    Last = ets:last(ingredients),
    Prev = ets:prev(ingredients, ets:last(ingredients)),

	io:format("lookup Result:~p~n", [[Res1, Res2, Res3, Last, Prev]]),

    L1=ets:next(ingredients, ets:last(ingredients)),
    L2=ets:prev(ingredients, ets:first(ingredients)),
	io:format("lookup Result:~p~n", [[L1, L2]]),
    'this is an end'.

% lookup Result:ingredients
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
%  ingredients     ingredients       ordered_set 5      263      <0.9.0>
%  logger          logger            set   3      1505     logger
%  #Ref<0.306664825.2535063554.81231> code              set   353    13532    code_server
%  #Ref<0.306664825.2535063554.81272> rex_nodes_observer set   0      305      <0.54.0>
% lookup Result:ok
% lookup Result:[cheese,ketchup,mustard,patty,onions]

