-module(register_name_restart).
-compile([export_all]).
-compile(nowarn_export_all).
-define(ProcName, criticProcName). 

start_critic2() ->
    spawn(?MODULE, restarter, []).

restarter() ->
    process_flag(trap_exit, true),
    Pid = spawn_link(?MODULE, critic, []),
    io:format("restarter the Pid:[~p] ~n", [Pid]),
    register(?ProcName, Pid),
    %register(Name, Pid),
    receive
        {'EXIT', Pid, normal} -> % not a crash
            ok;
        {'EXIT', Pid, shutdown} -> % manual shutdown, not a crash
            ok;
        {'EXIT', Pid, _} ->
            restarter()
    end.

judge2(Band, Album) ->
    ?ProcName ! {self(), {Band, Album}},
    Pid = whereis(?ProcName),  % 如果服务端挂掉会有问题，解决方案就是不依赖于Pid, 依赖于一个类似uuid的唯一引用
    receive
        {Pid, Criticism} -> Criticism,
        io:format("judge2 return :Pid:[~p] ~p, ~n", [Pid,Criticism])
    after 2000 ->
        timeout
    end.

critic() ->
    receive
        {From, {"Rage Against the Turing Machine", "Unit Testify"}} ->
            From ! {self(), "They are great!"};
        {From, {"System of a Downtime", "Memoize"}} ->
            From ! {self(), "They're not Johnny Crash but they're good."};
        {From, {"Johnny Crash", "The Token Ring of Fire"}} ->
            From ! {self(), "Simply incredible."};
        {From, {_Band, _Album}} ->
            From ! {self(), "They are terrible!"}
    end,
    critic().

start() ->
   start_critic2(),
   %judge2("System of a Downtime", "Memoize"),

   % 开启
   %1> register_name_restart:start_critic2().
   %<0.82.0>
   
   % 获取评论
   %6> register_name_restart:judge2("System of a Downtime", "Memoize").
   %judge2 return :"They're not Johnny Crash but they're good.",


   %由于太阳风暴(要假装得更真实些)，通信的连接中断了。
   %6> exit(whereis(criticProcName), solar_storm).
   %restarter the Pid:[<0.90.0>]
   %true

   % 再次请求
   %8> register_name_restart:judge2("System of a Downtime", "Memoize").
   %judge2 return :Pid:[<0.90.0>] "They're not Johnny Crash but they're good.",
   %ok

   % 模拟一种不用恢复的



   %25> register_name_restart:start_critic2().
   %restarter the Pid:[<0.118.0>]
   %<0.117.0>
   %26> register_name_restart:judge2("System of a Downtime", "Memoize").
   %judge2 return :Pid:[<0.118.0>] "They're not Johnny Crash but they're good.",
   %ok
   %27> exit(whereis(criticProcName), shutdown).
   %true
   %28> rp(registered()).  % 此时进程没有了
   %[rex,global_group,file_server_2,user,logger_sup,kernel_sup,
   % code_server,standard_error_sup,logger_std_h_default,
   % erts_code_purger,kernel_refc,logger_proxy,erl_signal_server,
   % application_controller,inet_db,standard_error,
   % logger_handler_watcher,init,erl_prim_loader,socket_registry,
   % user_drv,logger,global_name_server,kernel_safe_sup]
   %ok

%%%%  normal 时没有正常杀掉进程
%33> exit(whereis(criticProcName), normal).
%true
%34>
%34>
%34>
%34> rp(registered()).
%[rex,global_group,criticProcName,file_server_2,user,
% logger_sup,kernel_sup,code_server,standard_error_sup,
% logger_std_h_default,erts_code_purger,kernel_refc,
% logger_proxy,erl_signal_server,application_controller,
% inet_db,standard_error,logger_handler_watcher,init,
% erl_prim_loader,socket_registry,user_drv,logger,
% global_name_server,kernel_safe_sup]

   'this is an end'.

%5> rp(registered()).
%[rex,global_group,criticProcName,file_server_2,user,
% logger_sup,kernel_sup,code_server,standard_error_sup,
% logger_std_h_default,erts_code_purger,kernel_refc,
% logger_proxy,erl_signal_server,application_controller,
% inet_db,standard_error,logger_handler_watcher,init,
% erl_prim_loader,socket_registry,user_drv,kernel_safe_sup,
% logger,global_name_server]




% Eshell V12.2  (abort with ^G)
% 1>
% 1> register_name_restart:start_critic2().
% restarter the Pid:[<0.83.0>]
% <0.82.0>
% 2> register_name_restart:judge2("System of a Downtime", "Memoize").
% judge2 return :Pid:[<0.83.0>] "They're not Johnny Crash but they're good.",
% 
%6> exit(whereis(criticProcName), solar_storm).
%restarter the Pid:[<0.90.0>]
%true

%8> register_name_restart:judge2("System of a Downtime", "Memoize").
%judge2 return :Pid:[<0.90.0>] "They're not Johnny Crash but they're good.",
%ok



%register_name_restart:start_critic2().
%register_name_restart:judge2("System of a Downtime", "Memoize").
%6> exit(whereis(criticProcName), solar_storm).
%8> register_name_restart:judge2("System of a Downtime", "Memoize").



