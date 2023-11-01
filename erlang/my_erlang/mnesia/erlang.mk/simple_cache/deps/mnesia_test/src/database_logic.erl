%% Copyright
-module(database_logic).
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

%% Initialise Database
initDB()->
    ok = mnesia:create_schema([node()]), 
    ok = mnesia:start(), 
	% application:start(mnesia), % 等价
    try
        Type = mnesia:table_info(factorial, type) 
    catch
        exit:_ ->
            mnesia:create_table(factorial, [{attributes, record_info(fields, factorial)},
                {type, bag},
                {disc_copies, [node()]}]) 
    end.

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
    Comments.

getDBTwo(NodeName)->
    AF = fun()->
        Query = qlc:q([X || X<- mnesia:table(factorial), X#factorial.nodeName =:= NodeName]), 
        Results =qlc:e(Query),
        lists:map(fun(Item)->{Item#factorial.comment, Item#factorial.createdOn} end, Results) 
    end,
    {atomic, Comments}= mnesia:transaction(AF), 
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
    mnesia:transaction(AF).



start() ->
    %mnesia:stop(),
    %database_logic:initDB(),
    %database_logic:storeDB(node(), "This is my first Mnesia"),
    %database_logic:getDB(node()),
	%database_logic:getDBTwo(node()),

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
