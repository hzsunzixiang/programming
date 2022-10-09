-module(client).
%-export([start_link/0]).
%-export([alloc/0, free/1]).
%%-export([init/1]).
-compile(export_all).
-compile(nowarn_export_all).

start_link() ->
    my_server:start_link(?MODULE).

allocate(Pid) ->
    Pid ! {self(), alloc},
    receive
        {?MODULE, Res} ->
            Res
    end.

freed(Pid, Ch) ->
    Pid ! {free, Ch},
    ok.

init() ->
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


write_debug(Dev, Event, Name) ->
    io:format(Dev, "~p event = ~p~n", [Name, Event]).
