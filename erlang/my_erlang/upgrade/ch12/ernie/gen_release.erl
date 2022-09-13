%erl -pa bsc/ebin/
% 用这个文件来生成 boot文件
-module(gen_release).
-compile(export_all).
-compile(nowarn_export_all).

start() -> 
    RootDir = "/data/github/program/programming/erlang/my_erlang/upgrade/ch12/ernie",
    Releases= RootDir ++ "/releases",
    RelFile  = Releases ++ "/coffee-1.0.rel",
    release_handler:create_RELEASES(RootDir, Releases, RelFile, []),
	'this is an end'.



%1> application:which_applications() .
%[{coffee,"Coffee Machine Controller","1.0"},
% {sasl,"SASL  CXC 138 11","4.1.1"},
% {stdlib,"ERTS  CXC 138 10","3.17"},
% {kernel,"ERTS  CXC 138 10","8.2"}]
%2> RootDir = code: root_dir().
%"/data/github/program/programming/erlang/my_erlang/upgrade/ch12/ernie"
%3> Releases= RootDir ++ "/releases".
%"/data/github/program/programming/erlang/my_erlang/upgrade/ch12/ernie/releases"
%4> RelFile  = Releases ++ "/coffee-1.0.rel".
%"/data/github/program/programming/erlang/my_erlang/upgrade/ch12/ernie/releases/coffee-1.0.rel"
%5> release_handler:create_RELEASES(RootDir, Releases, RelFile, [ ]).
%ok
%
