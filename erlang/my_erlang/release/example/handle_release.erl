%erl -pa bsc/ebin/
% 用这个文件来生成 boot文件
-module(handle_release).
-compile(export_all).
-compile(nowarn_export_all).

start() -> 
    % 生成boot和script文件, 这里不会关心beam文件
    systools:make_script("basestation", [{path, ["bsc/ebin"]}]),
    % 生成tar包, 这里需要使用beam文件
	% systools:make_tar ("basestation",[{erts, "/usr/lib64/erlang"}, {path, ["bsc/ebin"]}, {outdir, "ernie"}]),
	'this is an end'.
