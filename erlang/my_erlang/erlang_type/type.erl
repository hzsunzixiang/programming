%% ---
-module(type).
-compile(export_all).
-compile(nowarn_export_all).



start() ->
   ListX = ['10'],
   [ListY|_] = ListX,
   Ix = list_to_integer(atom_to_list(ListY)),
   io:format("the format value:=~p~n",[Ix]),
   ListX.
% 这样也可以
%N=atom_to_binary(Y).
%K=binary_to_integer(N).

start(Number) ->
   ListX = Number,
   [ListY|_] = ListX,
   Ix = list_to_integer(atom_to_list(ListY)),
   io:format("the format value:=~p~n",[Ix]),
   ListX.


%   1> X=['10']
%   1> .
%   ['10']
%   2> [Y|Z]=X.
%   ['10']
%   3> Y
%   3> .
%   '10'
%   4> Z.
%   []
%   5> atom_to_integer(Y).
%   ** exception error: undefined shell command atom_to_integer/1
%   6> atom_to_list(Y).
%   "10"
%   7> atom_to_binary(Y).
%   <<"10">>
%   8> M=atom_to_list(Y).
%   "10"
%   9> list_to_integer(M).
%   10
