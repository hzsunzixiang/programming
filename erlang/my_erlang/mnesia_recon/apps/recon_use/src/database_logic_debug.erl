%% Copyright
-module(database_logic_debug).
-author("ericksun").

-include_lib("stdlib/include/qlc.hrl").

%% API
%-export([initDB/0, storeDB/2, getDB/1, getDBTwo/1]).
%
%22> record_info(fields, factorial).
%[nodeName,comment,createdOn]
%
-compile(export_all).
-compile(nowarn_export_all).

-record(factorial, {nodeName, comment, createdOn}).

#We have to define the record in the shell in order to be able use the record syntax in the examples:
#
#> rd(factorial, {nodeName, comment, createdOn}).
#person

%% Initialise Database
initDB()->
    io:format("initDB table factorial: ~n"),
    ok = deleteScheme([node()]),  % 先保证DB不存在
    ok = mnesia:create_schema([node()]), 
    ok = mnesia:start(), 
	%% application:start(mnesia), % 等价
    try
        Type = mnesia:table_info(factorial, type), 
        io:format("table type message: ~p~n",[Type])
    catch
        exit:_ ->
            io:format("catch table factorial  not exist: ~n"),
            Result = mnesia:create_table(factorial, [{attributes, record_info(fields, factorial)},
                {type, bag},
                {disc_copies, [node()]}]),
            io:format("create table result: ~p~n",[Result])
    end,
    'this is fun end'.


storeDB(NodeName,Comment)->
    AF=fun()->
        {CreatedOn, _}=calendar:universal_time(),
        mnesia:write(#factorial{nodeName=NodeName,comment=Comment,createdOn=CreatedOn}) 
    end,
    mnesia:transaction(AF).

getDB(NodeName) -> 
    AF = fun()->
        Query = qlc:q([X || X <- mnesia:table(factorial), X#factorial.nodeName =:= NodeName]), 
        Results = qlc:e(Query),
        lists:map(fun(Item)-> Item#factorial.comment end, Results) 
    end,
    {atomic,Comments}=mnesia:transaction(AF), 
    io:format("create table result: ~p~n",[Comments]),
    Comments.

getDBTwo(NodeName)->
    AF = fun()->
        Query = qlc:q([X || X<- mnesia:table(factorial), X#factorial.nodeName =:= NodeName]), 
        Results =qlc:e(Query),
        lists:map(fun(Item)->{Item#factorial.comment, Item#factorial.createdOn} end, Results) 
    end,
    {atomic, Comments}= mnesia:transaction(AF), 
    io:format("create table result: ~p~n",[Comments]),
    Comments.

deleteDB(NodeName)-> 
    AF = fun()->
        Query = qlc:q([X || X <- mnesia:table(factorial), X#factorial.nodeName =:= NodeName]), 
        Results = qlc:e(Query),

        F = fun()->
            lists:foreach(fun(Result)-> mnesia:delete_object(Result) end, Results) 
        end,
        mnesia:transaction(F) 
    end,
    Result = mnesia:transaction(AF),
    io:format("deleteDB table result: ~p~n", [Result]).

deleteScheme(NodeName)-> 
    ok = mnesia:delete_schema(NodeName).


start() ->
    database_logic_debug:initDB(),
    database_logic_debug:storeDB(node(), "This is my first Mnesia"),
    database_logic_debug:storeDB(node(), "This is my first Mnesia Again"),
    database_logic_debug:getDB(node()),
	database_logic_debug:getDBTwo(node()),

    % 删除
	database_logic_debug:deleteDB(node()),
	database_logic_debug:getDBTwo(node()),
    mnesia:stop(),

    "this is the end".

% 在shell中声明 record https://til.hashrocket.com/posts/tfirkok3ac-declaring-erlang-records-in-a-shell
% 10> rd(factorial, {nodeName, comment, createdOn}).
% factorial
%
%
% To each module using records, a pseudo function is added during compilation to obtain information about records:
%
% record_info(fields, Record) -> [Field]
% record_info(size, Record) -> Size
% Size is the size of the tuple representation, that is, one more than the number of fields.
