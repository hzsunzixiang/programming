-module(logger_my).
-compile(export_all).
-compile(nowarn_export_all).
-behaviour(gen_event).
-export([start/0]).

init({standard_io, {Fd, Count}}) when is_pid(Fd) ->
    file:close(Fd),
    {ok, {standard_io, Count}};
init({File, {standard_io, Count}}) when is_list(File) ->
    {ok, Fd} = file:open(File, write),
    {ok, {Fd, Count}};

init(standard_io)  ->
    {ok, {standard_io, 1}};
init({file, File}) ->
    {ok, Fd} = file:open(File, write),
	io:format("init file:~p~n", [{Fd}]),
    {ok, {Fd, 1}};
init(Args) ->
    {error, {args, Args}}.

%% 这里的 {Type, Count} 类似 init 中的 {Fd, Count} {standard_io, Count}
%% 其中 Type 对应的就是描述符  
%% 这里的返回值 {Type, Count} 传递给 init函数
terminate(swap, {Type, Count}) ->
	io:format("terminate swap :~p~n", [{Type, Count}]),
    {Type, Count};
terminate(_Reason, {standard_io, Count}) ->
    {count, Count};
terminate(_Reason, {Fd, Count}) ->
    file:close(Fd),
    {count, Count}.

handle_event(Event, {Fd, Count}) ->
    print(Fd, Count, Event, "Event"),
    {ok, {Fd, Count+1}}.

handle_info(Event, {Fd, Count}) ->
    print(Fd, Count, Event, "Unknown"),
    {ok, {Fd, Count+1}}.

print(Fd, Count, Event, Tag) ->
    io:format(Fd, "Id:~w Time:~w Date:~w~n"++Tag++":~w~n",
              [Count, time(),date(),Event]).
start1() ->
    {ok, P} = gen_event:start(),
    gen_event:add_handler(P, logger_my, {file, "alarmlog.log"}),
	gen_event:notify(P, {set_alarm, {no_frequency, self()}}),
	gen_event:sync_notify(P, {clear_alarm, no_frequency}),
	P ! sending_junk,
	{ok, Binary} = file:read_file("alarmlog.log"),
	io:format(Binary),
	gen_event:delete_handler(P, freq_overload, stop),
    'this is an end'.


start() ->
    {ok, P} = gen_event:start(),
    gen_event:add_handler(P, logger_my, {file, "alarmlog.log"}),
    gen_event:notify(P, {set_alarm, {no_frequency, self()}}),
    gen_event:swap_handler(P, {logger_my, swap}, {logger_my, standard_io}),
    gen_event:notify(P, {set_alarm, {no_frequency, self()}}),
    {ok, Binary}=file:read_file("alarmlog.log"), 
	io:format("~n~nbegin read file~n"),
	io:format(Binary),
    'this is an end'.


