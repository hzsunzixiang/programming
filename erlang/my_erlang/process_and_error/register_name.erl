-module(register_name).
-compile([export_all]).
-compile(nowarn_export_all).


start_critic() ->
    spawn(?MODULE, critic, []).

judge(Pid, Band, Album) ->
    Pid ! {self(), {Band, Album}},
    receive
        {Pid, Criticism} -> Criticism
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
   Critic=register_name:start_critic(),

   %io:format("return :~p, ~n", [Critic]),
   %1> Critic=register_name:start_critic().
   %<0.82.0>
   %3> register_name:judge(Critic, "Genesis", "The Lambda Lies Down on Broadway").
   %"They are terrible!"
   %4> register_name:judge(Critic, "System of a Downtime", "Memoize").
   %"They're not Johnny Crash but they're good."
   %


   % 这里被覆盖了，。。。。
   %由于太阳风暴(要假装得更真实些)，通信的连接中断了。
   %6> exit(Critic, solar_storm).
   %restarter the Pid:[<0.90.0>]
   %true

   % 再次请求
   %8> register_name:judge(Critic, "System of a Downtime", "Memoize").
   %judge2 return :Pid:[<0.90.0>] "They're not Johnny Crash but they're good.",
   %ok

   'this is an end'.
