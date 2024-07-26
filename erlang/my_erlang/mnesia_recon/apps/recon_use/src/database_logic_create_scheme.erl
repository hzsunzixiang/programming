%% Copyright
-module(database_logic_create_scheme).
-author("ericksun").

-include_lib("stdlib/include/qlc.hrl").

%
-compile(export_all).
-compile(nowarn_export_all).

start() ->

    ok = mnesia:delete_schema([node()]), 

% 创建之后的目录变化
%	ericksun@centos-1:~/programming/erlang/my_erlang/mnesia (master)$ tree Mnesia.apple@centos-1
%	Mnesia.apple@centos-1
%	└── FALLBACK.BUP
    ok = mnesia:create_schema([node()]), 

% start 之后的目录变化
% ericksun@centos-1:~/programming/erlang/my_erlang/mnesia (master)$ md5sum Mnesia.apple@centos-1/*
% 57fab1cea81d477179ed092627d6b4eb  Mnesia.apple@centos-1/LATEST.LOG
% e2f18575401aa28262f1a085ccb870ff  Mnesia.apple@centos-1/schema.DAT

	mnesia:start(),

% delete_schema(Ns :: [node()]) -> result()
% 	Deletes a database created with mnesia:create_schema/1. mnesia:delete_schema/1 fails if any of the Erlang nodes given as DiscNodes are not alive, or if Mnesia is running on any of the nodes.
% 
% 	After the database is deleted, it can still be possible to start Mnesia as a disc-less node. This depends on how configuration parameter schema_location is set.
    % ok = mnesia:delete_schema([node()]), 
    "this is the end".

