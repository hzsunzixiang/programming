%% Copyright
-module(database_logic_analyze).
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

%create_schema(Ns :: [node()]) -> result()
%	Creates a new database on disc. Various files are created in the local Mnesia directory of each node. Notice that the directory must be unique for each node. Two nodes must never share the same directory. If possible, use a local disc device to improve performance.
%	mnesia:create_schema/1 fails if any of the Erlang nodes given as DiscNodes are not alive, if Mnesia is running on any of the nodes, or if any of the nodes already have a schema. Use mnesia:delete_schema/1 to get rid of old faulty schemas.
%	Notice that only nodes with disc are to be included in DiscNodes. Disc-less nodes, that is, nodes where all tables including the schema only resides in RAM, must not be included.
%	result() = ok | {error, Reason :: term()}
    ok = mnesia:create_schema([node()]), 

%	start() -> result()
%	result() = ok | {error, Reason :: term()}
%
%	Mnesia startup is asynchronous. The function call mnesia:start() returns the atom ok and then starts to initialize the different tables. Depending on the size of the database, this can take some time, and the application programmer must wait for the tables that the application needs before they can be used. This is achieved by using the function mnesia:wait_for_tables/2.
% application:start(mnesia), % 等价
% 
% any() = any()
% All possible Erlang terms. Synonym for term().
% term() = any() 
% All possible Erlang terms. Synonym for any(). https://www.erlang.org/doc/man/erlang.html#type-term
% A piece of data of any data type is called a term. https://www.erlang.org/doc/reference_manual/data_types.html
%
% atom() = atom()
% An Erlang atom.
%
%
%table() = atom()
    ok = mmesia:start(), 
    try

% https://www.erlang.org/doc/man/mnesia.html#table_info-2
%	table_info(Tab :: table(), Item :: term()) -> Info :: term()
%	The table_info/2 function takes two arguments. The first is the name of a Mnesia table. The second is one of the following keys:
%	24>  mnesia:table_info(factorial,storage_type).
%	disc_copies
%	25>  mnesia:table_info(factorial,type).
%	bag
%	25>  mnesia:table_info(factorial,all).
%	all. 
%	access_mode. Returns the access mode of the table. The access mode can be read_only or read_write.
%	27>  mnesia:table_info(factorial, access_mode).
%	read_write
%	arity. 
%   28>  mnesia:table_info(factorial, arity).
%   4
%	attributes. 
%	29>  mnesia:table_info(factorial, attributes).
%	[nodeName,comment,createdOn]
%	checkpoints. 
%	cookie. 
%	31>  mnesia:table_info(factorial, cookie).
%	{{1643040695980035884,-576460752303423292,1},nonode@nohost
%	disc_copies.
%	32>  mnesia:table_info(factorial, disc_copies).
%	[nonode@nohost]
%	disc_only_copies. 
%	index. 
%	load_node. 
%	load_order. Returns the load order priority of the table. It is an integer and defaults to 0 (zero).
%	load_reason. 
%	local_content. 
%	master_nodes. 
%	memory. 
%	ram_copies. 
%	record_name. 
%	size. 
%	snmp. 
%	storage_type. 
%	subscribers. 
%	type. Returns the table type, which is bag, set, or ordered_set.
%	user_properties. 
%	version. Returns the current version of the table definition. The table version is incremented when the table definition is changed. The table definition can be incremented directly when it has been changed in a schema transaction, or when a committed table definition is merged with table definitions from other nodes during startup.
%	36>  mnesia:table_info(factorial, version).
%	{{2,0},[]}
%	where_to_read. 
%	where_to_write. 
%	wild_pattern. 
        mnesia:table_info(factorial, type) 
    catch
        exit:_ ->
%create_table(Name :: table(), Arg :: [create_option()]) ->
%                t_result(ok)
%Creates a Mnesia table called Name according to argument TabDef. This list must be a list of {Item, Value} tuples, where the following values are allowed:
            mnesia:create_table(factorial, [{attributes, record_info(fields, factorial)},
                {type, bag},
                {disc_copies, [node()]}]) 
    end.

storeDB(NodeName,Comment)->
    AF=fun()->

%write(Record :: tuple()) -> ok
%Calls the function mnesia:write(Tab, Record, write), where Tab is element(1, Record).
        {CreatedOn, _}=calendar:universal_time(),
        mnesia:write(#factorial{nodeName=NodeName,comment=Comment,createdOn=CreatedOn}) 
    end,

% transaction(Fun) -> t_result(Res)
    mnesia:transaction(AF).

getDB(NodeName) -> 
    AF = fun()->
% table(Tab :: table()) -> qlc:query_handle()
% Returns a Query List Comprehension (QLC) query handle, see the qlc(3) manual page in STDLIB. The module qlc implements a query language that can use Mnesia tables as sources of data. Calling mnesia:table/1,2 is the means to make the mnesia table Tab usable to QLC.


% q(QLC) -> QH
% QH = query_handle()  : A query handle.
% q(QLC, Options) -> QH
% Returns a query handle for a QLC. The QLC must be the first argument to this function, otherwise it is evaluated as an ordinary list comprehension. It is also necessary to add the following line to the source code:
% -include_lib("stdlib/include/qlc.hrl").
        Query = qlc:q([X || X <- mnesia:table(factorial), X#factorial.nodeName =:= NodeName]), 

% e(QH) -> Answers | Error
% answer() = term()
% answers() = [answer()]
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
        Query = qlc:q([X || X <- mnesia:table(factorial),
        X#factorial.nodeName =:= NodeName]), 
        Results = qlc:e(Query),

% delete_object(Rec :: tuple()) -> ok
% Calls mnesia:delete_object(Tab, Record, write), where Tab is element(1, Record).
        F = fun()->
            lists:foreach(fun(Result)-> mnesia:delete_object(Result) 
            end, Results) 
        end,
        mnesia:transaction(F) 
    end,
    mnesia:transaction(AF).



start() ->
    mnesia:stop(),
    database_logic:initDB(),
    database_logic:storeDB(node(), "This is my first Mnesia"),
    database_logic:getDB(node()),
	database_logic:getDBTwo(node()),

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
