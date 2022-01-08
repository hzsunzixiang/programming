-module(monitor).
-compile([export_all]).
-compile(nowarn_export_all).



%Erlang/OTP 24 [erts-12.2] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [jit]
%
%Eshell V12.2  (abort with ^G)
%1> erlang:monitor(process, spawn(fun()->timer:sleep(500) end)).
%#Ref<0.4120464035.4202168321.71380>
%2> flush().
%Shell got {'DOWN',#Ref<0.4120464035.4202168321.71380>,process,<0.82.0>,normal}
%ok


start() ->
   Return =  erlang:monitor(process, spawn(fun()->timer:sleep(500) end)),
   io:format("return :~p, ~n", [Return]),
   %{Pid, Ref}=  spawn_monitor(fun()-> receive _ -> exit(boom) end end). 
   {Pid, Ref}=  spawn_monitor(fun()-> 
                                     receive _ ->
                                                 exit(boom) 
                                     end 
                              end),
   % erlang:demonitor(Ref)
   % erlang:demonitor(Ref, [flush, info])
   io:format("return :~p, ~n", [{Pid,Ref}]),
   'this is an end'.
