4> regs().

** Registered procs on node nonode@nohost **
Name                  Pid          Initial Call                      Reds Msgs
application_controlle <0.44.0>     erlang:apply/2                     838    0
code_server           <0.50.0>     erlang:apply/2                  139411    0
erl_prim_loader       <0.10.0>     erlang:apply/2                  284414    0
erl_signal_server     <0.60.0>     gen_event:init_it/6                 51    0
erts_code_purger      <0.1.0>      erts_code_purger:start/0             8    0
file_server_2         <0.59.0>     file_server:init/1                 140    0
frequency             <0.83.0>     frequency:init/1                    36    0
global_group          <0.58.0>     global_group:init/1                104    0
global_name_server    <0.55.0>     global:init/1                      193    0
inet_db               <0.51.0>     inet_db:init/1                     367    0
init                  <0.0.0>      erl_init:start/2                  4791    0
kernel_refc           <0.68.0>     kernel_refc:init/1                  65    0
kernel_safe_sup       <0.69.0>     supervisor:kernel/1                 97    0
kernel_sup            <0.49.0>     supervisor:kernel/1               2964    0
logger                <0.42.0>     logger_server:init/1               667    0
logger_handler_watche <0.71.0>     logger_handler_watcher:in           56    0
logger_proxy          <0.72.0>     logger_olp:init/1                   94    0
logger_std_h_default  <0.74.0>     logger_olp:init/1                  181    0
logger_sup            <0.70.0>     supervisor:logger_sup/1            420    0
rex                   <0.53.0>     rpc:init/1                          39    0
socket_registry       <0.7.0>      socket_registry:start/0              8    0
standard_error        <0.62.0>     erlang:apply/2                      16    0
standard_error_sup    <0.61.0>     supervisor_bridge:standar           56    0
user                  <0.65.0>     group:server/3                     114    0
user_drv              <0.64.0>     user_drv:server/2                11741    0

** Registered ports on node nonode@nohost **
Name                  Id              Command
ok


https://www.erlang.org/doc/man/sys.html#type-system_event

system_event() =
    {in, Msg :: term()} |
    {in, Msg :: term(), State :: term()} |
    {out, Msg :: term(), To :: term()} |
    {out, Msg :: term(), To :: term(), State :: term()} |
    {noreply, State :: term()} |
    {continue, Continuation :: term()} |
    {postpone,
     Event :: term(),
     State :: term(),
     NextState :: term()} |
    {consume,
     Event :: term(),
     State :: term(),
     NextState :: term()} |
    {start_timer, Action :: term(), State :: term()} |
    {insert_timeout, Event :: term(), State :: term()} |
    {enter, Module :: module(), State :: term()} |
    {module, Module :: module(), State :: term()} |
    {terminate, Reason :: term(), State :: term()} |
    term()


{out,Msg,To,State}
Is produced by gen_server when the reply Msg is sent back to To by returning a {reply,...} tuple from the callback module.

To is of the same type as the first argument to gen_server:reply/2.

State is the new server state.


dbg_fun() =
    fun((FuncState :: term(),
         Event :: system_event(),
         ProcState :: term()) ->
            done | (NewFuncState :: term()))

F = fun(Count,{out, {error, no_frequency}, Pid, _LoopData}, ProcData) ->
        io:format("*DBG* Warning, Client ~p refused frequency! Count:~w~n", [Pid, Count]),
        Count + 1;
        (Count, _, _) ->
        Count
    end.


17> F = fun(Count,{out, {error, no_frequency}, Pid, _LoopData}, ProcData) ->
17>         io:format("*DBG* Warning, Client ~p refused frequency! Count:~w~n", [Pid, Count]),
17>         Count + 1;
17>         (Count, _, _) ->
17>         Count
17>     end.
#Fun<erl_eval.40.3316493>
18> sys:install(frequency, {F, 1}).
ok
19> frequency:allocate(), frequency:allocate(), frequency:allocate().
{ok,13}
20> frequency:allocate(), frequency:allocate(), frequency:allocate().
*DBG* Warning, Client {<0.81.0>,[alias|#Ref<0.1375521932.647036929.117885>]} refused frequency! Count:1
{error,no_frequency}
21> frequency:allocate(), frequency:allocate(), frequency:allocate().
*DBG* Warning, Client {<0.81.0>,[alias|#Ref<0.1375521932.647036929.117892>]} refused frequency! Count:2
*DBG* Warning, Client {<0.81.0>,[alias|#Ref<0.1375521932.647036929.117895>]} refused frequency! Count:3
*DBG* Warning, Client {<0.81.0>,[alias|#Ref<0.1375521932.647036929.117898>]} refused frequency! Count:4
{error,no_frequency}
22> frequency:allocate(), frequency:allocate(), frequency:allocate().
*DBG* Warning, Client {<0.81.0>,[alias|#Ref<0.1375521932.647036929.117905>]} refused frequency! Count:5
*DBG* Warning, Client {<0.81.0>,[alias|#Ref<0.1375521932.647036929.117908>]} refused frequency! Count:6
*DBG* Warning, Client {<0.81.0>,[alias|#Ref<0.1375521932.647036929.117911>]} refused frequency! Count:7
{error,no_frequency}
23> frequency:allocate().
*DBG* Warning, Client {<0.81.0>,[alias|#Ref<0.1375521932.647036929.117918>]} refused frequency! Count:8
{error,no_frequency}
24> sys:remove(frequency, F).
ok
25> frequency:allocate().
{error,no_frequency}


install 的解析 F 返回  FuncState 

install(Name, FuncSpec) -> ok
install(Name, FuncSpec, Timeout) -> ok
Types
Name = name()
FuncSpec = {Func, FuncState} | {FuncId, Func, FuncState}
FuncId = term()
Func = dbg_fun()
FuncState = term()
Timeout = timeout()
Enables installation of alternative debug functions. An example of such a function is a trigger, a function that waits for some special event and performs some action when the event is generated. For example, turning on low-level tracing.

Func is called whenever a system event is generated. This function is to return done, or a new Func state. In the first case, the function is removed. It is also removed if the function fails. If one debug function should be installed more times, a unique FuncId must be specified for each installation.
