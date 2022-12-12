%erl -pa bsc/ebin/
% 用这个文件来生成 boot文件
-module(handle_release).
-compile(export_all).
-compile(nowarn_export_all).

start() -> 
    % 处理 1.0
    ReleaseName="coffee-1.0",
    % 生成boot和script文件, 这里不会关心beam文件
    % systools:make_script(ReleaseName, [{path, ["bsc/ebin"]}]),
    % systools:make_script(ReleaseName, [local, {path, [ReleaseName ++ "/ebin"]}]),
    systools:make_script(ReleaseName, [{path, [ReleaseName ++ "/ebin"]}]),
    % 生成tar包, 这里需要使用beam文件
	% file:make_dir(ReleaseName ++ "_release"),
	systools:make_tar(ReleaseName, [{erts, code:root_dir()}, {path, [ReleaseName ++ "/ebin"]}, {outdir, ReleaseName ++ "_release"}]),
	%systools:make_tar(ReleaseName, [{erts, "/home/ericksun/program/otp-25.0.4/lib/erlang"}, {path, ["bsc/ebin"]}, {outdir, "ernie"}]),
	%
    % 处理 1.1
	
    ReleaseNameUpgrade="coffee-1.1",
	ReleaseNameWilcard="coffee*",
    systools:make_script(ReleaseNameUpgrade, [{path, [ReleaseNameUpgrade ++ "/ebin"]}]),
    systools:make_relup(ReleaseNameUpgrade,  [ReleaseNameUpgrade], [ReleaseNameUpgrade], [{path, [ReleaseNameWilcard ++ "/ebin"]}]),
    % 不要这个选项了 {erts, code:root_dir()},
	systools:make_tar(ReleaseNameUpgrade, [ {path, [ReleaseNameUpgrade ++ "/ebin"]}, {outdir, ReleaseName ++ "_release"}]),


	'this is an end'.
