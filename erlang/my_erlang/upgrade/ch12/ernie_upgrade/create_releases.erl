%erl -pa bsc/ebin/
% 用这个文件来生成 boot文件
-module(create_releases).
-compile(export_all).
-compile(nowarn_export_all).

% 需要再erl命令下执行
start() -> 
    ReleaseName="coffee-1.0",
    RootDir = code:root_dir(),
    Releases = RootDir ++ "/releases",
    RelFile = Releases ++ "/" ++ ReleaseName ++ ".rel",
    release_handler:create_RELEASES(RootDir, Releases, RelFile, []),
	'this is an end'.




