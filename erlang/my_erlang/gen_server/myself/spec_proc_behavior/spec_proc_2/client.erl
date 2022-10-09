-module(client).
%-export([start_link/0]).
%-export([alloc/0, free/1]).
%%-export([init/1]).
-compile(export_all).
-compile(nowarn_export_all).

%start_link() ->
%    my_server:start_link().
%
%1> {ok,Pid}=client:start_link().
%{ok,<0.83.0>}
%2> client:alloc(Pid).
%here......AAAAAA
%here......BBBBBB
%here......CCCCCC
%1

start_link() ->
    my_server:start_link(?MODULE).

alloc(Pid) ->
    Pid ! {self(), alloc},
    receive
        {?MODULE, Res} ->
            Res
    end.

free(Pid, Ch) ->
    Pid ! {free, Ch},
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
