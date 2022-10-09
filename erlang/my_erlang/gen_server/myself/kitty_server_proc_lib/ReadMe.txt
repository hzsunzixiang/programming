

这个还没有实验出来  2022.10.8

试验出来了； 2022.10.9 : 原因是 
这行写错了
    proc_lib:start_link(Module, init, [self(), Module, InitialState, Deb]).
应该为
    proc_lib:start_link(?MODULE, init, [self(), Module, InitialState, Deb]).



% 刚开始无法调试或者获取不到信息 
成功了： 

	         sys:handle_system_msg(Msg, From, Parent, ?MODULE, Debug, {Module, LoopStatus})
			Module 改为 ?MODULE 就可以成功了
	         sys:handle_system_msg(Msg, From, Parent, ?MODULE, Debug, {Module, LoopStatus})

调试没有任何信息，需要传递 NewDebug
	         NewDebug = sys:handle_debug(Debug, fun debug/3, Module, {async, Msg}),

Eshell V13.0.4  (abort with ^G)
1> {ok, ServerPid}=kitty_server2:start_link().
mutex kitty_server2: init
{ok,<0.83.0>}
2> sys:log(kitty_server2, true).
ok
3> sys:statistics(kitty_server2,true).
ok
4> Cat1 = kitty_server2:order_cat(ServerPid, carl_1, brown, "loves to burn bridges").
sync in loop LoopStatus: []
mutex kitty_server2: {reply,{cat,carl_1,brown,[108,111,118,101,115,32,116,111,32,98,117,114,110,32,98,114,105,100,103,101,115]},[]}
{cat,carl_1,brown,"loves to burn bridges"}
5> Cat2 = kitty_server2:order_cat(ServerPid, carl_2, brown, "loves to burn bridges").
sync in loop LoopStatus: []
mutex kitty_server2: {reply,{cat,carl_2,brown,[108,111,118,101,115,32,116,111,32,98,117,114,110,32,98,114,105,100,103,101,115]},[]}
{cat,carl_2,brown,"loves to burn bridges"}
6> sys:log(kitty_server2, print).
mutex kitty_server2: {reply,{cat,carl_1,brown,[108,111,118,101,115,32,116,111,32,98,117,114,110,32,98,114,105,100,103,101,115]},[]}
mutex kitty_server2: {reply,{cat,carl_2,brown,[108,111,118,101,115,32,116,111,32,98,117,114,110,32,98,114,105,100,103,101,115]},[]}
ok
7> sys:log(kitty_server2, get).
{ok,[{reply,{cat,carl_1,brown,"loves to burn bridges"},[]},
     {reply,{cat,carl_2,brown,"loves to burn bridges"},[]}]}

8> kitty_server2:return_cat(ServerPid, Cat1).
mutex kitty_server2: {async,{return,{cat,carl_1,brown,[108,111,118,101,115,32,116,111,32,98,117,114,110,32,98,114,105,100,103,101,115]}}}
ok
async in loop LoopStatus: [{cat,carl_1,brown,"loves to burn bridges"}]
9> sys:log(kitty_server2, get).
{ok,[{reply,{cat,carl_1,brown,"loves to burn bridges"},[]},
     {reply,{cat,carl_2,brown,"loves to burn bridges"},[]},
     {async,{return,{cat,carl_1,brown,
                         "loves to burn bridges"}}}]}

10> sys:log(kitty_server2, print).
mutex kitty_server2: {reply,{cat,carl_1,brown,[108,111,118,101,115,32,116,111,32,98,117,114,110,32,98,114,105,100,103,101,115]},[]}
mutex kitty_server2: {reply,{cat,carl_2,brown,[108,111,118,101,115,32,116,111,32,98,117,114,110,32,98,114,105,100,103,101,115]},[]}
mutex kitty_server2: {async,{return,{cat,carl_1,brown,[108,111,118,101,115,32,116,111,32,98,117,114,110,32,98,114,105,100,103,101,115]}}}
ok

