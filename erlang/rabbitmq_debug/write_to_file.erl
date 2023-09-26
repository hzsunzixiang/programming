
f(),
%%%%%%%%%%%%%%% write to file 
LogFile="trace_classic_gm_join.1.txt",
LogPath="/home/ericksun/install/log/gm/",
SourcePath="/home/ericksun/install/rabbitmq_server-3.12.4/plugins",
SourceDirs=[SourcePath ++ "/rabbit-3.12.4/ebin", SourcePath ++ "/rabbit_common-3.12.4/ebin"],
DebugListItems=300000

LP = fun() -> [code:ensure_loaded(list_to_atom(filename:rootname(filename:basename(F)))) || P <- code:get_path(), F <- filelib:wildcard(P ++ "/*.beam")] end,
LP(),  %% sync
FileName= string:concat(LogPath, LogFile),
%% delete the file
file:delete(FileName),
file:make_dir(LogPath),
ListMod=[list_to_atom(filename:rootname(filename:basename(F))) || P <- SourceDirs, F <- filelib:wildcard(P ++ "/*.beam")],

DbgList = lists:foldl(fun(X, Sum) -> [{X, '_', fun(_) -> return_trace() end}] ++ Sum end, [], ListMod),
{ok, Dev} = file:open(FileName,[write]),
recon_trace:calls(DbgList, DebugListItems, [return_to, {scope, local}, {io_server, Dev}]),
ok.
