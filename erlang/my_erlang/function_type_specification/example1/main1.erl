-module(main1).
-compile([export_all]).
-compile(nowarn_export_all).

-type compare() :: fun((any(), any()) -> less | equal | greater).

-record(heap_node, { item :: any(), children :: [#heap_node{}] }).

-record(priority_queue, { root :: #heap_node{} | nil, comparer :: compare() }).

% https://stackoverflow.com/questions/46414994/cannot-create-a-spec-in-erlang
start() ->
    % and run Dialyzer, I get:
    % Record construction #priority_queue{root::'nil',comparer::fun((_) -> 'equal')} violates the declared type of field comparer::fun((_,_) -> 'equal' | 'greater' | 'less')
    #priority_queue{root = nil, comparer = fun(_) -> equal end},
    'this is the end'.


%A record is a data structure for storing a fixed number of elements. It has named fields and is similar to a struct in C. However, a record is not a true data type. Instead, record expressions are translated to tuple expressions during compilation. Therefore, record expressions are not understood by the shell unless special actions are taken. For details, see the shell(3) manual page in STDLIB).
%
%Examples:
%
%-module(person).
%-export([new/2]).
%
%-record(person, {name, age}).
%
%new(Name, Age) ->
%    #person{name=Name, age=Age}.
%
%	1> person:new(ernie, 44).
%	{person,ernie,44}
