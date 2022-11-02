%erl -pa bsc/ebin/
% 用这个文件来生成 boot文件
-module(handle_release).
-compile(export_all).
-compile(nowarn_export_all).

start() -> 
    RelaseName="simple_cache",
    OptName1="resource_discovery",
    % 生成boot和script文件, 这里不会关心beam文件
    % systools:make_script(RelaseName, [{path, ["bsc/ebin"]}]),
    systools:make_script(RelaseName, [local, {path, [RelaseName ++ "/ebin", OptName1 ++ "/ebin"]}]),
    % 生成tar包, 这里需要使用beam文件
	% systools:make_tar(RelaseName, [{erts, code:root_dir()}, {path, ["bsc/ebin"]}, {outdir, RelaseName ++ "_release"}]),
	%systools:make_tar(RelaseName, [{erts, "/home/ericksun/program/otp-25.0.4/lib/erlang"}, {path, ["bsc/ebin"]}, {outdir, "ernie"}]),
	'this is an end'.
