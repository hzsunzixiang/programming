-module(client).
-export([start_link/0]).
-export([alloc/0, free/1]).
%-export([init/1]).

start_link() ->
    my_server:start_link().

alloc() ->
    ch4 ! {self(), alloc},
    receive
        {ch4, Res} ->
            Res
    end.

free(Ch) ->
    ch4 ! {free, Ch},
    ok.


%channels() ->
%   {_Allocated = [], _Free = lists:seq(1,100)}.
%
%alloc({Allocated, [H|T] = _Free}) ->
%   {H, {[H|Allocated], T}}.
%
%free(Ch, {Alloc, Free} = Channels) ->
%   case lists:member(Ch, Alloc) of
%      true ->
%         {lists:delete(Ch, Alloc), [Ch|Free]};
%      false ->
%         Channels
%   end.   
