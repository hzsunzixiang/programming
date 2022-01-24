%% Copyright
-module(database_logic).
-author("ericksun").

-include_lib("stdlib/include/qlc.hrl").

%% API
%-export([initDB/0, storeDB/2, getDB/1, getDBTwo/1]).
-compile(export_all).
-compile(nowarn_export_all).

-record(factorial, {nodeName, comment, createdOn}).

%% Initialise Database
initDB()->
    mnesia:create_schema([node()]), 
    mnesia:start(), 
    try
        mnesia:table_info(type, factorial) 
    catch
        exit:_ ->
            mnesia:create_table(factorial, [{attributes, record_info(fields, factorial)},
                {type, bag},
                {disc_copies, [node()]}]) 
    end.

storeDB(NodeName,Comment)->
    AF=fun()->
        {CreatedOn, _}=calender:universal_time(),
        mnesia:write(#factorial{nodeName=NodeName,comment=Comment,createdOn=CreatedOn}) 
    end,
    mnesia:transaction(AF).

getDB(NodeName) -> 
    AF = fun()->
        Query =qlc:q([X || X <- mnesia:table(factorial), 
            X#factorial.nodeName =:= NodeName]), 
        Results = qlc:e(Query),
        lists:map(fun(Item)-> Item#factorial.comment end, Results) 
    end,
    {atomic,Comments}=mnesia:transaction(AF), 
    Comments.

getDBTwo(NodeName)->
    AF =fun()->
        Query = qlc:q([X || X<- mnesia:table(factorial), 
        X#factorial.nodeName =:= NodeName]), 
        Results =qlc:e(Query),
        lists:map(fun(Item)->{Item#factorial.comment, Item#factorial.createdOn} end, Results) 
    end,
    {atomic, Comments}= mnesia:transaction(AF), 
    Comments.

deleteDB(NodeName)-> 
    AF =fun()->
        Query = qlc:q([X || X <- mnesia:table(factorial),
        X#factorial.nodeName =:= NodeName]), 
        Results = qlc:e(Query),

        F=fun()->
            list:foreach(fun(Result)-> 
                 mnesia:delete_object(Result) 
            end,Results) 
        end,
        mnesia:transaction(F) 
    end,
    mnesia:transaction(AF).



start() ->
    X=term_to_binary(7),
	io:format("term_to_binary :~p~n",[X]),
    X1=binary_to_term(X),
	io:format("term_to_binary :~p~n",[X1]).



