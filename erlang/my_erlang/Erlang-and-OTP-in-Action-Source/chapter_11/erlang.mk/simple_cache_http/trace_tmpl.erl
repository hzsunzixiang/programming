
f().
%% load all the modules
{ok, CurrentDir} = file:get_cwd().
LogFileName = "/trace_http1030.1.txt".
LogDir = CurrentDir ++ "/trace_log".
%LogPath="/home/ericksun/program/rabbitmq-server-debug/rabbitmq_prelaunch-sup-dist/trace_log/".
LogNum=500000,
LP = fun() -> [code:ensure_loaded(list_to_atom(filename:rootname(filename:basename(F)))) || P <- code:get_path(), F <- filelib:wildcard(P ++ "/*.beam")] end.
LP().  %% sync
FileName= string:concat(LogDir, LogFileName).  %LogPath = LogDir ++ LogFileName.
file:delete(FileName).
file:make_dir(LogDir).

DirTmp=[gen_web_server,  http_interface,   resource_discovery, simple_cache].

DirDel=[].

DirsNoPrefix=DirTmp--DirDel.

{ok, CurrentDir} = file:get_cwd().
Prefix = CurrentDir ++ "/deps/".
Dirs = [Prefix++atom_to_list(P) || P <- DirsNoPrefix].
ListModAll=[list_to_atom(filename:rootname(filename:basename(F))) || P <- Dirs, F <- filelib:wildcard(P ++ "/ebin/*.beam")].
ListModeAdd=[gen_tcp, mnesia, net_adm].

ListMod=ListModAll++ListModeAdd.
%lists:member(rabbit_env,  ListMod).
DbgList = lists:foldl(fun(X, Sum) -> [{X, '_', fun(_) -> return_trace() end}] ++ Sum end, [], ListMod).
{ok, Dev} = file:open(FileName,[write]).
recon_trace:calls(DbgList, LogNum, [return_to, {scope, local}, {io_server, Dev}]).

