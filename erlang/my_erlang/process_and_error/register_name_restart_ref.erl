-module(register_name_restart_ref).
-compile([export_all]).
-compile(nowarn_export_all).
-define(ProcName, criticProcName). 

start_critic2() ->
    spawn(?MODULE, restarter, []).

restarter() ->
    process_flag(trap_exit, true),
    Pid = spawn_link(?MODULE, critic2, []),
    io:format("restarter the Pid:[~p] ~n", [Pid]),
    register(?ProcName, Pid),
    receive
        {'EXIT', Pid, normal} -> % not a crash
            ok;
        {'EXIT', Pid, shutdown} -> % manual shutdown, not a crash
            ok;
        {'EXIT', Pid, _} ->
            restarter()
    end.



%%  语句执行之间保持不变。但是，完全有可能发生如下情况:
%%  1.critic!Message
%%                                  2.critic receives
%%                                  3.critic replies
%%                                  4.critic dies
%%  5.whereis fails
%%                                  6.critic isrestarted
%%  7.code crashes
%%  下面这种情况也可能发生:
%%  1.critic!Message
%%                                  2.critic receives
%%                                  3.criticreplies
%%                                  4.criticdies
%%                                  5.criticis restarted
%%  6.whereis picks up
%%  wrong pid
%%  7.Message never matches
judge2(Band, Album) ->
    Ref = make_ref(),  
    % Ref 作为唯一值，类似uuid, 
    % https://stackoverflow.com/questions/50799883/what-are-some-usages-for-make-ref-function-in-elixir
    % Pid = whereis(?ProcName),  whereis 可能会挂掉，既然会挂掉，所以不再调用这个函数, 防止牵连其他进程
    ?ProcName ! {self(), Ref, {Band, Album}},
    receive
        {Ref, Criticism} -> Criticism,  % 用 Ref作为唯一匹配
        io:format("judge2 return :Pid:[~p] ~p, ~n", [Ref, Criticism])
        %{Pid, Criticism} -> Criticism,  % 不再用Pid 作为唯一匹配
    after 2000 ->
        timeout
    end.

critic2() ->
    receive
        {From, Ref, {"Rage Against the Turing Machine", "Unit Testify"}} ->
            From ! {Ref, "They are great!"};  % 因为进程可变， Ref不变，所以这里以 Ref作为标记
        {From, Ref, {"System of a Downtime", "Memoize"}} ->
            From ! {Ref, "They're not Johnny Crash but they're good."};
        {From, Ref, {"Johnny Crash", "The Token Ring of Fire"}} ->
            From ! {Ref, "Simply incredible."};
        {From, Ref, {_Band, _Album}} ->
            From ! {Ref, "They are terrible!"}
    end,
    critic2().

start() ->
   start_critic2(),

   % 开启
   %1> register_name_restart_ref:start_critic2().
   %<0.82.0>
   
   % 获取评论
   %3> register_name_restart_ref:judge2("System of a Downtime", "Memoize").
   %judge2 return :Pid:[#Ref<0.4007996379.3322413057.261020>] "They're not Johnny Crash but they're good.",
   %


   %由于太阳风暴(要假装得更真实些)，通信的连接中断了。
   %4> exit(whereis(criticProcName), solar_storm).
   %restarter the Pid:[<0.88.0>]
   %true


   % 再次请求
   % 5> register_name_restart_ref:judge2("System of a Downtime", "Memoize").
   % judge2 return :Pid:[#Ref<0.4007996379.3322413057.261033>] "They're not Johnny Crash but they're good.",
   % ok


   'this is an end'.

