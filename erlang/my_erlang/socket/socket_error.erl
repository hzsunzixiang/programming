%% ---
-module(socket_error).
-compile(export_all).
-compile(nowarn_export_all).
-import(lists, [reverse/1]).


error_test() ->
    spawn(fun() -> error_test_server() end),
    lib_misc:sleep(2000),
    {ok,Socket} = gen_tcp:connect("localhost",4321,[binary, {packet, 2}]),
    io:format("connected to:~p~n",[Socket]),
    gen_tcp:send(Socket, <<"123">>),
    receive
	Any ->
	    io:format("Any=~p~n",[Any])
    end.

error_test_server() ->
    {ok, Listen} = gen_tcp:listen(4321, [binary,{packet,2}]),
    {ok, Socket} = gen_tcp:accept(Listen),
    error_test_server_loop(Socket).

error_test_server_loop(Socket) ->
    receive
	{tcp, Socket, Data} ->
	    io:format("received:~p~n",[Data]),
	    %Result = atom_to_list(Data),
	    _ = atom_to_list(Data),
	    %io:format("received here :~p~n",[Result]),
	    error_test_server_loop(Socket)
    end.

start() ->
   error_test().


% erl -noshell -s socket_error start -s init stop
% =ERROR REPORT==== 2-Jan-2022::07:42:12.097928 ===
% Error in process <0.77.0> with exit value:
% {{badmatch,{error,eaddrinuse}},
%  [{socket_error,error_test_server,0,[{file,"socket_error.erl"},{line,20}]}]}
% 
% 
% 
% {"init terminating in do_boot",{{badmatch,{error,econnrefused}},[{socket_error,error_test,0,[{file,"socket_error.erl"},{line,11}]},{init,start_em,1,[]},{init,do_boot,3,[]}]}}
% init terminating in do_boot ({{badmatch,{error,econnrefused}},[{socket_error,error_test,0,[{_},{_}]},{init,start_em,1,[]},{init,do_boot,3,[]}]})
% 
% Crash dump is being written to: erl_crash.dump...done
% make: *** [Makefile:20: all] Error 1

