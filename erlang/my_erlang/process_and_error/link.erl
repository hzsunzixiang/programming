-module(link).
-compile([export_all]).
-compile(nowarn_export_all).

myproc() ->
    timer:sleep(5000),
    exit(reason).
start() ->
   spawn(fun link:myproc/0),
   link(spawn(fun link:myproc/0)),
   'this is an end'.

   % 本进程被重启了
   % 3> self().
   % <0.86.0>
   % 4> link(spawn(fun link:myproc/0)).
   % true
   % ** exception error: reason
   % 5> self().
   % <0.90.0>

