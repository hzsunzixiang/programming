-module(chain).
-compile([export_all]).
-compile(nowarn_export_all).

myproc() ->
    timer:sleep(5000),
    exit(reason).

chain(0) ->
    receive
        _ -> ok
    after 2000 ->
        exit("chain dies here")
    end;
chain(N) ->
    Pid = spawn(fun() -> chain(N-1) end),
    link(Pid),
    receive
        _ -> ok
    end.

start() ->
   link(spawn(chain, chain, [3])),
   timer:sleep(60000),
   'this is an end'.


  % 1> link(spawn(chain,chain,[3])).
  % true
  % ** exception error: "chain dies here"

start1() ->
   process_flag(trap_exit, true),
   spawn_link(fun() -> chain(3) end),
   receive X -> X end,
   'this is an end'.

%   Eshell V12.2  (abort with ^G)
%	1> process_flag(trap_exit, true).
%	false
%	2> process_flag(trap_exit, true).
%	true
%	3>  spawn_link(fun() -> chain:chain(3) end).
%	<0.84.0>
%	4> receive X -> X end.
%   {'EXIT',<0.84.0>,"chain dies here"}


