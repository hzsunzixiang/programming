-module(my_server).
%-export([start_link/1]).
%-export([init/1]).
%-export([system_continue/3, system_terminate/4,
%         write_debug/3,
%         system_get_state/1, system_replace_state/2]).
-compile(export_all).
-compile(nowarn_export_all).

start_link(Module) ->
    register(?MODULE, self()),
    proc_lib:start_link(?MODULE, init, [self(), Module]).

init(Parent, Module) ->
    register(Module, self()),
    Chs = channels(),
    Deb = sys:debug_options([]),
    proc_lib:init_ack(Parent, {ok, self()}),  % The new process must also acknowledge that it has been started to the parent:
	% proc_lib:start_link is synchronous and does not return until proc_lib:init_ack has been called.
	% 在这里成功就可以返回了
    loop(Module, Chs, Parent, Deb).

loop(Module, Chs, Parent, Deb) ->
    receive
        {From, alloc} ->
		    io:format("here......AAAAAA~n"),
            %Deb2 = sys:handle_debug(Deb, fun Module:write_debug/3,
            %                        Module, {in, alloc, From}),
            {Ch, Chs2} = alloc(Chs),
		    io:format("here......BBBBBB~n"),
            From ! {Module, Ch},
		    io:format("here......CCCCCC~n"),
            %Deb3 = sys:handle_debug(Deb2, fun Module:write_debug/3,
            %                        Module, {out, {Module, Ch}, From}),
            %loop(Module, Chs2, Parent, Deb3);
            loop(Module, Chs2, Parent, Deb);
        {free, Ch} ->
            %Deb2 = sys:handle_debug(Deb, fun Module:write_debug/3,
            %                        Module, {in, {free, Ch}}),
            Chs2 = free(Ch, Chs),
            %loop(Module, Chs2, Parent, Deb2)
            loop(Module, Chs2, Parent, Deb)

        %{system, From, Request} ->
        %    sys:handle_system_msg(Request, From, Parent,
        %                          Module, Deb, Chs)
    end.

%system_continue(Parent, Deb, Chs) ->
%    loop(Chs, Parent, Deb).
%
%system_terminate(Reason, _Parent, _Deb, _Chs) ->
%    exit(Reason).
%
%system_get_state(Chs) ->
%    {ok, Chs}.
%
%system_replace_state(StateFun, Chs) ->
%    NChs = StateFun(Chs),
%    {ok, NChs, NChs}.
%
%write_debug(Dev, Event, Name) ->
%    io:format(Dev, "~p event = ~p~n", [Name, Event]).
%

channels() ->
   {_Allocated = [], _Free = lists:seq(1,100)}.

alloc({Allocated, [H|T] = _Free}) ->
   {H, {[H|Allocated], T}}.

free(Ch, {Alloc, Free} = Channels) ->
   case lists:member(Ch, Alloc) of
      true ->
         {lists:delete(Ch, Alloc), [Ch|Free]};
      false ->
         Channels
   end.   
